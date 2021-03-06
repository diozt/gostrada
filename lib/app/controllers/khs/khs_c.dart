import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gostrada/app/data/models/masterkhs_m.dart';
import 'package:http/http.dart' as http;

class KHSController extends GetxController {
  final box = GetStorage();
  late Map data = box.read("dataUser") as Map<String, dynamic>;
  final String masterKHS =
      'https://sia.iik-strada.ac.id/mobile/data/master_khs';

  late MasterKhs dataMasterKhs;
  var isLoading = true.obs;
  var loaderVisible = false.obs;
  var semester = "0";
  var nim = "0";
  bool loadDetailKhs = true;

  @override
  void onInit() async {
    // TODO: implement onInit

    super.onInit();
    nim = data['username'];
    final Map<String, dynamic> dataBody = {
      "nim": data['nim'],
    };

    //http request post
    var response = await http.post(Uri.parse(masterKHS), body: dataBody);
    if (response.statusCode == 200) {
      var user = jsonDecode(response.body);
      if (user['error'] == true) {
        //
      } else {
        // load berhasil
        dataMasterKhs = masterKhsFromJson(response.body);
        print('load master khs berhasil');
      }
      isLoading.value = false;
    }
  }

  // downloadFile() async {
  //   final Map<String, dynamic> dataBody = {
  //     "semester_value": "1",
  //     "nim_value": "2151B1070",
  //   };
  //   Dio dio = Dio();
  //   var response = await dio.post("https://sia.iik-strada.ac.id/mhs_krs/download_krs",
  //     options: Options(
  //       headers: {"Accept": "application/json"},
  //       // method: 'POST',
  //       followRedirects: false,
  //       validateStatus: (status) { return status! < 500; }

  //     ),
  //     data: dataBody,
  //   );

  //   print(response.statusCode);
  // }
}
