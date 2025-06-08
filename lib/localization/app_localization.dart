import 'package:dowerly/core/global_imports.dart';

extension LocalizationExtension on String {
  String get tr => Application.of().getString(this);
}

class Application {
  Application(this.locale);

  final Locale locale;

  static final Map<String, Map<String, String>> _localizedValues = {'ar': ar};

  static Application of() {
    return Localizations.of<Application>(
      NavigatorService.navigatorKey.currentContext!,
      Application,
    )!;
  }

  static List<String> languages() => _localizedValues.keys.toList();

  String getString(String key) {
    return _localizedValues[locale.languageCode]?[key] ?? key;
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<Application> {
  const AppLocalizationDelegate();

  @override
  bool isSupported(Locale locale) {
    return Application.languages().contains(locale.languageCode);
  }

  @override
  Future<Application> load(Locale locale) {
    return SynchronousFuture<Application>(Application(locale));
  }

  @override
  bool shouldReload(AppLocalizationDelegate old) => false;
}
