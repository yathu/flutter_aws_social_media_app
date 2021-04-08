class AuthRepository{

  Future<void> login() async{
     print("Attempted to Login...");
     Future.delayed(Duration(seconds: 3));
     print("Logged");
  }
}