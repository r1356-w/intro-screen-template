import 'package:dowerly/core/global_imports.dart';
part 'auth_screen_event.dart';
part 'auth_screen_state.dart';

// A bloc that manages the state of a Iphone1415ProOne
class AuthScreenBloc extends Bloc<AuthScreenEvent, AuthScreenState> {
  AuthScreenBloc(super.initialState) {
    on<AuthScreenEvent>(_onInitialize);
  }

  Future<void> _onInitialize(
    AuthScreenEvent event,
    Emitter<AuthScreenState> emit,
  ) async {
    // Initialize your state here
  }
}
