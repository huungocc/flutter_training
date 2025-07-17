import 'package:flutter/material.dart';
import 'package:flutter_training/screen/digit_clock_screen.dart';
import 'package:flutter_training/screen/main_screen.dart';
import 'package:flutter_training/screen/movie/model/movie_model.dart';
import 'package:flutter_training/screen/movie/view/detail_movie_screen.dart';
import 'package:flutter_training/screen/movie/view/list_movie_screen.dart';
import 'package:flutter_training/screen/onboarding/on_boarding_screen.dart';
import 'package:flutter_training/screen/onboarding/sign_screen.dart';
import 'package:flutter_training/screen/todo/view/todo_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'enums.dart';

class Routes {
  Routes._();

  static const String mainScreen = "/mainScreen";
  static const String onBoardingScreen = "/onBoardingScreen";
  static const String signScreen = "/signScreen";
  static const String digitClockScreen = "/digitClockScreen";
  static const String listMovieScreen = "/listMovieScreen";
  static const String detailMovieScreen = "/detailMovieScreen";
  static const String todoScreen = "/todoScreen";

  static String initScreen() => mainScreen;

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case mainScreen:
        return PageTransition(
          child: MainScreen(),
          type: PageTransitionType.fade,
        );
      case onBoardingScreen:
        return PageTransition(
          child: OnBoardingScreen(),
          type: PageTransitionType.rightToLeft,
          isIos: true,
        );
      case signScreen:
        SignType? arg;
        if (settings.arguments is SignType) {
          arg = settings.arguments as SignType;
        }
        return PageTransition(
          child: SignScreen(arg: arg),
          type: PageTransitionType.fade,
          isIos: true,
        );
      case digitClockScreen:
        return PageTransition(
          child: DigitClockScreen(),
          type: PageTransitionType.rightToLeft,
          isIos: true,
        );
      case listMovieScreen:
        return PageTransition(
          child: ListMovieScreen(),
          type: PageTransitionType.rightToLeft,
          isIos: true,
        );
      case detailMovieScreen:
        MovieModel? arg;
        if (settings.arguments is MovieModel) {
          arg = settings.arguments as MovieModel;
        }
        return PageTransition(
          child: DetailMovieScreen(arg: arg),
          type: PageTransitionType.rightToLeft,
          isIos: true,
        );
      case todoScreen:
        return PageTransition(
          child: TodoScreen(),
          type: PageTransitionType.rightToLeft,
          isIos: true,
        );
      default:
        return MaterialPageRoute(builder: (context) => Container());
    }
  }
}
