import 'core/global_imports.dart';
import 'package:device_preview/device_preview.dart';

final GlobalKey<ScaffoldMessengerState> globalMessengerKey =
    GlobalKey<ScaffoldMessengerState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await PrefUtils().init();

  runApp(DevicePreview(enabled: true, builder: (context) => const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return BlocProvider(
          create: (context) => ThemeBloc(
            ThemeState(
              themeData: ThemeHelper().themeData(),
              themeType: PrefUtils().getThemeData(),
            ),
          ),
          child: BlocBuilder<ThemeBloc, ThemeState>(
            builder: (context, state) {
              return MaterialApp(
                useInheritedMediaQuery: true,
                locale: const Locale('ar', ''),
                builder: DevicePreview.appBuilder,
                theme: state.themeData,
                title: 'Dowerly',
                scaffoldMessengerKey: globalMessengerKey,
                navigatorKey: NavigatorService.navigatorKey,
                debugShowCheckedModeBanner: false,
                localizationsDelegates: const [
                  AppLocalizationDelegate(),
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: const [Locale('ar', ''), Locale('en', 'US')],
                localeResolutionCallback: (deviceLocale, supportedLocales) {
                  return supportedLocales.firstWhere(
                    (locale) =>
                        locale.languageCode == deviceLocale?.languageCode,
                    orElse: () => const Locale('ar', ''),
                  );
                },
                initialRoute: AppRoutes.initialRoute,
                routes: AppRoutes.routes,
              );
            },
          ),
        );
      },
    );
  }
}
