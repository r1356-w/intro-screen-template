import 'package:dowerly/core/global_imports.dart';
import 'theme_event.dart' as theme_event;
import 'theme_state.dart' as theme_state;

class ThemeBloc extends Bloc<theme_event.ThemeEvent, theme_state.ThemeState> {
  ThemeBloc(super.initialState) {
    on<theme_event.ThemeChangeEvent>(_changeTheme);
  }

  void _changeTheme(
    theme_event.ThemeChangeEvent event,
    Emitter<theme_state.ThemeState> emit,
  ) {
    emit(state.copyWith(themeData: event.themeData));
  }
}
