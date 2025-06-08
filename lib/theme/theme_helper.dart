import 'package:dowerly/core/global_imports.dart';

class ThemeHelper {
  final _appTheme = PrefUtils().getThemeData();

  final Map<String, LightCodeColors> _supportedCustomColor = {
    'lightCode': LightCodeColors(),
  };

  final Map<String, ColorScheme> _supportedColorScheme = {
    'lightCode': ColorSchemes.lightCodeColorScheme,
  };

  LightCodeColors _getThemeColors() {
    return _supportedCustomColor[_appTheme] ?? LightCodeColors();
  }

  ThemeData _getThemeData() {
    var colorScheme =
        _supportedColorScheme[_appTheme] ?? ColorSchemes.lightCodeColorScheme;

    return ThemeData(
      visualDensity: VisualDensity.standard,
      colorScheme: colorScheme,
      textTheme: TextThemes.textTheme(colorScheme),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          side: BorderSide(color: appTheme.green900, width: 2.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.h),
          ),
          visualDensity: const VisualDensity(vertical: -4, horizontal: -4),
          padding: EdgeInsets.zero,
        ),
      ),
      dividerTheme: DividerThemeData(
        thickness: 4,
        space: 4,
        color: colorScheme.errorContainer,
      ),
    );
  }

  LightCodeColors themeColor() => _getThemeColors();
  ThemeData themeData() => _getThemeData();
}

class TextThemes {
  static TextTheme textTheme(ColorScheme colorScheme) => TextTheme(
    bodyMedium: TextStyle(
      color: appTheme.black900,
      fontSize: 16.fSize,
      fontFamily: 'Noto Kufi Arabic',
      fontWeight: FontWeight.w700,
    ),

    bodySmall: TextStyle(
      color: appTheme.green900,
      fontFamily: 'Noto Kufi Arabic',
      fontSize: 13.fSize,
      fontWeight: FontWeight.w600,
    ),

    bodyLarge: TextStyle(
      color: appTheme.green900,
      fontSize: 19.fSize,
      fontWeight: FontWeight.w900,
    ),

    headlineSmall: TextStyle(
      color: appTheme.black900,
      fontFamily: 'Alexandria',
      fontSize: 22.fSize,
      fontWeight: FontWeight.w900,
    ),

    titleLarge: TextStyle(
      color: colorScheme.errorContainer,
      fontFamily: 'Alexandria',
      fontSize: 22.fSize,
      fontWeight: FontWeight.w700,
    ),
  );
}

// Supported color schemes
class ColorSchemes {
  static final lightCodeColorScheme = ColorScheme.light(
    primary: Color(0XFF2DCA49),
    primaryContainer: Color(0XFFC60E8A),
    secondaryContainer: Color(0XFF8EBD98),
    errorContainer: Color(0XFF000000),
    onError: Color(0XFFFF9ABC),
    onPrimary: Color(0X0ff17e21),
    onPrimaryContainer: Color(0XFFFFFFFF),
  );
}

// Custom colors for lightCode theme
class LightCodeColors {
  // Black
  Color get black900 => Color(0XFF0F0A03);
  Color get black90001 => Color(0XFF000000);
  Color get black90002 => Color(0XFF0F0005);

  // BlueGray
  Color get blueGray700 => Color(0XFF455A64);
  Color get blueGray800 => Color(0XFF37474F);
  Color get blueGray900 => Color(0XFF1F3D4C);
  Color get blueGray900Cc => Color(0XCC203E32);

  // DeepOrange
  Color get deepOrange200 => Color(0XFFFFBF9D);

  // Gray
  Color get gray100 => Color(0XFFF5F5F5);
  Color get gray10001 => Color(0XFFF9F6EE);
  Color get gray200 => Color(0XFFEBEBEB);
  Color get gray300 => Color(0XFFE0E0E0);
  Color get gray30001 => Color(0XFFDBDBDB);
  Color get gray400 => Color(0XFFC7C7C7);
  Color get gray50 => Color(0XFFFAFAFA);
  Color get gray500 => Color(0XFF9E9E9E);
  Color get gray5001 => Color(0XFFFCFCFC);
  Color get gray5002 => Color(0XFFFFFBFB);
  Color get gray800 => Color(0XFF6F4439);

  // Green
  Color get green200 => Color(0XFF92E3A9);
  Color get green800 => Color(0XFF117B3B);
  Color get green900 => Color(0XFF215224);
  Color get greenA700 => Color(0XFF07A935);

  // LightGreen
  Color get lightGreen200 => Color(0XFF84EA82);
  Color get lightGreen20001 => Color(0XFFB4EAB2);

  // Pink
  Color get pink200 => Color(0XFFFF9ABB);

  // Red
  Color get red300 => Color(0XFFAE7461);
  // Color get redA700 => Color(0XFFC60E0A);

  // White
  Color get whiteA700 => Color(0XFFFAFFFD);

  get blue800 => null;
}

// Global theme accessors
LightCodeColors get appTheme => ThemeHelper().themeColor();
ThemeData get theme => ThemeHelper().themeData();
