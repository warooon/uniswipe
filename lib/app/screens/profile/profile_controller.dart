import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../../routes/app_pages.dart'; // make sure this is where Routes.LOGIN is defined

class ProfileController extends GetxController {
  void logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      Get.offAllNamed(Routes.LOGIN);
    } catch (e) {
      Get.snackbar("Logout Failed", "An error occurred. Please try again.");
    }
  }
}
