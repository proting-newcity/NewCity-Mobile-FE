import 'package:newcity/models/user.dart';

class BeritaResponsePagination {
  List<Berita> berita;
  int? lastPage;

  BeritaResponsePagination({
    this.berita = const [],
    this.lastPage,
  });

  factory BeritaResponsePagination.fromJson(Map<String, dynamic> json) {
    return BeritaResponsePagination(
      berita:
          (json['data'] as List).map((item) => Berita.fromJson(item)).toList(),
      lastPage: json['last_page'],
    );
  }
}

class KategoriBeritaResponse {
  final List<KategoriBerita> kategori;

  KategoriBeritaResponse({
    this.kategori = const [],
  });

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
