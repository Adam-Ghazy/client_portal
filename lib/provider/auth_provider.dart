import 'package:client_portal/model/client_model.dart';
import 'package:client_portal/model/project_model.dart';
import 'package:client_portal/service/auth_service.dart';
import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  ClientModel? _client;
  List<ProjectModel> _projects = [];

  ClientModel get client => _client!;
  List<ProjectModel> get projects => _projects;

  set client(ClientModel client) {
    _projects = client.projects;
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
