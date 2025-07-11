import 'package:flutter/material.dart';
import 'package:flutter_training/model/movie_model.dart';
import 'package:flutter_training/view/screen/movie/detail_movie_screen.dart';
import 'package:flutter_training/view/screen/movie/list_movie_screen.dart';
import 'package:flutter_training/view/screen/onboarding/sign_screen.dart';
import 'package:page_transition/page_transition.dart';

import '../view/screen/digit_clock_screen.dart';
import '../view/screen/main_screen.dart';
import '../view/screen/onboarding/on_boarding_screen.dart';
import 'enums.dart';

class Routes {
  Routes._();

  static const String mainScreen = "/mainScreen";
  static const String onBoardingScreen = "/onBoardingScreen";
  static const String signScreen = "/signScreen";
  static const String digitClockScreen = "/digitClockScreen";
  static const String listMovieScreen = "/listMovieScreen";
  static const String detailMovieScreen = "/detailMovieScreen";

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
      case digitClockScreen:
        return PageTransition(child: DigitClockScreen(), type: PageTransitionType.rightToLeft);
      case listMovieScreen:
        return PageTransition(child: ListMovieScreen(), type: PageTransitionType.rightToLeft);
      case detailMovieScreen:
        MovieModel? arg;
        if (settings.arguments is MovieModel) {
          arg = settings.arguments as MovieModel;
        }
        return PageTransition(
            child: DetailMovieScreen(
                arg: arg
            ),
            type: PageTransitionType.rightToLeft
        );
      default:
        return MaterialPageRoute(builder: (context) => Container());
    }
  }
}