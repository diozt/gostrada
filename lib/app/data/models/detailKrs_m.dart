// To parse this JSON data, do
//
//     final detailKrs = detailKrsFromJson(jsonString);

import 'dart:convert';

DetailKrs detailKrsFromJson(String str) => DetailKrs.fromJson(json.decode(str));

String detailKrsToJson(DetailKrs data) => json.encode(data.toJson());

class DetailKrs {
  DetailKrs({
    required this.totalSks,
    required this.data,
    required this.error,
  });

  int totalSks;
  List<Datum> data;
  bool error;

  factory DetailKrs.fromJson(Map<String, dynamic> json) => DetailKrs(
        totalSks: json["total_sks"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        error: json["error"],
      );

  Map<String, dynamic> toJson() => {
        "total_sks": totalSks,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "error": error,
      };
}

class Datum {
  Datum({
    required this.codeMk,
    required this.bobot,
    required this.name,
    required this.english,
  });

  String codeMk;
  String bobot;
  String name;
  String english;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        codeMk: json["code_mk"],
        bobot: json["bobot"],
        name: json["name"],
        english: json["english"],
      );

  Map<String, dynamic> toJson() => {
        "code_mk": codeMk,
        "bobot": bobot,
        "name": name,
        "english": english,
      };
}
