import 'package:flutte_template/styles/theme_durations.dart';
import 'package:flutter/material.dart';

class SplashViewModel with ChangeNotifier {
  Future<void> init(SplashNavigator navigator) async {
    await Future.delayed(ThemeDurations.longAnimationDuration);
    navigator.goToHome();
  }
}

// ignore: one_member_abstracts
abstract class SplashNavigator {
  void goToHome();
}
