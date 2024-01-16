import 'dart:convert';

import 'package:client_portal/api_address.dart';
import 'package:client_portal/model/tutorial_model.dart';
import 'package:http/http.dart' as http;

class TutorialService {
  Future<List<TutorialModel>> getTutorials() async {
    var url = urlTutorial;
    var headers = {'Content-Type': 'application/json'};

    var response = await http.get(
      Uri.parse(url),
      headers: headers,
    );

    print(response.body);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data'];
      List<TutorialModel> tutorials = [];

      for (var item in data) {
        tutorials.add(TutorialModel.fromJson(item));
      }
      return tutorials;
    } else {
      throw Exception('Failed to get tutorial!');
    }
  }
}
