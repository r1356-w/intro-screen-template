import 'package:dowerly/core/global_imports.dart';

class ContentSection extends StatelessWidget {
  final String mainImage;
  final String? secondaryImage;
  final String title;
  final String description;
  final bool showStackedImages;

  const ContentSection({
    super.key,
    required this.mainImage,
    this.secondaryImage,
    required this.title,
    required this.description,
    required this.showStackedImages,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 60.h),
        showStackedImages
            ? Stack(
              clipBehavior: Clip.none,
              children: [
                CustomImageView(
                  imagePath: mainImage,
                  height: 260.h,
                  width: 250.h,
                ),
                if (secondaryImage != null)
                  Positioned(
                    left: 215.h,
                    top: 20.h,
                    child: CustomImageView(
                      imagePath: secondaryImage!,
                      height: 80.h,
                      width: 80.h,
                      radius: BorderRadius.circular(48.h),
                    ),
                  ),
              ],
            )
            : CustomImageView(
              imagePath: mainImage,
              height: 260.h,
              width: 250.h,
            ),
        SizedBox(height: 50.h),
        Text(
          title,
          style: theme.textTheme.headlineSmall,
          textAlign: TextAlign.center,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(height: 12.h),
        Text(
          description,
          style: theme.textTheme.bodyLarge,
          textAlign: TextAlign.center,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
