class User {
  int id;
  String name;
  String? username;
  String? foto;

  User({
    required this.id,
    required this.name,
    this.username,
    this.foto,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json['id'],
        name: json['name'],
        username: json['username'] ?? '',
        foto: json['foto'] ?? '');
  }
}

class NotifikasiPagination {
  List<Notifikasi> notifikasi;
  int? lastPage;

  NotifikasiPagination({
    this.notifikasi = const [],
    this.lastPage,
  });

  factory NotifikasiPagination.fromJson(Map<String, dynamic> json) {
    return NotifikasiPagination(
      notifikasi: (json['data'] as List)
          .map((item) => Notifikasi.fromJson(item))
          .toList(),
      lastPage: json['last_page'],
    );
  }
}

class Notifikasi {
  final String? fotoProfile;
  final String name;
  final String type;
  final String content;
  final String foto;
  final String tanggal;
  final int idReport;

  Notifikasi({
    required this.fotoProfile,
    required this.name,
    required this.type,
    required this.content,
    required this.foto,
    required this.tanggal,
    required this.idReport,
  });

  factory Notifikasi.fromJson(Map<String, dynamic> json) {
    return Notifikasi(
      fotoProfile: json["foto_profile"],
      name: json["name"],
      type: json["type"],
      content: json["content"],
      foto: json["foto"],
      tanggal: json["tanggal"],
      idReport: json["id_report"],
    );
  }
}
