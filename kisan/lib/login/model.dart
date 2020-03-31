class User {
  static bool _isFarmer;
  static String _name;
  static String _mobilNo;

  static bool get isFarmer => _isFarmer;

  static set isFarmer(bool value) {
    _isFarmer = value;
  }
  static String get name => _name;

  static set name(String value) {
    _name = value;
  }

  static String get mobilNo => _mobilNo;

  static set mobilNo(String value) {
    _mobilNo = value;
  }
  static void printUser(){
    print('Name: ' + name + '\n  mobile No: ' + mobilNo);
  }
}

class LoginStatus {
  static bool _isLogin;

  static bool get isLogin => _isLogin;

  static set isLogin(bool value) {
    _isLogin = value;
  }
}