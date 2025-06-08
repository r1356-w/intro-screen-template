import 'package:dowerly/core/global_imports.dart';

class ContentSectionTypeAccount extends StatelessWidget {
  const ContentSectionTypeAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "lb12".tr,
            style: theme.textTheme.headlineSmall?.copyWith(
              color: appTheme.green900,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            "msg9".tr,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: appTheme.gray500,
            ),
          ),
          const AccountTypeList(),
        ],
      ),
    );
  }
}

