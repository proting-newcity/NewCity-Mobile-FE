class BeritaResponse {
  List<Berita> berita; // List of Berita objects, not KategoriBerita

  BeritaResponse({
    this.berita = const [],
  });

  factory BeritaResponse.fromJson(Map<String, dynamic> json) {
    return BeritaResponse(
      berita: (json['data'] as List)
          .map((item) => Berita.fromJson(item))
          .toList(), // Convert each item in 'data' to Berita
    );
  }
}

class KategoriBeritaResponse {
  final List<KategoriBerita> kategori;

  KategoriBeritaResponse({this.kategori = const []});

  factory KategoriBeritaResponse.fromJson(List<dynamic> json) {
    return KategoriBeritaResponse(
      kategori: json.map((item) => KategoriBerita.fromJson(item)).toList(),
    );
  }
}

class Berita {
  int id;
  String title;
  String content;
  String foto;
  DateTime tanggal;
  String status;
  int idKategori;
  int idUser;
  DateTime createdAt;
  DateTime updatedAt;
  KategoriBerita kategori;
  User user;

  Berita({
    required this.id,
    required this.title,
    required this.content,
    required this.foto,
    required this.tanggal,
    required this.status,
    required this.idKategori,
    required this.idUser,
    required this.createdAt,
    required this.updatedAt,
    required this.kategori,
    required this.user,
  });

  factory Berita.fromJson(Map<String, dynamic> json) {
    return Berita(
      id: json['id'],
      title: json['title'],
      content: json['content'],
      foto: json['foto'],
      tanggal: DateTime.parse(json['tanggal']),
      status: json['status'],
      idKategori: json['id_kategori'],
      idUser: json['id_user'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      kategori: KategoriBerita.fromJson(json['kategori']),
      user: User.fromJson(json['user']),
    );
  }
}

class KategoriBerita {
  int id;
  String name;
  String foto;

  KategoriBerita({required this.id, required this.name, required this.foto});

  factory KategoriBerita.fromJson(Map<String, dynamic> json) {
    return KategoriBerita(
      id: json['id'],
      name: json['name'],
      foto: json['foto'],
    );
  }
}

class User {
  int id;
  String name;

  User({
    required this.id,
    required this.name,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
    );
  }
}

class Report {
  int? id;
  String judul;
  String deskripsi;
  String lokasi;
  List<String> status;
  String foto;
  int idMasyarakat;
  dynamic idPemerintah;
  dynamic idKategori;
  DateTime createdAt;
  DateTime updatedAt;

  Report({
    this.id,
    required this.judul,
    required this.deskripsi,
    required this.lokasi,
    required this.status,
    required this.foto,
    required this.idMasyarakat,
    required this.idPemerintah,
    required this.idKategori,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Report.fromJson(Map<String, dynamic> json) => Report(
        id: json["id"],
        judul: json["judul"],
        deskripsi: json["deskripsi"],
        lokasi: json["lokasi"],
        status: List<String>.from(json["status"].map((x) => x)),
        foto: json["foto"],
        idMasyarakat: json["id_masyarakat"],
        idPemerintah: json["id_pemerintah"],
        idKategori: json["id_kategori"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  factory Report.fromMap(Map<String, dynamic> map) => Report(
        id: map["id"],
        judul: map["judul"],
        deskripsi: map["deskripsi"],
        lokasi: map["lokasi"],
        status: List<String>.from(map["status"].map((x) => x.toString())),
        foto: map["foto"],
        idMasyarakat: map["id_masyarakat"],
        idPemerintah: map["id_pemerintah"],
        idKategori: map["id_kategori"],
        createdAt: DateTime.parse(map["created_at"]),
        updatedAt: DateTime.parse(map["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "judul": judul,
        "deskripsi": deskripsi,
        "lokasi": lokasi,
        "status": List<dynamic>.from(status.map((x) => x)),
        "foto": foto,
        "id_masyarakat": idMasyarakat,
        "id_pemerintah": idPemerintah,
        "id_kategori": idKategori,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };

  Map<String, dynamic> toJsonPost() => {
        "judul": judul,
        "deskripsi": deskripsi,
        "lokasi": lokasi,
        "status": List<dynamic>.from(status.map((x) => x)),
        "foto": foto,
        "id_masyarakat": idMasyarakat,
        "id_kategori": idKategori,
      };
}
