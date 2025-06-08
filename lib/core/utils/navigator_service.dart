import 'package:dowerly/core/global_imports.dart';

class NavigatorService {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static Future<dynamic> pushNamed(
    String routeName, {
    dynamic arguments,
  }) async {
    return await navigatorKey.currentState?.pushNamed(
      routeName,
      arguments: arguments,
    );
  }

  static Future<dynamic> pushIntroScreen(int index) async {
    return await pushNamed(
      AppRoutes.introScreen,
      arguments: {'index': index},
    );
  }

  static void goBack() {
    navigatorKey.currentState?.pop();
  }

  static Future<dynamic> pushNamedAndRemoveUntil(
    String routeName, {
    bool routePredicate = false,
    dynamic arguments,
  }) async {
    return await navigatorKey.currentState?.pushNamedAndRemoveUntil(
      routeName,
      (route) => routePredicate,
      arguments: arguments,
    );
  }

  static Future<dynamic> popAndPushNamed(
    String routeName, {
    dynamic arguments,
  }) async {
    return await navigatorKey.currentState?.popAndPushNamed(
      routeName,
      arguments: arguments,
    );
  }
}