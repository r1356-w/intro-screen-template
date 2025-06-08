part of 'intro_bloc.dart';

enum IntroStatus { initial, skipped, next }

class IntroState extends Equatable {
  final IntroStatus status;
  final int currentIndex;

  const IntroState({this.status = IntroStatus.initial, this.currentIndex = 0});

  @override
  List<Object> get props => [status, currentIndex];

  IntroState copyWith({IntroStatus? status, int? currentIndex}) {
    return IntroState(
      status: status ?? this.status,
      currentIndex: currentIndex ?? this.currentIndex,
    );
  }
}
