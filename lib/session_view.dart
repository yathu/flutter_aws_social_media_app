import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whfms_mobile_app/session_cubit.dart';

class SessionView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Session View'),
            TextButton(onPressed: ()=> BlocProvider.of<SessionCubit>(context).signOut(), child: Text('Sign out'))
          ],
        ),
      ),
    );
  }
}
