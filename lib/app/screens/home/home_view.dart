import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swipe_cards/swipe_cards.dart';
import 'package:uniswipe/app/utils/app_colors.dart'; // Assuming you have this

import '../../routes/app_pages.dart';
import 'home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set the background color to white
      body: Container(
        decoration: BoxDecoration(),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 20,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Find a Match",
                      style: TextStyle(
                        color: AppColor.primaryText,
                        fontFamily: "Raleway",
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Get.toNamed(Routes.PROFILE),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white, // Softer background for the icon
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(
                                0.1,
                              ), // Softer shadow
                              blurRadius: 10,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        padding: EdgeInsets.all(8),
                        child: Icon(
                          Icons.person_outline_rounded, // A more modern icon
                          color: AppColor.primaryText,
                          size: 32,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Center(
                  child: Obx(() {
                    if (controller.matchEngine.value == null) {
                      return CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                          AppColor.primaryText,
                        ), // Themed progress indicator
                      );
                    }
                    return SizedBox(
                      width:
                          MediaQuery.of(context).size.width *
                          0.88, // Slightly wider
                      height:
                          MediaQuery.of(context).size.height *
                          0.65, // Slightly taller
                      child: SwipeCards(
                        matchEngine: controller.matchEngine.value!,
                        itemBuilder: (context, index) {
                          final profile = controller.profiles[index];
                          return _ProfileCard(profile: profile);
                        },
                        onStackFinished: () {
                          Get.snackbar(
                            "No more profiles",
                            "Check back later!",
                            snackPosition: SnackPosition.BOTTOM,
                          ); // More subtle snackbar
                        },
                        itemChanged: (SwipeItem item, int index) {},
                        upSwipeAllowed: true,
                        fillSpace: true,
                        likeTag: _SwipeTag(
                          icon: Icons.favorite_rounded, // Rounded icon
                          color: AppColor.likeColor,
                          label: "Approve",
                        ),
                        nopeTag: _SwipeTag(
                          icon: Icons.close_rounded, // Rounded icon
                          color: AppColor.nopeColor,
                          label: "Decline",
                        ),
                        superLikeTag: _SwipeTag(
                          icon: Icons.bookmark_rounded, // Rounded icon
                          color: AppColor.bookmarkColor,
                          label: "Bookmark",
                        ),
                      ),
                    );
                  }),
                ),
              ),
              // Swipe Hints at the Bottom - Adjusted Padding
              Padding(
                padding: const EdgeInsets.only(bottom: 40.0, top: 16),
                child: Row(
                  mainAxisAlignment:
                      MainAxisAlignment.spaceEvenly, // More spacing
                  children: [
                    _SwipeHint(
                      icon: Icons.close_rounded, // Rounded icon
                      color: AppColor.nopeColor,
                      label: "Decline",
                    ),
                    _SwipeHint(
                      icon: Icons.bookmark_rounded, // Rounded icon
                      color: AppColor.bookmarkColor,
                      label: "Bookmark",
                    ),
                    _SwipeHint(
                      icon: Icons.favorite_rounded, // Rounded icon
                      color: AppColor.likeColor,
                      label: "Approve",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProfileCard extends StatelessWidget {
  final dynamic profile;

  const _ProfileCard({required this.profile});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.88, // Slightly wider
      height: MediaQuery.of(context).size.height * 0.62, // Adjusted height
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32), // More rounded corners
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(
              0.15,
            ), // Softer, more diffused shadow
            blurRadius: 12,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(
          32,
        ), // Match container's border radius
        child: Stack(
          children: [
            // Profile image
            Image.network(
              profile['imageUrl'] ?? 'https://i.pravatar.cc/300',
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
            // Gradient overlay - More subtle
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.transparent,
                    Colors.black.withOpacity(0.3), // Less intense black
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
            // Profile info - Adjusted styling
            Positioned(
              left: 24,
              bottom: 32,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    profile['name'] ?? "Name",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28, // Slightly larger name
                      fontWeight: FontWeight.w600, // Semi-bold
                      fontFamily: "Raleway",
                      shadows: [
                        // Subtle text shadow for better readability
                        Shadow(
                          blurRadius: 4,
                          color: Colors.black.withValues(alpha: 0.4),
                          offset: Offset(1, 1),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    "${profile['age'] ?? '--'} · ${profile['bio'] ?? 'Bio'}",
                    style: TextStyle(
                      color: Colors.white.withValues(
                        alpha: 0.85,
                      ), // Slightly lighter text
                      fontSize: 17,
                      fontFamily: "Modernist",
                      shadows: [
                        Shadow(
                          blurRadius: 2,
                          color: Colors.black.withValues(alpha: 0.3),
                          offset: Offset(1, 1),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SwipeTag extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String label;

  const _SwipeTag({
    required this.icon,
    required this.color,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 18,
        vertical: 10,
      ), // Adjusted padding
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.8), // Slightly less opaque
        borderRadius: BorderRadius.circular(24), // More rounded
        boxShadow: [
          // Subtle shadow for the tags
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Colors.white, size: 24), // Slightly larger icon
          SizedBox(width: 10),
          Text(
            label,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500, // Slightly lighter bold
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}

class _SwipeHint extends StatefulWidget {
  final IconData icon;
  final Color color;
  final String label;

  const _SwipeHint({
    required this.icon,
    required this.color,
    required this.label,
  });

  @override
  _SwipeHintState createState() => _SwipeHintState();
}

class _SwipeHintState extends State<_SwipeHint> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _opacityAnimation; // Added opacity animation

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200), // Slightly faster animation
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.15).animate(
      // Less extreme scale
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
    _opacityAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      // Subtle opacity change
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _controller.forward().then((_) => _controller.reverse());
      },
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Opacity(
            opacity: _opacityAnimation.value,
            child: Transform.scale(
              scale: _scaleAnimation.value,
              child: Column(
                children: [
                  Icon(
                    widget.icon,
                    color: widget.color,
                    size: 36, // Slightly larger icon
                  ),
                  SizedBox(height: 8),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                    decoration: BoxDecoration(
                      color: widget.color.withValues(alpha: 0.08),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: widget.color.withValues(alpha: 0.2),
                          blurRadius: 5,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Text(
                      widget.label,
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 15,
                        fontFamily: "Raleway",
                        fontWeight: FontWeight.w500, // Slightly lighter bold
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
