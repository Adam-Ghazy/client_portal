import 'dart:convert';

import 'package:client_portal/api_address.dart';
import 'package:client_portal/model/client_model.dart';
import 'package:http/http.dart' as http;

class AuthService {
  Future<ClientModel> login({
    String? username,
    String? password,
  }) async {
    var url = urlClientLogin;
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode({'username': username, 'password': password});
    final response =
        await http.post(Uri.parse(url), headers: headers, body: body);

    print(response.body);

    if (response.statusCode == 201) {
      var data = jsonDecode(response.body)['data'];
      ClientModel client = ClientModel.fromJson(data);
      return client;
    } else {
      throw Exception('Failed to login client.');
    }
  }
}
