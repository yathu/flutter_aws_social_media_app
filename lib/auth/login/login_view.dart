import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whfms_mobile_app/auth/auth_repository.dart';
import 'package:whfms_mobile_app/auth/form_submition_status.dart';
import 'package:whfms_mobile_app/auth/login/login_bloc.dart';
import 'package:whfms_mobile_app/auth/login/login_event.dart';
import 'package:whfms_mobile_app/auth/login/login_state.dart';

class LoginView extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: BlocProvider(
            create: (context) =>
                LoginBloc(authRepo: context.read<AuthRepository>()),
            child: _loginForm(),
          )
      ),
    );
  }

  Widget _loginForm() {
    return Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _usernameField(),
              _passwordField(),
              _loginButton(),
            ],
          ),
        ));
  }


  Widget _usernameField() {
    //not need BCZ top already implemented for validation we use BlocBuilder
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return TextFormField(
          decoration: InputDecoration(
            icon: Icon(Icons.person),
            hintText: 'Username',
          ),
          validator: (value) =>
          state.isValidUserName
              ? null
              : 'username is invalid', //TODO: create common validator file
          onChanged: (value) =>
              context.read<LoginBloc>().add(
                  LoginUsernameChanged(username: value),
              ),
        );
      },
    );
  }

  Widget _passwordField() {
    return BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          return TextFormField(
            obscureText: true,
            decoration: InputDecoration(
              icon: Icon(Icons.https),
              hintText: 'Password',
            ),
            validator: (value) =>
            state.isValidPassword
                ? null
                : 'invalid password', //TODO: create common validator file
            onChanged: (value) =>
                context.read<LoginBloc>().add(
                  LoginPasswordChanged(password: value),
                ),
          );
        });
  }

  Widget _loginButton() {
    return BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state){
          return Container(
            margin: const EdgeInsets.only(top: 60),
            width: double.infinity,
            child: state.formStatus is FormSubmitting ?
            CircularProgressIndicator() :
            ElevatedButton(onPressed: (){
              if(_formKey.currentState.validate()){
                context.read<LoginBloc>().add(LoginSubmitted());
              }
            }, child: Text('Login')),
          );
        });
  }
}

