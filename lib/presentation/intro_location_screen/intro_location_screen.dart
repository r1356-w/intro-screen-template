import 'package:dowerly/core/global_imports.dart';
import 'package:dowerly/presentation/intro_location_screen/widgets/map_content_bolc_consumer.dart';

class IntroLocationScreen extends StatelessWidget {
  final bool fromIntro;

  const IntroLocationScreen({super.key, required this.fromIntro});

  static Widget builder(BuildContext context, {required bool fromIntro}) {
    return BlocProvider<IntroLocationBloc>(
      create: (context) => IntroLocationBloc()..add(const InitializeMapEvent()),
      child: IntroLocationScreen(fromIntro: fromIntro),
    );
  }

  static void _navigateToAuthScreen(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.authScreen,
      arguments: {'fromIntro': false},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: Container(
        width: double.infinity,
        height: SizeUtils.height,
        decoration: AppDecoration.gradientWhiteAToLightGreen,
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 9.h, horizontal: 5.h),
                child: CustomImageView(
                  imagePath: ImageConstant.intro_four_image1,
                ),
              ),
              const MapContentBlocConsumer(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.h, vertical: 10.h),
                child: SizedBox(
                  width: double.infinity,
                  height: 60.h,
                  child: CustomOutlinedButton(
                    buttonTextStyle: theme.textTheme.bodySmall!.copyWith(
                      color: appTheme.black900,
                      fontSize: 16,
                    ),
                    text: "lb3".tr,
                    onPressed: () => _navigateToAuthScreen(context),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
