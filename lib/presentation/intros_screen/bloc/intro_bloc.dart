import 'package:dowerly/core/global_imports.dart';

part 'intro_event.dart';
part 'intro_state.dart';

class IntroBloc extends Bloc<IntroEvent, IntroState> {
  IntroBloc(IntroState initialState) : super(initialState) {
    on<IntroInitialEvent>(_onInitialize);
    on<IntroSkipEvent>(_onSkip);
    on<IntroNextEvent>(_onNext);
  }

  void _onInitialize(IntroInitialEvent event, Emitter<IntroState> emit) async {
    emit(state.copyWith(status: IntroStatus.initial));
  }

  void _onSkip(IntroSkipEvent event, Emitter<IntroState> emit) {
    emit(state.copyWith(status: IntroStatus.skipped));
  }

  void _onNext(IntroNextEvent event, Emitter<IntroState> emit) {
    emit(
      state.copyWith(status: IntroStatus.next, currentIndex: event.newIndex),
    );
  }
}
