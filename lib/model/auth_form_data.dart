import 'dart:io';

enum AuthMode { SignUp, Login }

class AuthFormData {
  String username = '';
  String email = '';
  String password = '';
  File? image;
  AuthMode _mode = AuthMode.Login;

  bool get isLogin {
    return _mode == AuthMode.Login;
  }

  bool get isSignUp {
    return _mode == AuthMode.SignUp;
  }

  void toogleAuthMode() {
    _mode = isLogin ? AuthMode.SignUp : AuthMode.Login;
  }
}
