// To parse this JSON data, do
//
//     final detailKhs = detailKhsFromJson(jsonString);

import 'dart:convert';

DetailKhs detailKhsFromJson(String str) => DetailKhs.fromJson(json.decode(str));

String detailKhsToJson(DetailKhs data) => json.encode(data.toJson());

class DetailKhs {
  DetailKhs({
    required this.totalSks,
    required this.ip,
    required this.ipk,
    required this.data,
    required this.error,
  });

  int totalSks;
  String ip;
  String ipk;
  List<Datum> data;
  bool error;

  factory DetailKhs.fromJson(Map<String, dynamic> json) => DetailKhs(
        totalSks: json["total_sks"],
        ip: json["ip"],
        ipk: json["ipk"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        error: json["error"],
      );

  Map<String, dynamic> toJson() => {
        "total_sks": totalSks,
        "ip": ip,
        "ipk": ipk,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "error": error,
      };
}

class Datum {
  Datum({
    required this.idKelas,
    required this.codeMk,
    required this.bobot,
    required this.name,
    required this.angka,
    required this.nilai,
    required this.mutu,
  });

  String idKelas;
  String codeMk;
  String bobot;
  String name;
  String angka;
  String nilai;
  String mutu;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        idKelas: json["id_kelas"],
        codeMk: json["code_mk"],
        bobot: json["bobot"],
        name: json["name"],
        angka: json["angka"],
        nilai: json["nilai"],
        mutu: json["mutu"],
      );

  Map<String, dynamic> toJson() => {
        "id_kelas": idKelas,
        "code_mk": codeMk,
        "bobot": bobot,
        "name": name,
        "angka": angka,
        "nilai": nilai,
        "mutu": mutu,
      };
}
