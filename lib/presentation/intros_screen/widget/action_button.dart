import 'package:dowerly/core/global_imports.dart';

class ActionButton extends StatelessWidget {
  final String? buttonText;
  final VoidCallback? onPressed;

  const ActionButton({super.key, this.buttonText, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.h),
      child: CustomOutlinedButton(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(70)),
        text: buttonText ?? "lb4".tr,
        buttonTextStyle: theme.textTheme.bodyLarge,
        onPressed: onPressed,
      ),
    );
  }
}
