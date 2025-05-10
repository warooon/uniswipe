import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/app_colors.dart';
import 'profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // White background for a cleaner look
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded, color: Colors.black),
          onPressed: () => Get.back(),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 32),
            Center(
              child: Stack(
                children: [
                  Container(
                    width: 140,
                    height: 140,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppColor.primaryColor,
                        width: 3,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 12,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: const CircleAvatar(
                      radius: 60,
                      backgroundImage: AssetImage(
                        "assets/images/profile_pic_placeholder.png",
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: () {
                        // Handle edit profile picture
                      },
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColor.accentColor,
                          border: Border.all(color: Colors.white, width: 2),
                        ),
                        child: const Icon(
                          Icons.edit_rounded,
                          color: Colors.white,
                          size: 24,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: Column(
                children: [
                  Text(
                    "Jane Doe",
                    style: TextStyle(
                      fontFamily: "Inter",
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: AppColor.primaryColor,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    "Student",
                    style: TextStyle(
                      fontFamily: "Inter",
                      fontSize: 18,
                      color: AppColor.secondaryTextColor,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            // Profile settings tiles
            _profileOptionTile(
              icon: Icons.account_box_rounded,
              title: "Show Profile",
              onTap: () {
                // Navigate to profile detail page
              },
            ),
            _profileOptionTile(
              icon: Icons.backup_table_rounded,
              title: "Backup & Sync",
              onTap: () {
                // Navigate to backup and sync settings
              },
            ),
            _profileOptionTile(
              icon: Icons.password_rounded,
              title: "Change Password",
              onTap: () {
                // Show about app info
              },
            ),

            const Divider(
              color: Colors.grey,
              thickness: 1,
              indent: 0,
              endIndent: 0,
            ),

            _profileOptionTile(
              icon: Icons.lock_outline_rounded,
              title: "Privacy Settings",
              onTap: () {
                // Navigate to privacy settings
              },
            ),
            _profileOptionTile(
              icon: Icons.settings_outlined,
              title: "App Preferences",
              onTap: () {
                // Navigate to app preferences
              },
            ),

            _profileOptionTile(
              icon: Icons.info_outline_rounded,
              title: "About App",
              onTap: () {
                // Show about app info
              },
            ),

            const Divider(
              color: Colors.grey,
              thickness: 1,
              indent: 0,
              endIndent: 0,
            ),
            _profileOptionTile(
              icon: Icons.logout_rounded,
              title: "Logout",
              iconColor: Colors.redAccent,
              textColor: Colors.redAccent,
              onTap: () {
                controller.logout();
              },
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _profileOptionTile({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    Color? iconColor,
    Color? textColor,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          children: [
            Icon(
              icon,
              color: iconColor ?? AppColor.primaryColor.withOpacity(0.8),
              size: 26,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontFamily: "Inter",
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: textColor ?? Colors.black87,
                ),
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 20,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
