import 'package:client_portal/model/project_model.dart';

class ClientModel {
  late int id;
  late String name;
  late String slug;
  late String password;
  late String urlPhoto;
  late List<ProjectModel> projects;

  ClientModel({
    required this.id,
    required this.name,
    required this.slug,
    required this.password,
    required this.urlPhoto,
    required this.projects,
  });

  ClientModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    password = json['password'];
    urlPhoto = json['photo'];
    projects = json['projects']
        .map<ProjectModel>((project) => ProjectModel.fromJson(project))
        .toList();
  }
}
