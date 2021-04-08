import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whfms_mobile_app/auth/auth_cubit.dart';
import 'package:whfms_mobile_app/auth/auth_repository.dart';
import 'package:whfms_mobile_app/auth/confirm/confirmation_event.dart';
import 'package:whfms_mobile_app/auth/confirm/confirmation_state.dart';
import 'package:whfms_mobile_app/auth/form_submition_status.dart';

class ConfirmationBloc extends Bloc<ConfirmationEvent, ConfirmationState> {
  final AuthRepository authRepo;
  final AuthCubit authCubit;

  ConfirmationBloc({this.authRepo, this.authCubit}) : super(ConfirmationState());

  @override
  Stream<ConfirmationState> mapEventToState(ConfirmationEvent event) async* {
    if (event is ConfirmationCodeChanged) {
      yield state.copyWith(confirmationCode: event.confirmation_code);
    } else if (event is ConfirmationSubmitted) {
      yield state.copyWith(formStatus: FormSubmitting());

      try {
        await authRepo.confirmSignUp(
            userName: authCubit.credentials.username,
            confirmationCode: state.confirmationCode
        );
        yield state.copyWith(formStatus: SubmissionSuccess());
      } catch (e) {
        yield state.copyWith(formStatus: SubmissionFailed(e));
      }
    }
  }
}
