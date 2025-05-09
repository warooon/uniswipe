// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/app_pages.dart';
import '../../utils/app_colors.dart';
import 'login_controller.dart';

class LoginView extends GetView<LoginController> {
  LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: AppColor.bgColor,
        resizeToAvoidBottomInset: false,
        body: Column(
          // mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: Container(
                    height: 150,
                    child: Image(
                      image: AssetImage("assets/images/loginphoto.png"),
                      height: 200,
                      width: 200,
                    ))),
            Center(
              child: Text(
                "Uniswipe",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "Pacifico",
                  fontSize: 50,
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Center(
              child: Container(
                width: screenWidth * 0.8,
                child: TextField(
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                    labelText: "Your Email",
                    labelStyle: TextStyle(
                      color: Colors.white,
                      fontFamily: "Modernist",
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Center(
              child: Container(
                width: screenWidth * 0.8,
                child: TextField(
                  obscureText: true,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                    labelText: "Password",
                    labelStyle: TextStyle(
                      color: Colors.white,
                      fontFamily: "Modernist",
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Center(
                child: SizedBox(
              width: screenWidth * 0.8,
              height: 60,
              child: ElevatedButton(
                onPressed: () => Get.toNamed(Routes.HOME),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  backgroundColor: AppColor.loginYellow,
                ),
                child: Text(
                  "LOGIN",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Modernist",
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account yet? ",
                  style: TextStyle(
                    fontFamily: "Modernist",
                    color: Colors.white,
                    // fontWeight: FontWeight.bold
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed("/signup");
                  },
                  child: Text(
                    "Signup!",
                    style: TextStyle(
                      fontFamily: "Modernist",
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            )
          ],
        ));
  }
}
