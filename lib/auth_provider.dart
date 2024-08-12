import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  bool _isAuthenticated = false;

  bool get isAuthenticated => _isAuthenticated;

  void login(String username, String password) {
    if (username == 'anda' && password == 'informatika') {
      _isAuthenticated = true;
      notifyListeners();
    } else {
      _isAuthenticated = false;
      notifyListeners();
    }
  }
}
