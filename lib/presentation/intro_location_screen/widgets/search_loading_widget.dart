// FILE: lib/features/home/views/widgets/search_loading_widget.dart
import 'package:dowerly/theme/theme_helper.dart';
import 'package:flutter/material.dart';

class SearchLoadingWidget extends StatelessWidget {
  const SearchLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: CircularProgressIndicator(
              color: ColorSchemes.lightCodeColorScheme.primary),
        ),
        const Center(child: Text("جاري البحث...")),
      ],
    );
  }
}
