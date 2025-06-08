import 'package:dowerly/core/global_imports.dart';

class AccountTypeList extends StatelessWidget {
  const AccountTypeList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountTypeBloc, AccountTypeState>(
      builder: (context, state) {
        return ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (_, i) => ListItemWidget(state.model.listItems[i]),
          separatorBuilder: (_, __) => SizedBox(height: 16.h),
          itemCount: state.model.listItems.length,
        );
      },
    );
  }
}