import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whfms_mobile_app/auth/auth_repository.dart';
import 'package:whfms_mobile_app/auth/form_submition_status.dart';
import 'package:whfms_mobile_app/auth/login/login_event.dart';
import 'package:whfms_mobile_app/auth/login/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository authRepo;

  LoginBloc({this.authRepo}) : super(LoginState());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    //username updated
    if (event is LoginUsernameChanged) {
      yield state.copyWith(username: event.username);

      //password updated
    } else if (event is LoginPasswordChanged) {
      yield state.copyWith(password: event.password);

      //form submitted
    } else if (event is LoginSubmitted) {

      yield state.copyWith(formStatus: FormSubmitting());

      try {
        await authRepo.login();
        yield state.copyWith(formStatus: SubmissionSuccess());
      } catch (e) {
        yield state.copyWith(formStatus: SubmissionFailed(e));
      }
    }
  }
}
