import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:get/get.dart';
import 'package:gostrada/app/controllers/auth/auth_c.dart';
import 'package:gostrada/app/controllers/dashboard/dashboard_c.dart';
import 'package:gostrada/app/routes/rout_name.dart';
import 'package:gostrada/app/ui/theme/color.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DashboardPage extends StatelessWidget {
  final auth = Get.find<AuthController>();
  final c = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: Row(
          children: [
            // photo Profile
            Container(
              height: 40,
              width: 40,
              margin: EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                image: DecorationImage(
                    image: NetworkImage(c.urlPhoto + c.data['photo']),
                    fit: BoxFit.cover),
              ),
            ),
            //end photo Profile

            // say hello
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Hi, ' + c.data['name'],
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
                  ),
                  Text(
                    c.data['nim'],
                    style: TextStyle(fontSize: 12),
                  )
                ],
              ),
            ),
            //end say hello

            // icon notif
            InkWell(
              onTap: () => Get.toNamed(RoutName.notifikasi), // needed
              child: SvgPicture.asset(
                'assets/images/dashboard/icon/notif.svg',
                // fit: BoxFit.cover,
              ),
            ),
            // end icon notif
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),

              // Say Hello
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                height: 140,
                alignment: Alignment.centerLeft,
                width: size.width,
                decoration: BoxDecoration(
                  color: DataColors.blusky,
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                      image: AssetImage('assets/images/dashboard/image01.png'),
                      alignment: Alignment.centerRight),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Selamat Datang',
                      style: TextStyle(fontSize: 18),
                    ),
                    Text(
                      'di GO-STRADA',
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
              //end Say Hello

              const SizedBox(
                height: 30,
              ),

              //Kategori
              Text(
                'Kategori',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.0,
                  color: DataColors.dongker,
                ),
              ),

              SizedBox(
                height: 20,
              ),

              ResponsiveGridRow(
                children: [
                  ResponsiveGridCol(
                    xs: 3,
                    md: 2,
                    child: InkWell(
                      onTap: () => Get.toNamed(RoutName.penawaranKrs),
                      child: Column(
                        children: [
                          Container(
                              padding: EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                  color: DataColors.blusky,
                                  borderRadius: BorderRadius.circular(30)),
                              child: SvgPicture.asset(
                                  'assets/images/dashboard/icon/penawarankrs.svg')),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Penawaran KRS',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                                color: DataColors.dongker),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                        ],
                      ),
                    ),
                  ),
                  ResponsiveGridCol(
                    xs: 3,
                    md: 2,
                    child: InkWell(
                      onTap: () => Get.toNamed(RoutName.krs),
                      child: Column(
                        children: [
                          Container(
                              padding: EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                  color: DataColors.blusky,
                                  borderRadius: BorderRadius.circular(30)),
                              child: SvgPicture.asset(
                                  'assets/images/dashboard/icon/datakrs.svg')),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Data\nKRS',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                                color: DataColors.dongker),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                        ],
                      ),
                    ),
                  ),
                  ResponsiveGridCol(
                    xs: 3,
                    md: 2,
                    child: InkWell(
                      onTap: () => Get.toNamed(RoutName.khs),
                      child: Column(
                        children: [
                          Container(
                              padding: EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                  color: DataColors.blusky,
                                  borderRadius: BorderRadius.circular(30)),
                              child: SvgPicture.asset(
                                  'assets/images/dashboard/icon/datakhs.svg')),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Data\nKHS',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                                color: DataColors.dongker),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                        ],
                      ),
                    ),
                  ),
                  ResponsiveGridCol(
                    xs: 3,
                    md: 2,
                    child: InkWell(
                      onTap: () => Get.toNamed(RoutName.transkrip),
                      child: Column(
                        children: [
                          Container(
                              padding: EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                  color: DataColors.blusky,
                                  borderRadius: BorderRadius.circular(30)),
                              child: SvgPicture.asset(
                                  'assets/images/dashboard/icon/transkrip.svg')),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Transkrip\nNilai',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                                color: DataColors.dongker),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                        ],
                      ),
                    ),
                  ),
                  ResponsiveGridCol(
                    xs: 3,
                    md: 2,
                    child: InkWell(
                      onTap: () => Get.toNamed(RoutName.tagihan),
                      child: Column(
                        children: [
                          Container(
                              padding: EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                  color: DataColors.blusky,
                                  borderRadius: BorderRadius.circular(30)),
                              child: SvgPicture.asset(
                                  'assets/images/dashboard/icon/tagihan.svg')),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Tagihan',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                                color: DataColors.dongker),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                        ],
                      ),
                    ),
                  ),
                  ResponsiveGridCol(
                    xs: 3,
                    md: 2,
                    child: InkWell(
                      onTap: () => Get.toNamed(RoutName.riwayatBayar),
                      child: Column(
                        children: [
                          Container(
                              padding: EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                  color: DataColors.blusky,
                                  borderRadius: BorderRadius.circular(30)),
                              child: SvgPicture.asset(
                                  'assets/images/dashboard/icon/riwayatbayar.svg')),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Riwayat\nBayar',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                                color: DataColors.dongker),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                        ],
                      ),
                    ),
                  ),
                  ResponsiveGridCol(
                    xs: 3,
                    md: 2,
                    child: InkWell(
                      onTap: () => Get.toNamed(RoutName.uploadBuktiBayar),
                      child: Column(
                        children: [
                          Container(
                              padding: EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                  color: DataColors.blusky,
                                  borderRadius: BorderRadius.circular(30)),
                              child: SvgPicture.asset(
                                  'assets/images/dashboard/icon/uploadbuktibayar.svg')),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Upload Bukti Bayar',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                                color: DataColors.dongker),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                        ],
                      ),
                    ),
                  ),
                  ResponsiveGridCol(
                    xs: 3,
                    md: 2,
                    child: InkWell(
                      onTap: () => Get.toNamed(RoutName.lainnya),
                      child: Column(
                        children: [
                          Container(
                              padding: EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                  color: DataColors.blusky,
                                  borderRadius: BorderRadius.circular(30)),
                              child: SvgPicture.asset(
                                  'assets/images/dashboard/icon/lainnya.svg')),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Lainnya',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                                color: DataColors.dongker),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              //end Kategori

              SizedBox(
                height: 40,
              ),

              //chart IPK
              Text(
                'Chart IPK Mahasiswa',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: DataColors.dongker,
                ),
              ),

              SizedBox(
                height: 30,
              ),

              Container(
                  child: SfCartesianChart(

                      // DIsable legend
                      legend: Legend(isVisible: false),
                      // Enable tooltip
                      tooltipBehavior: c.tooltipBehavior,
                      primaryXAxis: CategoryAxis(
                          // Axis labels will be placed in multiple rows, if it is intersected
                          labelIntersectAction:
                              AxisLabelIntersectAction.multipleRows),
                      primaryYAxis: NumericAxis(
                        interval: 1,
                        minimum: 0,
                        maximum: 4,
                        decimalPlaces: 4,
                        // majorTickLines: 1,
                      ),
                      series: <LineSeries<SalesData, String>>[
                    LineSeries<SalesData, String>(
                        dataSource: <SalesData>[
                          SalesData('Semester 1', 3.53),
                          SalesData('Semester 2', 2.87),
                          SalesData('Semester 3', 3.4),
                          SalesData('Semester 4', 3.5),
                          SalesData('Semester 5', 2.8),
                          SalesData('Semester 6', 3.4),
                        ],
                        xValueMapper: (SalesData sales, _) => sales.year,
                        yValueMapper: (SalesData sales, _) => sales.sales,
                        markerSettings: MarkerSettings(isVisible: true),
                        // Enable data label
                        dataLabelSettings: DataLabelSettings(isVisible: true))
                  ])),
              //end chart IPK

              SizedBox(
                height: 40,
              ),

              // untuk anda
              Text(
                'Untuk Anda',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: DataColors.dongker,
                ),
              ),

              SizedBox(
                height: 10,
              ),

              // slider image
              Container(
                child: CarouselSlider(
                  items: List.generate(c.urlImage.length, (index) {
                    return Builder(
                      builder: (BuildContext context) {
                        return AnimatedContainer(
                          padding: EdgeInsets.all(15),
                          duration: const Duration(milliseconds: 1000),
                          width: size.width,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(c.urlImage[index]),
                                  fit: BoxFit.cover),
                              borderRadius: BorderRadius.circular(8)),
                          child: Stack(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: ConstrainedBox(
                                  constraints: BoxConstraints(
                                    maxWidth: size.width,
                                  ),
                                  child: AutoSizeText(
                                    c.capsSlider[index],
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: InkWell(
                                  onTap: () {
                                    print('tapped');
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        color: Colors.white.withOpacity(0.4),
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      color: Colors.white,
                                      size: 10,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    );
                  }).toList(),
                  options: CarouselOptions(
                    aspectRatio: 2.5,
                    viewportFraction: 0.8,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    enlargeCenterPage: true,
                    pageSnapping: true,
                    scrollDirection: Axis.horizontal,
                  ),
                ),
              ),
              // end untuk anda

              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SalesData {
  SalesData(this.year, this.sales);
  final String year;
  final double sales;
}
