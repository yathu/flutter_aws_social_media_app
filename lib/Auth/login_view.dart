import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _loginForm(),
      ),
    );
  }

  Widget _loginForm(){
    return Form(child: Padding(
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
    )
    );
  }

  Widget _passwordField(){
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(
        icon: Icon(Icons.https),
        hintText: 'Password',
      ),
    );
  }

  Widget _usernameField(){
    return TextFormField(
      decoration: InputDecoration(
        icon: Icon(Icons.person),
        hintText: 'Username',
      ),
    );
  }

  Widget _loginButton(){
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 50),
      child: ElevatedButton(onPressed: (){}, child: Text('Login')),
    );
  }
}