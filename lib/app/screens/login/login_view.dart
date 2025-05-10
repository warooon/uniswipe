// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../routes/app_pages.dart';
import '../../utils/app_colors.dart';
import '../../widgets/app_button.dart';
import 'login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColor.bgColor,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Hero(
                    tag: 'logo',
                    child: Image.asset(
                      "assets/images/loginphoto.png",
                      height: screenHeight * 0.18,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    "Uniswipe",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Pacifico",
                      fontSize: 46,
                      shadows: [
                        Shadow(
                          color: Colors.black.withValues(alpha: 0.3),
                          offset: const Offset(0, 3),
                          blurRadius: 6,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.06),

                  // Email
                  _buildTextField(
                    labelText: "Your Email",
                    prefixIcon: Icons.email_outlined,
                    keyboardType: TextInputType.emailAddress,
                    controller: controller.emailController,
                  ),
                  SizedBox(height: screenHeight * 0.03),

                  // Password
                  Obx(
                    () => _buildTextField(
                      labelText: "Password",
                      prefixIcon: Icons.lock_outline,
                      obscureText: controller.hidePassword.value,

                      controller: controller.passwordController,
                      suffixIcon: IconButton(
                        icon: Icon(
                          controller.hidePassword.value
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Colors.white70,
                        ),
                        onPressed: () => controller.togglePasswordVisibility(),
                      ),
                    ),
                  ),

                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () => controller.forgotPassword(),
                      child: Text(
                        "Forgot Password?",
                        style: TextStyle(
                          color: Colors.white70,
                          fontFamily: "Modernist",
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.03),

                  Obx(
                    () => AppButton(
                      text: "LOGIN",
                      isLoading: controller.isLoading.value,
                      onPressed:
                          () => controller.login(
                            controller.emailController.text,
                            controller.passwordController.text,
                          ),
                    ),
                  ),

                  SizedBox(height: screenHeight * 0.025),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildSocialLoginButton(
                        FaIcon(FontAwesomeIcons.facebookF, color: Colors.white),
                        Colors.blue,
                      ),
                      SizedBox(width: 20),
                      _buildSocialLoginButton(
                        FaIcon(FontAwesomeIcons.google, color: Colors.white),
                        Colors.red,
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.03),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account yet? ",
                        style: TextStyle(
                          fontFamily: "Modernist",
                          color: Colors.white70,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Get.toNamed(Routes.SIGNUP),
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
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String labelText,
    required IconData prefixIcon,
    TextInputType keyboardType = TextInputType.text,
    bool obscureText = false,
    Widget? suffixIcon,
    TextEditingController? controller,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: TextField(
        controller: controller,
        style: TextStyle(color: Colors.white),
        keyboardType: keyboardType,
        obscureText: obscureText,
        textAlignVertical: TextAlignVertical.center,
        cursorColor: AppColor.loginYellow,

        decoration: InputDecoration(
          isDense: true,
          contentPadding: EdgeInsets.symmetric(
            vertical: 18,
          ), // Increased vertical padding
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 12, right: 8),
            child: Icon(prefixIcon, color: Colors.white70, size: 22),
          ),
          prefixIconConstraints: BoxConstraints(minHeight: 32, minWidth: 40),
          suffixIcon: suffixIcon,
          labelText: labelText,
          labelStyle: TextStyle(color: Colors.white70, fontFamily: "Modernist"),
          floatingLabelBehavior: FloatingLabelBehavior.never,
        ),
      ),
    );
  }

  Widget _buildSocialLoginButton(Widget icon, Color bgColor) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(color: bgColor, shape: BoxShape.circle),
        child: Center(child: icon),
      ),
    );
  }
}
