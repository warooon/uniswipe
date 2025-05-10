import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../routes/app_pages.dart';

class LoginController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final hidePassword = true.obs;
  final isLoading = false.obs;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void togglePasswordVisibility() => hidePassword.value = !hidePassword.value;

  void forgotPassword() {
    Get.dialog(
      AlertDialog(
        title: Text('Forgot Password'),
        content: Text('Password reset functionality will be implemented here.'),
        actions: [
          TextButton(onPressed: () => Get.back(), child: Text('Close')),
        ],
      ),
    );
  }

  Future<void> login(String email, String password) async {
    if (email.isEmpty || password.isEmpty) {
      Get.snackbar("Error", "Email and password cannot be empty");
      return;
    }

    isLoading.value = true;

    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      Get.offAllNamed(Routes.HOME);
    } on FirebaseAuthException catch (e) {
      String message;

      switch (e.code) {
        case 'user-not-found':
          message = "No user found with that email.";
          break;
        case 'wrong-password':
          message = "Incorrect password.";
          break;
        case 'invalid-email':
          message = "The email address is badly formatted.";
          break;
        case 'user-disabled':
          message = "This user has been disabled.";
          break;
        default:
          message = "An unexpected error occurred. (${e.code})";
      }

      Get.snackbar("Login Failed", message);
    } catch (e) {
      Get.snackbar("Login Failed", "Something went wrong. Please try again.");
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
