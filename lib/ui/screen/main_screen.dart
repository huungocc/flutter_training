import 'package:flutter/material.dart';
import 'package:flutter_training/ui/widget/base_button.dart';
import 'package:flutter_training/ui/widget/base_screen.dart';
import 'package:flutter_training/ui/widget/base_text_label.dart';

import '../../res/colors.dart';
import '../../util/routes.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      colorBackground: AppColors.white,
      hideAppBar: true,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BaseButton(
                title: 'Login Screen',
                titleColor: AppColors.white,
                backgroundColor: AppColors.black,
                borderRadius: 20,
                onTap: () {
                  Navigator.pushNamed(context, Routes.onBoardingScreen);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
