import 'package:dowerly/core/global_imports.dart';

abstract class AccountTypeEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadAccountTypes extends AccountTypeEvent {}
