part of 'intro_bloc.dart';

abstract class IntroEvent extends Equatable {
  const IntroEvent();

  @override
  List<Object> get props => [];
}

class IntroInitialEvent extends IntroEvent {}

class IntroSkipEvent extends IntroEvent {}

class IntroNextEvent extends IntroEvent {
  final int newIndex;

  const IntroNextEvent(this.newIndex);

  @override
  List<Object> get props => [newIndex];
}
