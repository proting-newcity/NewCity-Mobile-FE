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
