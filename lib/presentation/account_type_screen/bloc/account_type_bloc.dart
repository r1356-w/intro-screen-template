import 'package:dowerly/core/global_imports.dart';


class AccountTypeBloc extends Bloc<AccountTypeEvent, AccountTypeState> {
  AccountTypeBloc()
    : super(AccountTypeState(model: AccountTypeModel(listItems: []))) {
    on<LoadAccountTypes>((event, emit) {
      final items = [
        ListItemModel(
          title: "lb10".tr,
          description: "msg13".tr,
          isBusiness: false,
        ),
        ListItemModel(
          title: "lb11".tr,
          description: "msg14".tr,
          isBusiness: true,
        ),
      ];
      emit(AccountTypeState(model: AccountTypeModel(listItems: items)));
    });
  }
}
