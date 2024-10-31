import 'dart:convert';

// Parse JSON data into AllBerita
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
    var kategoriMap =
        <String, Kategori>{}; // Map to hold unique categories by title

    return AllBerita(
      berita: json["berita"] == null
          ? []
          : List<Berita>.from(json["berita"].map((x) {
              // Use the map to find or add a unique Kategori
              var kategoriTitle = x["kategori"];
              var kategori = kategoriMap.putIfAbsent(
                  kategoriTitle, () => Kategori(judul: kategoriTitle));
              return Berita.fromJson(x, kategori);
            })),
      kategoriList: kategoriMap.values.toList(), // Extract unique categories
    );
  }

  Map<String, dynamic> toJson() => {
        "berita": berita == null
            ? []
            : List<dynamic>.from(berita!.map((x) => x.toJson())),
        "kategori": List<dynamic>.from(kategoriList!.map((x) => x.toJson())),
      };

  // Helper method to add unique Kategori to kategoriList
  static Kategori _addKategori(List<Kategori> kategoriList, String judul) {
    // Check if the category already exists
    var existingKategori = kategoriList.firstWhere(
        (kategori) => kategori.judul == judul,
        orElse: () => Kategori(judul: judul));

    if (existingKategori.judul == judul) {
      return existingKategori;
    } else {
      var kategori = Kategori(judul: judul);
      kategoriList.add(kategori);
      return kategori;
    }
  }
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
