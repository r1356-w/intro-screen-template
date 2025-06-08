import 'package:dowerly/core/global_imports.dart';

class ThemeState extends Equatable {
  final ThemeData themeData;
  final String themeType;

  const ThemeState({required this.themeData, required this.themeType});

  @override
  List<Object> get props => [themeData, themeType];

  ThemeState copyWith({ThemeData? themeData, String? themeType}) {
    return ThemeState(
      themeData: themeData ?? this.themeData,
      themeType: themeType ?? this.themeType,
    );
  }
}
