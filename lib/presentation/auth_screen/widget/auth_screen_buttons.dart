import 'package:dowerly/core/global_imports.dart';

class AuthScreenButtons extends StatelessWidget {
  final VoidCallback onNavigate;

  const AuthScreenButtons({super.key, required this.onNavigate});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomOutlinedButton(
          text: "lb7".tr,
          buttonTextStyle: theme.textTheme.bodyMedium,
          margin: EdgeInsets.symmetric(horizontal: 20.h),
          onPressed: onNavigate,
        ),
        SizedBox(height: 8.h),
        CustomOutlinedButton(
          text: "lb9".tr,
          buttonTextStyle: theme.textTheme.bodyMedium,
          margin: EdgeInsets.symmetric(horizontal: 20.h),
          buttonStyle: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(appTheme.gray100),
          ),
          onPressed: onNavigate,
        ),
      ],
    );
  }
}
