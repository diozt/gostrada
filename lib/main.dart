import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gostrada/app/bindings/bindings.dart';
import 'package:gostrada/app/routes/app_page.dart';
import 'package:gostrada/app/ui/pages/splash/splash.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';

void main() async{
  await GetStorage.init();
  runApp(const MyApp());
  // disable rotate
  SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
  GlobalBinding().dependencies();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Poppins'),
      home: SplashPage(),
      builder: (context, child) {
        return MediaQuery(
          child: child!,
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        );
      },
      getPages: AppPage.pages,
    );
  }
}
