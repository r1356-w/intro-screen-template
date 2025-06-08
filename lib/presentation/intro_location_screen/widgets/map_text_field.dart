// FILE: lib/features/home/views/widgets/map_text_field.dart
import 'package:dowerly/theme/theme_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dowerly/presentation/intro_location_screen/bloc/intro_location_bloc.dart';

class MapTextField extends StatelessWidget {
  const MapTextField({
    super.key,
    required this.hasSearchError,
    required this.isSearchResult,
  });

  final bool hasSearchError;
  final bool isSearchResult;

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<IntroLocationBloc>();

    return Positioned(
      top: 16,
      left: 16,
      right: 16,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
          // Add a red border if there's a search error
          border:
              hasSearchError ? Border.all(color: Colors.red, width: 1.5) : null,
        ),
        child: TextFormField(
          style: TextStyle(color: appTheme.green900),
          controller: bloc.searchController,
          decoration: InputDecoration(
            hintText: 'ابحث عن مكان...',
            border: InputBorder.none,
            prefixIcon:   Icon(
              Icons.location_on_outlined,
              color: appTheme.green900,
            ),
            suffixIcon: bloc.searchController.text.isNotEmpty
                ? IconButton(
                    icon: const Icon(Icons.clear, color: Colors.grey),
                    onPressed: () {
                      bloc.searchController.clear();
                      // Clear search state if in search success state
                      if (isSearchResult) {
                        bloc.add(const ClearSearchEvent());
                      }
                    },
                  )
                : null,
          ),
          textDirection: TextDirection.rtl,
          textAlign: TextAlign.right,
          onFieldSubmitted: (value) {
            if (value.trim().isNotEmpty) {
              bloc.add(SearchPlaceEvent(query: value));
            }
          },
        ),
      ),
    );
  }
}
