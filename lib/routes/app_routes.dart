import 'package:dowerly/core/global_imports.dart';
import 'package:dowerly/presentation/account_type_screen/account_type_screen.dart';
import 'package:dowerly/presentation/intros_screen/intro_screen.dart';

class AppRoutes {
  static const String introScreen = '/intro_screen';
  static const String authScreen = '/auth_screen';
  static const String accountTypeScreen = '/account_type_screen';
  static const String introLocationScreen = '/intro_location_screen';
  static const String initialRoute = '/initial_route';

  static Map<String, WidgetBuilder> get routes => {
    introScreen: (context) {
      final args =
          ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
      final index = args?['index'] ?? 0;
      return IntroScreen.builder(context, index);
    },
    authScreen: (context) => AuthScreen.builder(context),
    accountTypeScreen: (context) => AccountTypeScreen.builder(context),
    initialRoute: (context) => IntroScreen.builder(context, 0),
    introLocationScreen: (context) {
      final args =
          ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
      final fromIntro = args?['fromIntro'] ?? false;
      return IntroLocationScreen.builder(context, fromIntro: fromIntro);
    },
  };
}
