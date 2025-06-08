part of 'auth_screen_bloc.dart';

class AuthScreenState extends Equatable {
  const AuthScreenState({this.AuthScreenModelObj});

  final AuthScreenModel? AuthScreenModelObj;

  @override
  List<Object?> get props => [AuthScreenModelObj];

  AuthScreenState copyWith({AuthScreenModel? iphone1415ProOneModelObj}) {
    return AuthScreenState(
      AuthScreenModelObj: iphone1415ProOneModelObj ?? AuthScreenModelObj,
    );
  }
}
