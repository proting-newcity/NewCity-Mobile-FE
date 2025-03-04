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
  int comment;
  bool hasLiked;

  ReportResponse(
      {required this.report,
      required this.masyarakatName,
      required this.pemerintahName,
      required this.kategoriName,
      required this.like,
      required this.comment,
      required this.hasLiked});

  factory ReportResponse.fromJson(Map<String, dynamic> json) {
    return ReportResponse(
        report: Report.fromJson(json['report']),
        masyarakatName: json['masyarakat']['name'],
        pemerintahName: json['pemerintah']['name'] ?? "Unknown",
        kategoriName: json['kategori']['name'],
        like: json['like'],
        comment: json['comment'],
        hasLiked: json['hasLiked']);
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
  List<Status> status;
  String foto;
  int idMasyarakat;
  dynamic idPemerintah;
  dynamic idKategori;
  DateTime createdAt;
  DateTime updatedAt;
  String? pelapor;


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
    this.pelapor,

  });

  factory Report.fromJson(Map<String, dynamic> json) {
    return Report(
      id: json["id"],
      judul: json["judul"],
      deskripsi: json["deskripsi"],
      lokasi: json["lokasi"],
      status: json["status"] is List
          ? List<Status>.from(json["status"].map((x) => Status.fromJson(x)))
          : [Status.fromJson(json["status"])],
      foto: json["foto"],
      idMasyarakat: json["id_masyarakat"],
      idPemerintah: json["id_pemerintah"],
      idKategori: json["id_kategori"],
      createdAt: DateTime.parse(json["created_at"]),
      updatedAt: DateTime.parse(json["updated_at"]),
      pelapor: json["pelapor"],
    );
  }

  factory Report.fromMap(Map<String, dynamic> map) => Report(
        id: map["id"],
        judul: map["judul"],
        deskripsi: map["deskripsi"],
        lokasi: map["lokasi"],
        status: List<Status>.from(map["status"].map((x) => Status.fromJson(x))),
        foto: map["foto"],
        idMasyarakat: map["id_masyarakat"],
        idPemerintah: map["id_pemerintah"],
        idKategori: map["id_kategori"],
        createdAt: DateTime.parse(map["created_at"]),
        updatedAt: DateTime.parse(map["updated_at"]),
        pelapor: map["pelapor"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "judul": judul,
        "deskripsi": deskripsi,
        "lokasi": lokasi,
        "status": status.map((x) => x.toJson()).toList(),
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

class Status {
  String status;
  String deskripsi;
  DateTime tanggal;

  Status({
    required this.status,
    required this.deskripsi,
    required this.tanggal,
  });

  factory Status.fromJson(Map<String, dynamic> json) {
    return Status(
      status: json["status"],
      deskripsi: json["deskripsi"],
      tanggal: DateTime.parse(json["tanggal"]),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "status": status,
      "deskripsi": deskripsi,
      "tanggal": tanggal,
    };
  }
}

class Comment {
  final String content;
  final String tanggal;
  final String name;
  final String foto;

  Comment({
    required this.content,
    required this.tanggal,
    required this.name,
    required this.foto,
  });

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      content: json['content'] ?? '',
      tanggal: json['tanggal'] ?? '',
      name: json['user']['name'] ?? '',
      foto: json['user']['foto'] ?? '',
    );
  }

  static List<Comment> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => Comment.fromJson(json)).toList();
  }
}
