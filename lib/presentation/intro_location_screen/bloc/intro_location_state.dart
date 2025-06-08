part of 'intro_location_bloc.dart';

abstract class IntroLocationState extends Equatable {
  const IntroLocationState();
  
  @override
  List<Object?> get props => [];
}

class IntroLocationInitialState extends IntroLocationState {}

class IntroLocationLoadingState extends IntroLocationState {}

class IntroLocationSearchLoadingState extends IntroLocationState {}

class IntroLocationSuccessState extends IntroLocationState {
  final LocationModel location;
  final bool hasLocationPermission;

  const IntroLocationSuccessState({
    required this.location,
    required this.hasLocationPermission,
  });

  @override
  List<Object?> get props => [location, hasLocationPermission];
}

class IntroLocationSearchSuccessState extends IntroLocationState {
  final LocationModel location;
  final bool hasLocationPermission;
  final String? searchQuery;

  const IntroLocationSearchSuccessState({
    required this.location,
    required this.hasLocationPermission,
    this.searchQuery,
  });

  @override
  List<Object?> get props => [location, hasLocationPermission, searchQuery];
}

class IntroLocationErrorState extends IntroLocationState {
  final String message;

  const IntroLocationErrorState({
    required this.message,
  });

  @override
  List<Object?> get props => [message];
}

class IntroLocationSearchErrorState extends IntroLocationState {
  final String message;
  final LocationModel? lastLocation;
  final bool? hasLocationPermission;

  const IntroLocationSearchErrorState({
    required this.message,
    this.lastLocation,
    this.hasLocationPermission,
  });

  @override
  List<Object?> get props => [message, lastLocation, hasLocationPermission];
}