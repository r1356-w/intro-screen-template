import 'package:dowerly/core/global_imports.dart';
import 'package:dowerly/presentation/auth_screen/widget/auth_screen_content.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  static Widget builder(BuildContext context) {
    return BlocProvider<AuthScreenBloc>(
      create:
          (context) => AuthScreenBloc(
            AuthScreenState(AuthScreenModelObj: AuthScreenModel()),
          )..add(AuthScreenInitialEvent()),
      child: const AuthScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthScreenBloc, AuthScreenState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: appTheme.gray5001,
          body: const SafeArea(child: AuthScreenContent()),
        );
      },
    );
  }
}
