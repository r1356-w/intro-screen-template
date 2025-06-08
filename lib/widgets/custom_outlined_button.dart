import 'package:dowerly/core/global_imports.dart';

class CustomOutlinedButton extends BaseButton {
  CustomOutlinedButton({
    Key? key,
    this.decoration,
    this.leftIcon,
    this.rightIcon,
    this.label,
    this.color,
    VoidCallback? onPressed,
    ButtonStyle? buttonStyle,
    TextStyle? buttonTextStyle,
    bool? isDisabled,
    Alignment? alignment,
    double? height,
    double? width,
    EdgeInsets? margin,
    required String text,
  }) : super(
         text: text,
         onPressed: onPressed,
         buttonStyle: buttonStyle,
         isDisabled: isDisabled,
         buttonTextStyle: buttonTextStyle,
         height: height,
         alignment: alignment,
         width: width,
         margin: margin,
       );

  final BoxDecoration? decoration;
  final Color? color;
  final Widget? leftIcon;
  final Widget? rightIcon;
  final Widget? label;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
          alignment: alignment ?? Alignment.center,
          child: buildOutlinedButtonWidget,
        )
        : buildOutlinedButtonWidget;
  }

  Widget get buildOutlinedButtonWidget => Container(
    height: this.height ?? 52.h,
    width: this.width ?? double.maxFinite,
    margin: margin,
    decoration:
        decoration?.copyWith(color: color) ??
        (color != null ? BoxDecoration(color: color) : null),
    child: OutlinedButton(
      style: buttonStyle,
      onPressed: isDisabled ?? false ? null : onPressed ?? () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          leftIcon ?? const SizedBox.shrink(),
          Text(text, style: buttonTextStyle ?? theme.textTheme.titleSmall),
          rightIcon ?? const SizedBox.shrink(),
        ],
      ),
    ),
  );
}
