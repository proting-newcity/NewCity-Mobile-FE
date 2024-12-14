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
