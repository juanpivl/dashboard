import 'package:flutter/material.dart';
import 'package:nutricion_app/router/router.dart';
import 'package:nutricion_app/services/local_storage.dart';
import 'package:nutricion_app/services/navigation_service.dart';

enum AuthStatus { checking, authenticated, notAuthenticated }

class AuthProvider extends ChangeNotifier {
  String? _token;
  AuthStatus authStatus = AuthStatus.checking;

  AuthProvider() {
    isAuthenticated();
  }

  login(String email, String password) {
    //TODO:peticcion http
    _token = 'dsadsadas';
    LocalStorage.prefs.setString('token', _token!);
    LocalStorage.prefs.getString('token');

    authStatus = AuthStatus.authenticated;
    notifyListeners();

    NavigationService.replaceTo(Flutorouter.dashboarRoute);
  }

  Future<bool> isAuthenticated() async {
    final token = LocalStorage.prefs.getString('token');

    if (token == null) {
      authStatus = AuthStatus.notAuthenticated;
      notifyListeners();
      return false;
    }
    //TODO: ir al backend y compromar si jwt es valido
    await Future.delayed(Duration(milliseconds: 1000));
    authStatus = AuthStatus.authenticated;
    notifyListeners();
    return true;
  }
}
