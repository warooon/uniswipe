// ignore_for_file: constant_identifier_names

part of 'app_pages.dart';

abstract class Routes {
  Routes._();

  static const LOGIN = _Paths.LOGIN;
  static const HOME = _Paths.HOME;
  static const PROFILE = _Paths.PROFILE;

}

abstract class _Paths {
  static const LOGIN = '/login';
  static const HOME = '/home';
  static const PROFILE = '/profile';
}
