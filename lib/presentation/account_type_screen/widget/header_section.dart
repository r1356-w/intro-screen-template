import 'package:dowerly/core/global_imports.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: appTheme.greenA700,
        borderRadius: BorderRadiusStyle.customBorderBl20,
      ),
      child: Center(
        child: CustomImageView(
          imagePath: ImageConstant.account_type_image,
          fit: BoxFit.contain,
          height: 137.h,
          width: double.maxFinite,
        ),
      ),
    );
  }
}

