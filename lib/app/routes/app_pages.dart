// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';
import 'package:uniswipe/app/screens/home/home_binding.dart';
import 'package:uniswipe/app/screens/home/home_view.dart';
import 'package:uniswipe/app/screens/profile/profile_binding.dart';
import 'package:uniswipe/app/screens/profile/profile_view.dart';

import '../screens/login/login_binding.dart';
import '../screens/login/login_view.dart';


part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
  ];
}
