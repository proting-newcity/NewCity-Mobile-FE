class ReportResponsePagination {
  List<Report> report;
  int? lastPage;

  ReportResponsePagination({
    this.report = const [],
    this.lastPage,
  });

  factory ReportResponsePagination.fromJson(Map<String, dynamic> json) {
    return ReportResponsePagination(
      report:
          (json['data'] as List).map((item) => Report.fromJson(item)).toList(),
      lastPage: json['last_page'],
    );
  }
}

class ReportResponse {
  Report report;
  String masyarakatName;
  String pemerintahName;
  String kategoriName;
  int like;

  ReportResponse(
      {required this.report,
      required this.masyarakatName,
      required this.pemerintahName,
      required this.kategoriName,
      required this.like});

  factory ReportResponse.fromJson(Map<String, dynamic> json) {
    return ReportResponse(
        report: Report.fromJson(json['report']),
        masyarakatName: json['masyarakat']['name'],
        pemerintahName: json['pemerintah']['name'] ?? "Unknown",
        kategoriName: json['kategori']['name'],
        like: json['like']);
  }
}

class KategoriReportResponse {
  final List<KategoriReport> kategori;

  KategoriReportResponse({
    this.kategori = const [],
  });

  factory KategoriReportResponse.fromJson(List<dynamic> json) {
    return KategoriReportResponse(
      kategori: json.map((item) => KategoriReport.fromJson(item)).toList(),
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

  factory Report.fromJson(Map<String, dynamic> json) {
    return Report(
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
  }

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

class KategoriReport {
  int id;
  String name;

  KategoriReport({required this.id, required this.name});

  factory KategoriReport.fromJson(Map<String, dynamic> json) {
    return KategoriReport(
      id: json['id'],
      name: json['name'],
    );
  }
}
