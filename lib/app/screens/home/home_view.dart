import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../routes/app_pages.dart';
import 'home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        appBar: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: IconButton(
                icon: const Icon(Icons.person, size: 30),
                onPressed: () => Get.toNamed(Routes.PROFILE),
              ),
            )
          ],
          scrolledUnderElevation: 0,
          centerTitle: true,
          title: const Text(
            "Find a Match",
            style: TextStyle(
                color: Colors.black, fontFamily: "Raleway", fontSize: 30),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: Placeholder());
  }
}
