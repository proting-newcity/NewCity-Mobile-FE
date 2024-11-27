import 'dart:convert';

// Parse JSON data ke AllBerita
AllBerita beritaFromJson(String str) => AllBerita.fromJson(json.decode(str));

String beritaToJson(AllBerita data) => json.encode(data.toJson());

class AllBerita {
  List<Berita>? berita;
  List<Kategori>? kategoriList;

  AllBerita({
    this.berita,
    this.kategoriList = const [],
  });

  factory AllBerita.fromJson(Map<String, dynamic> json) {
    var kategoriMap = <String, Kategori>{}; // nge-map kategori

    return AllBerita(
      // populate list berita
      berita: json["berita"] == null
          ? []
          : List<Berita>.from(json["berita"].map((x) {
              // cari & tambah kategori unik
              var kategoriTitle = x["kategori"];
              var kategori = kategoriMap.putIfAbsent(
                  kategoriTitle, () => Kategori(judul: kategoriTitle));
              return Berita.fromJson(x, kategori);
            })),
      kategoriList: kategoriMap.values.toList(), // ubah dari map ke list
    );
  }

  Map<String, dynamic> toJson() => {
        "berita": berita == null
            ? []
            : List<dynamic>.from(berita!.map((x) => x.toJson())),
        "kategori": List<dynamic>.from(kategoriList!.map((x) => x.toJson())),
      };
}

class Berita {
  String judul;
  Kategori kategori;
  String editor;
  DateTime tanggal;
  String status;

  Berita({
    required this.judul,
    required this.kategori,
    required this.editor,
    required this.tanggal,
    required this.status,
  });

  factory Berita.fromJson(Map<String, dynamic> json, Kategori kategori) =>
      Berita(
        judul: json["judul"],
        kategori: kategori,
        editor: json["editor"],
        tanggal: DateTime.parse(json["tanggal"]),
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "judul": judul,
        "kategori": kategori.toJson(),
        "editor": editor,
        "tanggal":
            "${tanggal.year.toString().padLeft(4, '0')}-${tanggal.month.toString().padLeft(2, '0')}-${tanggal.day.toString().padLeft(2, '0')}",
        "status": status,
      };
}

class Kategori {
  String judul;

  Kategori({
    required this.judul,
  });

  factory Kategori.fromJson(Map<String, dynamic> json) => Kategori(
        judul: json["judul"],
      );

  Map<String, dynamic> toJson() => {
        "judul": judul,
      };
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
