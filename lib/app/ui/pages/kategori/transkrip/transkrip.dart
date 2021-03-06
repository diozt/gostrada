import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gostrada/app/controllers/transkrip/transkrip_c.dart';
import 'package:gostrada/app/ui/theme/color.dart';
import 'package:hexcolor/hexcolor.dart';

class TranskripPage extends StatelessWidget {
  final x = Get.put(TranskripController());

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return
        // Obx(
        //   () => x.loadDetailKhs.isTrue
        //       ? Scaffold(
        //           body: Center(
        //             child: CircularProgressIndicator(
        //               strokeWidth: 3,
        //               valueColor:
        //                   new AlwaysStoppedAnimation<Color>(DataColors.dongker),
        //             ),
        //           ),
        //         )
        //       :
        Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Transkrip Nilai',style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: DataColors.dongker,
                  ),),
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
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                width: size.width,
                decoration: BoxDecoration(
                  color: DataColors.blusky,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 2,
                      blurRadius: 2,
                      offset: Offset(0, 2), // changes position of shadow
                    )
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "36",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            color: DataColors.dongker,
                          ),
                        ),
                        ConstrainedBox(
                          constraints: BoxConstraints(
                            maxWidth: size.width / 4,
                          ),
                          child: AutoSizeText(
                            'Total SKS yang diambil',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w700,
                              color: HexColor('#7D98CE'),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      color: Colors.black26,
                      height: 80,
                      width: 1,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 6),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "3.73",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                              color: DataColors.dongker,
                            ),
                          ),
                          ConstrainedBox(
                            constraints: BoxConstraints(
                              maxWidth: size.width / 4,
                            ),
                            child: AutoSizeText(
                              'Indeks Prestasi Kumulaitif (IPK)',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w700,
                                color: HexColor('#7D98CE'),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      color: Colors.black26,
                      height: 80,
                      width: 1,
                    ),

                    SizedBox(width: 5,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        AutoSizeText(
                          "Cumlaude",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: DataColors.dongker,
                          ),
                        ),
                        ConstrainedBox(
                          constraints: BoxConstraints(
                            maxWidth: size.width / 4,
                          ),
                          child: AutoSizeText(
                            'Prestasi',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w700,
                              color: HexColor('#7D98CE'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 40,
              ),
              ListView.builder(
                primary: false,
                shrinkWrap: true,
                padding: const EdgeInsets.all(8),
                itemCount: x.transkripNilai.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    width: size.width,
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Divider(
                          thickness: 1,
                          color: Colors.black26,
                          height: 20,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Semester  ' + x.transkripNilai[index]['semester'],
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: DataColors.dongker,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        const Divider(
                          thickness: 1,
                          color: Colors.black26,
                          height: 20,
                        ),
                        ListView.builder(
                            primary: false,
                            shrinkWrap: true,
                            padding: const EdgeInsets.all(8),
                            itemCount: x.result['data'].length,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                padding: EdgeInsets.only(left: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 20,
                                        ),
                                        ConstrainedBox(
                                          constraints: BoxConstraints(
                                            maxWidth: size.width / 2,
                                          ),
                                          child: AutoSizeText(
                                            x.result['data'][index]['name'],
                                            // x.transkripNilai[index]['name'],
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700,
                                              color: DataColors.dongker,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                      ],
                                    ),
                                    Container(
                                      // padding: EdgeInsets.all(5),
                                      height: 35,
                                      width: 35,
                                      decoration: BoxDecoration(
                                          color: DataColors.dongker,
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          x.result['data'][index]['nilai'],
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              );
                            }),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 40),
        margin: EdgeInsets.only(bottom: 20),
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            side: BorderSide(
              width: 2.0,
              color: DataColors.primary,
            ),
            primary: Colors.white, // background
            onPrimary: DataColors.dongker, // foreground
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(14.0),
            ),
            padding: EdgeInsets.symmetric(vertical: 10),
          ),
          child: Text(
            'Unduh Transkrip',
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
        ),
        // ),
      ),
    );
  }
}
