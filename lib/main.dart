import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whfms_mobile_app/auth/auth_repository.dart';
import 'package:whfms_mobile_app/auth/login/login_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RepositoryProvider(create: (context) => AuthRepository(),
      child: LoginView(),
      ),
    );
  }
}

