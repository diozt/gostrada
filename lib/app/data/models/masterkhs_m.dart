// To parse this JSON data, do
//
//     final masterKhs = masterKhsFromJson(jsonString);

import 'dart:convert';

MasterKhs masterKhsFromJson(String str) => MasterKhs.fromJson(json.decode(str));

String masterKhsToJson(MasterKhs data) => json.encode(data.toJson());

class MasterKhs {
  MasterKhs({
    required this.activeSemester,
    required this.activeBobot,
    required this.activePeriode,
    required this.ipActive,
    required this.data,
    required this.error,
  });

  String activeSemester;
  String activeBobot;
  String activePeriode;
  String ipActive;
  List<Datum> data;
  bool error;

  factory MasterKhs.fromJson(Map<String, dynamic> json) => MasterKhs(
        activeSemester: json["active_semester"],
        activeBobot: json["active_bobot"],
        activePeriode: json["active_periode"],
        ipActive: json["ip_active"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        error: json["error"],
      );

  Map<String, dynamic> toJson() => {
        "active_semester": activeSemester,
        "active_bobot": activeBobot,
        "active_periode": activePeriode,
        "ip_active": ipActive,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "error": error,
      };
}

class Datum {
  Datum({
    required this.id,
    required this.periode,
    required this.typePeriode,
    required this.tahun,
    required this.semester,
    required this.totalBobot,
    required this.mutu,
    required this.ip,
  });

  String id;
  String periode;
  String typePeriode;
  String tahun;
  String semester;
  String totalBobot;
  String mutu;
  String ip;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        periode: json["periode"],
        typePeriode: json["type_periode"],
        tahun: json["tahun"],
        semester: json["semester"],
        totalBobot: json["total_bobot"],
        mutu: json["mutu"],
        ip: json["ip"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "periode": periode,
        "type_periode": typePeriode,
        "tahun": tahun,
        "semester": semester,
        "total_bobot": totalBobot,
        "mutu": mutu,
        "ip": ip,
      };
}
