part of 'intro_location_bloc.dart';

abstract class IntroLocationEvent extends Equatable {
  const IntroLocationEvent();

  @override
  List<Object> get props => [];
}

class InitializeMapEvent extends IntroLocationEvent {
  const InitializeMapEvent();
}

class GetUserLocationEvent extends IntroLocationEvent {
  const GetUserLocationEvent();
}

class UpdateUserLocationEvent extends IntroLocationEvent {
  final double latitude;
  final double longitude;

  const UpdateUserLocationEvent({
    required this.latitude,
    required this.longitude,
  });

  @override
  List<Object> get props => [latitude, longitude];
}

class SearchPlaceEvent extends IntroLocationEvent {
  final String query;

  const SearchPlaceEvent({required this.query});

  @override
  List<Object> get props => [query];
}

class ClearSearchEvent extends IntroLocationEvent {
  const ClearSearchEvent();
}

class RetryLoadingEvent extends IntroLocationEvent {
  const RetryLoadingEvent();
}