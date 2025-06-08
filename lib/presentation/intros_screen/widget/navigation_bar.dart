import 'package:dowerly/core/global_imports.dart';

class IntroNavigationBar extends StatelessWidget {
  final int currentIndex;
  final int totalScreens;
  final VoidCallback? onSkip;
  final VoidCallback? onNext;

  const IntroNavigationBar({
    super.key,
    required this.currentIndex,
    required this.totalScreens,
    this.onSkip,
    this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 62.h,
            child: GestureDetector(
              onTap: onSkip,
              child: Text(
                "lb5".tr,
                style: theme.textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Container(
            height: 6.h,
            margin: EdgeInsets.only(top: 10.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(totalScreens, (index) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 2.h),
                  width: 6.h,
                  height: 6.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color:
                        index <= currentIndex
                            ? theme.colorScheme.primary
                            : appTheme.whiteA700,
                  ),
                );
              }),
            ),
          ),
          SizedBox(
            width: 60.h,
            child: GestureDetector(
              onTap: onNext,
              child: Text(
                currentIndex == totalScreens - 1 ? "lb7".tr : "lb6".tr,
                style: theme.textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
