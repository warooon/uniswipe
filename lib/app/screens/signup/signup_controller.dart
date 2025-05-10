import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/app_pages.dart';

class SignupController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final hidePassword = true.obs;
  final hideConfirmPassword = true.obs;
  final isLoading = false.obs;

  void togglePasswordVisibility() => hidePassword.value = !hidePassword.value;
  void toggleConfirmPasswordVisibility() =>
      hideConfirmPassword.value = !hideConfirmPassword.value;

  Future<void> register(
    String email,
    String password,
    String confirmPassword,
  ) async {
    if (email.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
      Get.snackbar("Error", "All fields are required.");
      return;
    }

    if (password != confirmPassword) {
      Get.snackbar("Error", "Passwords do not match.");
      return;
    }

    isLoading.value = true;

    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      Get.offAllNamed(Routes.HOME);
    } on FirebaseAuthException catch (e) {
      String message = switch (e.code) {
        'email-already-in-use' => "Email already in use.",
        'invalid-email' => "Invalid email format.",
        'weak-password' => "Password should be at least 6 characters.",
        _ => "Signup failed. (${e.code})",
      };
      Get.snackbar("Signup Failed", message);
    } catch (e) {
      Get.snackbar("Signup Failed", "Unexpected error. Please try again.");
    } finally {
      isLoading.value = false;
    }
  }
}
