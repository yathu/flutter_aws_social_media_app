import 'package:flutter/foundation.dart';

class AuthRepository{

  Future<String> login({
    @required String userName,
    @required String password
}) async{
    print("Attempting to login...");
    await Future.delayed(Duration(seconds: 3));
    return 'Login status';
  }

  Future<void> signUp({
    @required String userName,
    @required String email,
    @required String password
}) async{
     await Future.delayed(Duration(seconds: 3));
  }

  Future<String> confirmSignUp({
    @required String userName,
    @required String confirmationCode,
  }) async{
    await Future.delayed(Duration(seconds: 3));
    return 'confirm';
  }
}

