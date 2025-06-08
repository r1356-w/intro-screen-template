import 'package:dowerly/core/global_imports.dart';

abstract class ThemeEvent extends Equatable {
  const ThemeEvent();

  @override
  List<Object> get props => [];
}

class ThemeChangeEvent extends ThemeEvent {
  final ThemeData themeData;

  const ThemeChangeEvent(this.themeData);

  @override
  List<Object> get props => [themeData];
}
