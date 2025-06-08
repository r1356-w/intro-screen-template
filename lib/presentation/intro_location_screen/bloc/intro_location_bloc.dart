import 'dart:async';
import 'package:dowerly/core/global_imports.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:permission_handler/permission_handler.dart';

part 'intro_location_event.dart';
part 'intro_location_state.dart';

class IntroLocationBloc extends Bloc<IntroLocationEvent, IntroLocationState> {
  IntroLocationBloc() : super(IntroLocationInitialState()) {
    on<InitializeMapEvent>(_onInitializeMap);
    on<GetUserLocationEvent>(_onGetUserLocation);
    on<UpdateUserLocationEvent>(_onUpdateUserLocation);
    on<SearchPlaceEvent>(_onSearchPlace);
    on<ClearSearchEvent>(_onClearSearch);
    on<RetryLoadingEvent>(_onRetryLoading);
  }

  late final MapController mapController = MapController();
  final TextEditingController searchController = TextEditingController();

  Future<bool> _checkInternetConnection() async {
    final connectivityResult = await Connectivity().checkConnectivity();
    return connectivityResult != ConnectivityResult.none;
  }

  Future<bool> _checkLocationPermission() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw Exception('خدمة الموقع معطلة. يرجى تفعيلها من الإعدادات');
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception('تم رفض صلاحيات الموقع');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      await openAppSettings();
      throw Exception('تم رفض الصلاحيات بشكل دائم. يرجى التفعيل من الإعدادات');
    }

    return permission == LocationPermission.whileInUse ||
        permission == LocationPermission.always;
  }

  Future<void> _onInitializeMap(
    InitializeMapEvent event,
    Emitter<IntroLocationState> emit,
  ) async {
    emit(IntroLocationLoadingState());

    try {
      final hasConnection = await _checkInternetConnection();
      if (!hasConnection) {
        emit(
          IntroLocationErrorState(
            message: 'لا يوجد اتصال بالإنترنت. يرجى التحقق من الاتصال',
          ),
        );
        return;
      }

      final hasPermission = await _checkLocationPermission();
      if (!hasPermission) return;

      add(GetUserLocationEvent());
    } catch (e) {
      emit(
        IntroLocationErrorState(
          message: e.toString().replaceAll('Exception: ', ''),
        ),
      );
    }
  }

  Future<void> _onGetUserLocation(
    GetUserLocationEvent event,
    Emitter<IntroLocationState> emit,
  ) async {
    emit(IntroLocationLoadingState());

    try {
      final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      ).timeout(const Duration(seconds: 15));

      emit(
        IntroLocationSuccessState(
          location: LocationModel(
            latitude: position.latitude,
            longitude: position.longitude,
          ),
          hasLocationPermission: true,
        ),
      );

      mapController.move(LatLng(position.latitude, position.longitude), 15.0);
    } on TimeoutException {
      emit(
        IntroLocationErrorState(
          message:
              'استغرقت العملية وقتاً طويلاً. يرجى التحقق من الاتصال بالإنترنت',
        ),
      );
    } on Exception catch (e) {
      emit(
        IntroLocationErrorState(
          message: e.toString().replaceAll('Exception: ', ''),
        ),
      );
    }
  }

  void _onUpdateUserLocation(
    UpdateUserLocationEvent event,
    Emitter<IntroLocationState> emit,
  ) {
    if (state is IntroLocationSuccessState) {
      final currentState = state as IntroLocationSuccessState;
      emit(
        IntroLocationSuccessState(
          location: LocationModel(
            latitude: event.latitude,
            longitude: event.longitude,
          ),
          hasLocationPermission: currentState.hasLocationPermission,
        ),
      );
    }
  }

  Future<void> _onSearchPlace(
    SearchPlaceEvent event,
    Emitter<IntroLocationState> emit,
  ) async {
    LocationModel? lastLocation;
    bool? hasLocationPermission;

    if (state is IntroLocationSuccessState) {
      final currentState = state as IntroLocationSuccessState;
      lastLocation = currentState.location;
      hasLocationPermission = currentState.hasLocationPermission;
    }

    emit(IntroLocationSearchLoadingState());

    try {
      final hasConnection = await _checkInternetConnection();
      if (!hasConnection) {
        throw Exception('لا يوجد اتصال بالإنترنت. يرجى التحقق من الاتصال');
      }

      List<Location> locations = await locationFromAddress(
        event.query,
      ).timeout(const Duration(seconds: 10));

      if (locations.isNotEmpty) {
        final location = locations.first;
        emit(
          IntroLocationSearchSuccessState(
            location: LocationModel(
              latitude: location.latitude,
              longitude: location.longitude,
            ),
            hasLocationPermission: hasLocationPermission ?? true,
            searchQuery: event.query,
          ),
        );

        mapController.move(LatLng(location.latitude, location.longitude), 15.0);
      } else {
        emit(
          IntroLocationSearchErrorState(
            message: 'لم يتم العثور على نتائج للبحث',
            lastLocation: lastLocation,
            hasLocationPermission: hasLocationPermission,
          ),
        );
      }
    } on TimeoutException {
      emit(
        IntroLocationSearchErrorState(
          message: 'استغرقت عملية البحث وقتاً طويلاً',
          lastLocation: lastLocation,
          hasLocationPermission: hasLocationPermission,
        ),
      );
    } on Exception catch (e) {
      emit(
        IntroLocationSearchErrorState(
          message:
              'خطأ في البحث: ${e.toString().replaceAll('Exception: ', '')}',
          lastLocation: lastLocation,
          hasLocationPermission: hasLocationPermission,
        ),
      );
    }
  }

  void _onClearSearch(
    ClearSearchEvent event,
    Emitter<IntroLocationState> emit,
  ) {
    if (state is IntroLocationSearchSuccessState) {
      final currentState = state as IntroLocationSearchSuccessState;
      emit(
        IntroLocationSuccessState(
          location: currentState.location,
          hasLocationPermission: currentState.hasLocationPermission,
        ),
      );
    }
  }

  void _onRetryLoading(
    RetryLoadingEvent event,
    Emitter<IntroLocationState> emit,
  ) {
    add(InitializeMapEvent());
  }
}
