import 'package:dowerly/core/global_imports.dart';

class AppDecoration {
  static BoxDecoration get fillGray => BoxDecoration(color: appTheme.gray5001);
  static BoxDecoration get fillLightGreen =>
      BoxDecoration(color: appTheme.lightGreen20001);

  static BoxDecoration get fillOnPrimaryContainer =>
      BoxDecoration(color: theme.colorScheme.onPrimaryContainer);

  static BoxDecoration get fillPrimary =>
      BoxDecoration(color: theme.colorScheme.primary);

  static BoxDecoration get gradientWhiteAToLightGreen => BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment(1, 0),
      end: Alignment(0, 1),
      colors: [appTheme.whiteA700, appTheme.lightGreen200],
    ),
  );

  static BoxDecoration get outlineGreen => BoxDecoration(
    border: Border.all(color: appTheme.green900, width: 2.h),
    image: DecorationImage(
      image: AssetImage(ImageConstant.img),
      fit: BoxFit.fill,
    ),
  );
}

class BorderRadiusStyle {
  static BorderRadius get customBorderBl20 =>
      BorderRadius.vertical(bottom: Radius.circular(20.h));

  static BorderRadius get roundedBorders => BorderRadius.circular(8.h);

  static BorderRadius get circleBorder48 => BorderRadius.circular(48.h);

  static BorderRadius get roundedBorder8 => BorderRadius.circular(8.h);
  
  static BorderRadius get circleBorder10 => BorderRadius.circular(10.h);

  static BorderRadius get customBorderTL24 =>
      BorderRadius.vertical(top: Radius.circular(24.h));
}
