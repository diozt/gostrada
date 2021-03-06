import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gostrada/app/ui/theme/color.dart';

class RiwayatBayarPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Riwayat Bayar'),
        backgroundColor: Colors.white,
        foregroundColor: DataColors.dongker,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                  Icons.arrow_back_ios), // Put icon of your preference.
              onPressed: () {
                Get.back();
              },
            );
          },
        ),
        elevation: 0,
        centerTitle: true,
      ),
    );
  }
}