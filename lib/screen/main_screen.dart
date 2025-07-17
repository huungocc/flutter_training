import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_training/gen_l10n/app_localizations.dart';
import 'package:flutter_training/res/colors.dart';
import 'package:flutter_training/widget/base_button.dart';
import 'package:flutter_training/widget/base_screen.dart';
import 'package:flutter_training/widget/base_text_label.dart';
import 'package:flutter_training/util/language_cubit.dart';
import 'package:flutter_training/util/routes.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

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
            spacing: 10,
            children: [
              BaseButton(
                title: AppLocalizations.of(context)!.login,
                titleColor: AppColors.white,
                backgroundColor: AppColors.black,
                borderRadius: 20,
                onTap: () {
                  Navigator.pushNamed(context, Routes.onBoardingScreen);
                },
              ),
              BaseButton(
                title: AppLocalizations.of(context)!.digit_clock,
                titleColor: AppColors.white,
                backgroundColor: AppColors.black,
                borderRadius: 20,
                onTap: () {
                  Navigator.pushNamed(context, Routes.digitClockScreen);
                },
              ),
              BaseButton(
                title: AppLocalizations.of(context)!.movie,
                titleColor: AppColors.white,
                backgroundColor: AppColors.black,
                borderRadius: 20,
                onTap: () {
                  Navigator.pushNamed(context, Routes.listMovieScreen);
                },
              ),
              BaseButton(
                title: AppLocalizations.of(context)!.todo,
                titleColor: AppColors.white,
                backgroundColor: AppColors.black,
                borderRadius: 20,
                onTap: () {
                  Navigator.pushNamed(context, Routes.todoScreen);
                },
              ),
              BaseButton(
                backgroundColor: AppColors.black,
                borderRadius: 20,
                onTap: () {
                  final currentLang = context.read<LanguageCubit>().state.languageCode;
                  final newLocale = currentLang == 'en' ? const Locale('vi') : const Locale('en');
                  context.read<LanguageCubit>().changeLocale(newLocale);
                },
                child: BaseTextLabel(
                  context.watch<LanguageCubit>().state.languageCode == 'vi' ? '🇻🇳 Tiếng việt' : '🇺🇸 English',
                  color: AppColors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
