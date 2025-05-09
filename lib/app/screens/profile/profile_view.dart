import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/app_colors.dart';
import 'profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "Profile",
            style: TextStyle(color: Colors.black),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(Icons.arrow_back),
            color: Colors.black,
          )),
      extendBody: true,
      backgroundColor: AppColor.pageColor,
      body: ListView(
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(40, 0, 40, 20),
            // margin: EdgeInsets.only(top: screenHeight * 0.02),
            child: Image.asset(
              "assets/images/profile_pic_placeholder.png",
              height: 250,
            ),
          ),
          Column(children: [
            Text(
              "JANE DOE",
              style: TextStyle(
                  fontFamily: "inter",
                  color: AppColor.weirdBlue,
                  fontWeight: FontWeight.bold,
                  fontSize: 35),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              "Student",
              style: TextStyle(
                  fontFamily: "inter",
                  fontSize: 16,
                  color: AppColor.accentGrey),
            ),
          ]),
          const SizedBox(
            height: 20,
          ),
          Column(
            children: [
            
            ],
          )
        ],
      ),
    );
  }
}
