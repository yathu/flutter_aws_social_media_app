import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whfms_mobile_app/auth/auth_credentials.dart';

enum AuthState { login, signUP, confirmSignUP }

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthState.login);

  AuthCredentials credentials;

  void showLogin() => emit(AuthState.login);

  void showSignUP() => emit(AuthState.signUP);

  void showConfirmSignUp({
    String username,
    String email,
    String password,
  }) {

    credentials = AuthCredentials(username: username,password: password,email: email);
    emit(AuthState.confirmSignUP);
  }
}
