import 'package:dowerly/core/global_imports.dart';

class CustomButtonStyles {
  // Original styles
  static ButtonStyle get outlineGreenTL10 => OutlinedButton.styleFrom(
    backgroundColor: Colors.transparent,
    side: BorderSide(color: appTheme.green900, width: 2.h),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.h)),
    padding: EdgeInsets.zero,
  );

  // New outline button style
  static ButtonStyle get outlineGreen => OutlinedButton.styleFrom(
    backgroundColor: appTheme.lightGreen200,
    side: BorderSide(color: appTheme.green900, width: 1.h),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14.h)),
    padding: EdgeInsets.zero,
  );

  // Text button style (improved)
  static ButtonStyle get none => ButtonStyle(
    backgroundColor: WidgetStateProperty.all<Color>(Colors.transparent),
    elevation: WidgetStateProperty.all<double>(0),
    padding: WidgetStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.zero),
    overlayColor: WidgetStateProperty.all(Colors.transparent),
    side: WidgetStateProperty.all<BorderSide>(
      BorderSide(color: Colors.transparent),
    ),
  );
}
