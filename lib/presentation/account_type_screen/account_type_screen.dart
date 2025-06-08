import 'package:dowerly/core/global_imports.dart';

class AccountTypeScreen extends StatelessWidget {
  const AccountTypeScreen({super.key});

  static Widget builder(BuildContext context) {
    return BlocProvider(
      create: (_) => AccountTypeBloc()..add(LoadAccountTypes()),
      child: const AccountTypeScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.gray5001,
      body: Column(
        children: [
          const HeaderSection(),
          SizedBox(height: 24.h),
          const ContentSectionTypeAccount(),
        ],
      ),
    );
  }
}

