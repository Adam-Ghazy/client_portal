import 'package:client_portal/model/client_model.dart';
import 'package:client_portal/service/auth_service.dart';
import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  ClientModel? _client;

  ClientModel get client => _client!;

  set client(ClientModel client) {
    _client = client;
    notifyListeners();
  }

  Future<bool> login({String? username, String? password}) async {
    try {
      ClientModel client =
          await AuthService().login(username: username, password: password);
      _client = client;
      return true;
    } catch (e) {
      print("ini error");
      return false;
    }
  }
}
