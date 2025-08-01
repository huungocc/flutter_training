import 'package:flutter/material.dart';
import 'package:flutter_training/gen/assets.gen.dart';
import 'package:flutter_training/gen_l10n/app_localizations.dart';
import 'package:flutter_training/res/colors.dart';
import 'package:flutter_training/ui/widget/base_button.dart';
import 'package:flutter_training/ui/widget/base_screen.dart';
import 'package:flutter_training/ui/widget/base_text_label.dart';
import 'package:flutter_training/ui/widget/custom/custom_onboarding_background.dart';
import 'package:flutter_training/util/constant.dart';
import 'package:flutter_training/util/routes.dart';


class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      hideAppBar: true,
      customBackground: CustomBackground(),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            children: [
              const SizedBox(height: 30,),
              Assets.images.welcomeImage.image(),
              const SizedBox(height: 20,),
              BaseTextLabel(
                AppLocalizations.of(context)!.discover_your_dream,
                color: AppColors.ff1f41bb,
                fontWeight: FontWeight.bold,
                fontSize: 35,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40,),
              BaseTextLabel(
                AppLocalizations.of(context)!.explorer_all_job,
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
                        child: BaseTextLabel(AppLocalizations.of(context)!.login, fontWeight: FontWeight.w600, fontSize: 18, color: AppColors.white,),
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
                        child: BaseTextLabel(AppLocalizations.of(context)!.register, fontWeight: FontWeight.w600, fontSize: 18,),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 30,),
            ],
          ),
        ),
      ),
    );
  }
}
