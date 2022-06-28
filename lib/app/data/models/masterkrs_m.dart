// To parse this JSON data, do
//
//     final masterKrsModel = masterKrsModelFromJson(jsonString);

import 'dart:convert';

MasterKrsModel masterKrsModelFromJson(String str) =>
    MasterKrsModel.fromJson(json.decode(str));

String masterKrsModelToJson(MasterKrsModel data) => json.encode(data.toJson());

class MasterKrsModel {
  MasterKrsModel({
    required this.activeSemester,
    required this.activeBobot,
    required this.activePeriode,
    required this.data,
    required this.error,
  });

  String activeSemester;
  String activeBobot;
  String activePeriode;
  List<Datum> data;
  bool error;

  factory MasterKrsModel.fromJson(Map<String, dynamic> json) => MasterKrsModel(
        activeSemester: json["active_semester"],
        activeBobot: json["active_bobot"],
        activePeriode: json["active_periode"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        error: json["error"],
      );

  Map<String, dynamic> toJson() => {
        "active_semester": activeSemester,
        "active_bobot": activeBobot,
        "active_periode": activePeriode,
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
  });

  String id;
  String periode;
  String typePeriode;
  String tahun;
  String semester;
  String totalBobot;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        periode: json["periode"],
        typePeriode: json["type_periode"],
        tahun: json["tahun"],
        semester: json["semester"],
        totalBobot: json["total_bobot"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "periode": periode,
        "type_periode": typePeriode,
        "tahun": tahun,
        "semester": semester,
        "total_bobot": totalBobot,
      };
}
