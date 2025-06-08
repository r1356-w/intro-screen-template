import 'package:dowerly/core/global_imports.dart';
import 'auth_screen_buttons.dart';

class AuthScreenContent extends StatelessWidget {
  const AuthScreenContent({super.key});

  void _navigateToAccountType(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.accountTypeScreen,
      arguments: {'fromAuth': true},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.h, vertical: 15.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 15.h),
          Expanded(
            child: Center(
              child: CustomImageView(
                imagePath: ImageConstant.auth_image1,
                fit: BoxFit.contain,
                height: double.infinity,
                width: double.maxFinite,
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: CustomImageView(
              imagePath: ImageConstant.auth_image2,
              fit: BoxFit.contain,
              height: 150.h,
              width: 140.h,
            ),
          ),
          Align(
            child: Text(
              "msg7".tr,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.right,
              style: theme.textTheme.bodyMedium,
            ),
          ),
          SizedBox(height: 20.h),
          AuthScreenButtons(onNavigate: () => _navigateToAccountType(context)),
        ],
      ),
    );
  }
}
