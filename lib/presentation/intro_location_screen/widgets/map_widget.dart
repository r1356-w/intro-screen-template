import 'dart:async';

import 'package:dowerly/presentation/intro_location_screen/model/intro_location_model.dart';
import 'package:dowerly/presentation/intro_location_screen/widgets/error_map_widget.dart';
import 'package:dowerly/presentation/intro_location_screen/widgets/search_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class MapWidget extends StatefulWidget {
  const MapWidget({
    super.key,
    required this.location,
    required this.isSearchResult,
  });

  final LocationModel location;
  final bool isSearchResult;

  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  late final MapController _mapController;
  LatLng? _currentLocation;
  bool _loading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _mapController = MapController();
    _getLocation();
  }

  Future<bool> _checkInternetConnection() async {
    final connectivityResult = await Connectivity().checkConnectivity();
    return connectivityResult != ConnectivityResult.none;
  }

  Future<bool> _handlePermission() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw Exception('يرجى تفعيل خدمة الموقع في إعدادات الجهاز');
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
      throw Exception(
        'تم رفض صلاحيات الموقع بشكل دائم. يرجى تمكينها من الإعدادات',
      );
    }

    return permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse;
  }

  Future<void> _getLocation() async {
    setState(() {
      _loading = true;
      _error = null;
    });

    try {
      final hasConnection = await _checkInternetConnection();
      if (!hasConnection) {
        throw Exception('لا يوجد اتصال بالإنترنت. يرجى التحقق من الاتصال');
      }

      final hasPermission = await _handlePermission();
      if (!hasPermission) return;

      final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      ).timeout(const Duration(seconds: 15));

      setState(() {
        _currentLocation = LatLng(position.latitude, position.longitude);
        _loading = false;
      });

      _mapController.move(_currentLocation!, 15.0);
    } on TimeoutException {
      setState(() {
        _error =
            'استغرقت عملية الحصول على الموقع وقتًا طويلاً. يرجى التحقق من اتصال الإنترنت';
        _loading = false;
      });
    } on Exception catch (e) {
      setState(() {
        _error = e.toString().replaceAll('Exception: ', '');
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return const SearchLoadingWidget();
    }

    if (_error != null) {
      return ErrorMapWidget(message: _error!, onRetry: _getLocation);
    }

    if (_currentLocation == null) {
      return ErrorMapWidget(
        message: 'تعذر الحصول على الموقع الحالي',
        onRetry: _getLocation,
      );
    }

    return FlutterMap(
      mapController: _mapController,
      options: MapOptions(initialCenter: _currentLocation!, initialZoom: 15.0),
      children: [
        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          userAgentPackageName: 'com.example.dowerly',
          subdomains: const ['a', 'b', 'c'],
        ),
        MarkerLayer(
          markers: [
            Marker(
              width: 40.0,
              height: 40.0,
              point: _currentLocation!,
              child: const Icon(
                Icons.location_pin,
                color: Colors.green,
                size: 40,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
