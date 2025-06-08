import 'package:dowerly/core/global_imports.dart';

class IntroScreen extends StatelessWidget {
  final String mainImage;
  final String? secondaryImage;
  final String title;
  final String description;
  final int currentIndex;
  final int totalScreens;
  final String? buttonText;
  final VoidCallback? onSkip;
  final VoidCallback? onNext;
  final bool showStackedImages;
  final bool showOutlinedButton;

  const IntroScreen({
    super.key,
    required this.mainImage,
    this.secondaryImage,
    required this.title,
    required this.description,
    required this.currentIndex,
    required this.totalScreens,
    this.buttonText,
    this.onSkip,
    this.onNext,
    this.showStackedImages = false,
    this.showOutlinedButton = false,
  });

  static Widget builder(BuildContext context, int index) {
    switch (index) {
      case 0:
        return BlocProvider<IntroBloc>(
          create:
              (context) => IntroBloc(IntroState())..add(IntroInitialEvent()),
          child: IntroScreen(
            mainImage: ImageConstant.intro_one_image1,
            secondaryImage: ImageConstant.intro_one_image2,
            title: "msg5".tr,
            description: "msg6".tr,
            currentIndex: 0,
            totalScreens: 3,
            showStackedImages: true,
            onSkip: () => _navigateTo(context, screenIndex: 3),
            onNext: () => _navigateTo(context, screenIndex: 1),
          ),
        );
      case 1:
        return BlocProvider<IntroBloc>(
          create:
              (context) => IntroBloc(IntroState())..add(IntroInitialEvent()),
          child: IntroScreen(
            mainImage: ImageConstant.intro_two_image,
            title: "msg3".tr,
            description: "msg4".tr,
            currentIndex: 1,
            totalScreens: 3,
            onSkip: () => _navigateTo(context, screenIndex: 3),
            onNext: () => _navigateTo(context, screenIndex: 2),
          ),
        );
      case 2:
        return BlocProvider<IntroBloc>(
          create:
              (context) => IntroBloc(IntroState())..add(IntroInitialEvent()),
          child: IntroScreen(
            mainImage: ImageConstant.intro_three_image,
            title: "msg1".tr,
            description: "msg2".tr,
            currentIndex: 2,
            totalScreens: 3,
            buttonText: "lb4".tr,
            showOutlinedButton: true,
            onNext: () => _navigateTo(context, screenIndex: 3),
          ),
        );
      default:
        return BlocProvider<IntroBloc>(
          create:
              (context) => IntroBloc(IntroState())..add(IntroInitialEvent()),
          child: const SizedBox.shrink(),
        );
    }
  }

  static void _navigateTo(BuildContext context, {required int screenIndex}) {
    if (screenIndex == 3) {
      NavigatorService.pushNamed(
        AppRoutes.introLocationScreen,
        arguments: {'fromIntro': true},
      );
    } else {
      NavigatorService.pushNamed(
        AppRoutes.introScreen,
        arguments: {'index': screenIndex},
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IntroBloc, IntroState>(
      builder: (context, state) {
        return Scaffold(
          extendBody: true,
          extendBodyBehindAppBar: true,
          body: Container(
            width: double.infinity,
            height: SizeUtils.height,
            decoration: AppDecoration.gradientWhiteAToLightGreen,
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.h, vertical: 40.h),
                child: Column(
                  children: [
                    ContentSection(
                      mainImage: mainImage,
                      secondaryImage: secondaryImage,
                      title: title,
                      description: description,
                      showStackedImages: showStackedImages,
                    ),
                    const Spacer(),
                    if (showOutlinedButton)
                      ActionButton(buttonText: buttonText, onPressed: onNext),
                    if (currentIndex != totalScreens - 1 || !showOutlinedButton)
                      IntroNavigationBar(
                        currentIndex: currentIndex,
                        totalScreens: totalScreens,
                        onSkip: onSkip,
                        onNext: onNext,
                      ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
