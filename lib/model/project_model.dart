class ProjectModel {
  late int id;
  late String name;
  late String jenis;
  late String keterangan;
  late String deadline;
  late String status;
  late String masaAktif;
  late String notes;
  late String urlPhoto;

  ProjectModel({
    required this.id,
    required this.name,
    required this.jenis,
    required this.keterangan,
    required this.deadline,
    required this.status,
    required this.masaAktif,
    required this.notes,
    required this.urlPhoto,
  });

  ProjectModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    jenis = json['jenis'];
    keterangan = json['keterangan'];
    deadline = json['deadline'];
    status = json['status'];
    masaAktif = json['masaaktif'];
    notes = json['notes'];
    urlPhoto = json['photo'];
  }
}
