// FILE: lib/features/home/views/widgets/loading_widget.dart
import 'package:dowerly/core/global_imports.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(
              color: ColorSchemes.lightCodeColorScheme.primary),
          SizedBox(height: 2.h),
          Text("جاري تحميل الخريطة...", style: theme.textTheme.bodyMedium),
        ],
      ),
    );
  }
}
