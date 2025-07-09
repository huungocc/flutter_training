import 'package:flutter/material.dart';
import 'package:flutter_training/ui/screen/onboarding/sign_screen.dart';
import 'package:page_transition/page_transition.dart';

import '../ui/screen/main_screen.dart';
import '../ui/screen/onboarding/on_boarding_screen.dart';
import 'enums.dart';

class Routes {
  Routes._();

  static const String mainScreen = "/mainScreen";
  static const String onBoardingScreen = "/onBoardingScreen";
  static const String signScreen = "/signScreen";

  static String initScreen() => mainScreen;

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case mainScreen:
        return PageTransition(child: MainScreen(), type: PageTransitionType.fade);
      case onBoardingScreen:
        return PageTransition(child: OnBoardingScreen(), type: PageTransitionType.rightToLeft);
      case signScreen:
        SignType? arg;
        if (settings.arguments is SignType) {
          arg = settings.arguments as SignType;
        }
        return PageTransition(
            child: SignScreen(
                arg: arg
            ),
            type: PageTransitionType.fade
        );
      default:
        return MaterialPageRoute(builder: (context) => Container());
    }
  }
}