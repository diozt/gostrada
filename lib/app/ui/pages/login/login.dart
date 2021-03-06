import 'package:flutter/material.dart';
import 'package:gostrada/app/controllers/auth/auth_c.dart';
import 'package:gostrada/app/ui/theme/color.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  final c = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 40.0,
          ),
          child: Obx(
            () => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image(image: AssetImage('assets/images/logo/iikstrada.png')),

                SizedBox(
                  height: 50,
                ),

                Container(
                  child: Text(
                    'Silahkan Login',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),

                SizedBox(
                  height: 40,
                ),

                // form nim
                TextFormField(
                  autocorrect: false,
                  controller: c.nimC,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(14.0),
                    isDense: true,
                    hintText: 'Nomor Induk Mahasiswa (NIM)',
                    hintStyle: const TextStyle(
                      color: Colors.grey, // <-- Change this
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    ),
                    border: new OutlineInputBorder(
                      borderSide: new BorderSide(
                          color: DataColors.semigrey, width: 1.0),
                      borderRadius: BorderRadius.circular(14.0),
                    ),
                  ),
                ),
                // end form nim
                SizedBox(
                  height: 30,
                ),

                // form password

                TextFormField(
                  autocorrect: false,
                  obscureText: c.isVisible.value,
                  controller: c.passC,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(14.0),
                    isDense: true,
                    hintText: 'Kata Sandi',
                    hintStyle: const TextStyle(
                      color: Colors.grey, // <-- Change this
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    ),
                    suffixIcon: IconButton(
                        color: Colors.grey,
                        splashRadius: 1,
                        icon: Icon(c.isVisible.value == false
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined),
                        onPressed: () {
                          c.isVisible.toggle();
                        }),
                    border: new OutlineInputBorder(
                      borderSide: new BorderSide(
                          color: DataColors.semigrey, width: 1.0),
                      borderRadius: BorderRadius.circular(14.0),
                    ),
                  ),
                ),

                //end form password

                SizedBox(
                  height: 10,
                ),
                // error message
                Visibility(
                  visible: c.errorMsg.value,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "*Username atau password salah ",
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ),
                // end forgot password

                // Forgont password
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                    ),
                    onPressed: () {},
                    child: Text(
                      "Lupa Kata Sandi?",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                // end forgot password

                SizedBox(
                  height: 50,
                ),

                // button login
                Container(
                  width: size.width,
                  child: ElevatedButton(
                    onPressed: () => c.login(c.nimC.text, c.passC.text),
                    style: ElevatedButton.styleFrom(
                      primary: DataColors.primary,
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(14.0),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: c.isLoading.isTrue
                          ? SizedBox(
                              height: 15,
                              width: 15,
                              child: CircularProgressIndicator(
                                strokeWidth: 3,
                                valueColor: new AlwaysStoppedAnimation<Color>(
                                    Colors.white),
                              ),
                            )
                          : Text(
                              'Masuk',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                    ),
                  ),
                )
                // end button login
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
