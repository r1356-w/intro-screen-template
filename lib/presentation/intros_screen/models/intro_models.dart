// intro_model.dart
import 'package:dowerly/core/global_imports.dart';

class IntroModel extends Equatable {
  final int? currentIndex;
  final bool? isLastScreen;

  const IntroModel({this.currentIndex, this.isLastScreen});

  @override
  List<Object?> get props => [currentIndex, isLastScreen];

  IntroModel copyWith({int? currentIndex, bool? isLastScreen}) {
    return IntroModel(
      currentIndex: currentIndex ?? this.currentIndex,
      isLastScreen: isLastScreen ?? this.isLastScreen,
    );
  }
}
