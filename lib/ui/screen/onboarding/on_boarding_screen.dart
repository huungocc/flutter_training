import 'package:flutter/material.dart';
import 'package:flutter_training/ui/widget/base_button.dart';
import 'package:flutter_training/ui/widget/base_screen.dart';
import 'package:flutter_training/ui/widget/base_text_label.dart';

import '../../../gen/assets.gen.dart';
import '../../../res/colors.dart';
import '../../../util/enums.dart';
import '../../../util/routes.dart';
import '../../widget/custom/custom_background.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      colorAppBar: Colors.transparent,
      customBackground: CustomBackground(),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          children: [
            Assets.images.welcomeImage.image(),
            const SizedBox(height: 20,),
            BaseTextLabel(
              'Discover Your Dream Job here',
              color: AppColors.ff1f41bb,
              fontWeight: FontWeight.bold,
              fontSize: 35,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40,),
            BaseTextLabel(
              'Explore all the existing job roles based on your interest and study major',
              color: AppColors.black,
              fontSize: 14,
              textAlign: TextAlign.center,
            ),
            Spacer(),
            SafeArea(
              child: Row(
                children: [
                  Expanded(
                    child: BaseButton(
                      backgroundColor: AppColors.ff1f41bb,
                      height: 60,
                      borderRadius: 15,
                      onTap: () => Navigator.pushNamed(context, Routes.signScreen, arguments: SignType.login),
                      shadowColor: AppColors.ff1f41bb.withOpacity(0.5),
                      child: BaseTextLabel('Login', fontWeight: FontWeight.bold, fontSize: 18, color: AppColors.white,),
                    ),
                  ),
                  const SizedBox(width: 20,),
                  Expanded(
                    child: BaseButton(
                      backgroundColor: Colors.transparent,
                      titleColor: AppColors.black,
                      height: 60,
                      borderRadius: 15,
                      onTap: () => Navigator.pushNamed(context, Routes.signScreen, arguments: SignType.register),
                      child: BaseTextLabel('Register', fontWeight: FontWeight.bold, fontSize: 18,),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 30,),
          ],
        ),
      ),
    );
  }
}
