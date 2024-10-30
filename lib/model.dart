import 'dart:convert';

//     final berita = beritaFromJson(jsonString);
AllBerita beritaFromJson(String str) => AllBerita.fromJson(json.decode(str));

String beritaToJson(AllBerita data) => json.encode(data.toJson());

class AllBerita {
  List<Berita>? berita;

  AllBerita({
    this.berita,
  });

  factory AllBerita.fromJson(Map<String, dynamic> json) => AllBerita(
        berita: json["berita"] == null
            ? []
            : List<Berita>.from(json["berita"]!.map((x) => Berita.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "berita": berita == null
            ? []
            : List<dynamic>.from(berita!.map((x) => x.toJson())),
      };
}

class Berita {
  String judul;
  String kategori;
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

  factory Berita.fromJson(Map<String, dynamic> json) => Berita(
        judul: json["judul"],
        kategori: json["kategori"],
        editor: json["editor"],
        tanggal: DateTime.parse(json["tanggal"]),
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "judul": judul,
        "kategori": kategori,
        "editor": editor,
        "tanggal":
            "${tanggal.year.toString().padLeft(4, '0')}-${tanggal.month.toString().padLeft(2, '0')}-${tanggal.day.toString().padLeft(2, '0')}",
        "status": status,
      };
}
