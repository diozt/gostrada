// ignore_for_file: unnecessary_new

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:gostrada/app/controllers/krs/krs_c.dart';
import 'package:gostrada/app/data/models/masterkrs_m.dart';
import 'package:gostrada/app/routes/rout_name.dart';
import 'package:gostrada/app/ui/theme/color.dart';
import 'package:hexcolor/hexcolor.dart';

class KrsPage extends StatelessWidget {
  final c = Get.find<KrsController>();
  // final c = Get.put(KrsController());

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Obx(
      () => c.isLoading.isTrue
          ? Scaffold(
              body: Center(
                child: CircularProgressIndicator(
                  strokeWidth: 3,
                  valueColor:
                      new AlwaysStoppedAnimation<Color>(DataColors.dongker),
                ),
              ),
            )
          : Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
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
                titleSpacing: 0,
                title: Text(
                  'Data KRS',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: DataColors.dongker,
                  ),
                ),
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
              ),
              body: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  child: GetBuilder<KrsController>(
                    builder: (cont) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'KRS Semester Aktif',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: DataColors.dongker,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),

                          // box info KRS Aktif

                          InkWell(
                            onTap: () {
                              cont.semester = c.dataMasterKrs.activeSemester;

                              Get.toNamed(RoutName.detailkrs);
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              height: 143,
                              width: size.width,
                              decoration: BoxDecoration(
                                color: DataColors.blusky,
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.15),
                                    spreadRadius: 1,
                                    blurRadius: 2,
                                    offset: Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Stack(
                                children: [
                                  Positioned(
                                    top: 20,
                                    child: Opacity(
                                      opacity: 0.2,
                                      child: SvgPicture.asset(
                                        'assets/images/krs/vector.svg',
                                        height: 140,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 40),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              c.dataMasterKrs.activePeriode,
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: DataColors.dongker,
                                              ),
                                            ),
                                            Text(
                                              int.parse(c.dataMasterKrs
                                                              .activeSemester) %
                                                          2 ==
                                                      0
                                                  ? 'GENAP'
                                                  : 'GASAL',
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: DataColors.dongker,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              "(Semester " +
                                                  c.dataMasterKrs
                                                      .activeSemester +
                                                  ")",
                                              style: TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w600,
                                                color: HexColor('#3C5595'),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                              c.dataMasterKrs.activeBobot +
                                                  ' SKS',
                                              style: TextStyle(
                                                fontSize: 24,
                                                fontWeight: FontWeight.bold,
                                                color: DataColors.dongker,
                                              ),
                                            ),
                                            Container(
                                              child: Text(
                                                'TOTAL',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: DataColors.skyBlue,
                                                    letterSpacing: 1.0),
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          // end box info KRS Aktif

                          SizedBox(
                            height: 30,
                          ),

                          //detail periode dan semester
                          Text(
                            'Periode dan semester',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: DataColors.dongker,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),

                          ListView.builder(
                            primary: false,
                            shrinkWrap: true,
                            padding: const EdgeInsets.all(8),
                            itemCount: c.dataMasterKrs.data.length,
                            itemBuilder: (BuildContext context, int index) {
                              Datum dataku = c.dataMasterKrs.data[index];
                              return InkWell(
                                onTap: () {
                                  cont.semester =
                                      c.dataMasterKrs.data[index].semester;

                                  Get.toNamed(RoutName.detailkrs);
                                },
                                child: Container(
                                    height: 120,
                                    width: size.width,
                                    margin: EdgeInsets.symmetric(vertical: 10),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 15),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.1),
                                          spreadRadius: 2,
                                          blurRadius: 2,
                                          offset: Offset(0,
                                              2), // changes position of shadow
                                        )
                                      ],
                                    ),
                                    child: Stack(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Text(
                                                  '2020/2021',
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w700,
                                                    color: DataColors.dongker,
                                                  ),
                                                ),
                                                Text(
                                                  int.parse(dataku.semester) %
                                                              2 ==
                                                          0
                                                      ? 'GENAP'
                                                      : "GASAL",
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w700,
                                                    color: DataColors.dongker,
                                                  ),
                                                ),
                                                Text(
                                                  "(Semester  " +
                                                      dataku.semester +
                                                      ")",
                                                  style: TextStyle(
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w600,
                                                    color: HexColor('#3C5595'),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Text(
                                              dataku.totalBobot + ' SKS',
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w700,
                                                color: DataColors.dongker,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Align(
                                          alignment: Alignment.bottomRight,
                                          child: Icon(
                                            Icons.arrow_forward_ios_sharp,
                                            size: 12,
                                          ),
                                        ),
                                      ],
                                    )),
                              );
                            },
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
    );
  }
}
