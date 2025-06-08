import 'package:dowerly/core/global_imports.dart';

class ListItemWidget extends StatelessWidget {
  final ListItemModel model;

  const ListItemWidget(this.model, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.h),
      decoration: AppDecoration.fillLightGreen.copyWith(
        borderRadius: BorderRadiusStyle.circleBorder10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(model.title, style: theme.textTheme.titleLarge),
          const SizedBox(height: 8),
          Text(
            model.description,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.right,
            style: theme.textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}
