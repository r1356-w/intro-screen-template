import 'package:dowerly/core/global_imports.dart';

class AccountTypeState extends Equatable {
  final AccountTypeModel model;

  AccountTypeState({required this.model});

  @override
  List<Object?> get props => [model];
}
