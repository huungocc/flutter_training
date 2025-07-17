import 'package:flutter/material.dart';
import 'package:flutter_training/gen/assets.gen.dart';
import 'package:flutter_training/gen_l10n/app_localizations.dart';
import 'package:flutter_training/res/colors.dart';
import 'package:flutter_training/widget/base_button.dart';
import 'package:flutter_training/widget/base_screen.dart';
import 'package:flutter_training/widget/base_text_input.dart';
import 'package:flutter_training/widget/base_text_label.dart';
import 'package:flutter_training/widget/custom/custom_onboarding_background.dart';
import 'package:flutter_training/util/enums.dart';

class SignScreen extends StatefulWidget {
  final SignType? arg;

  const SignScreen({super.key, this.arg});

  @override
  State<SignScreen> createState() => _SignScreenState();
}

class _SignScreenState extends State<SignScreen> {
  SignType? signType;

  @override
  void initState() {
    super.initState();
    if (widget.arg != null && widget.arg is SignType) {
      signType = widget.arg;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      colorAppBar: Colors.transparent,
      customBackground: CustomBackground(),
      body: Column(
        children: [
          Expanded(
            child: AnimatedSwitcher(
              duration: Duration(milliseconds: 300),
              switchInCurve: Curves.easeIn,
              switchOutCurve: Curves.easeOut,
              transitionBuilder: (Widget child, Animation<double> animation) {
                return FadeTransition(
                  opacity: animation,
                  child: child,
                );
              },
              child: _buildForm(),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 40),
              child: _continueForm(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildForm() {
    switch (signType) {
      case SignType.login:
        return _loginForm(key: ValueKey('login'));
      case SignType.register:
        return _registerForm(key: ValueKey('register'));
      default:
        return Container();
    }
  }

  Widget _loginForm({Key? key}) {
    return Container(
      key: key,
      margin: EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              BaseTextLabel(
                AppLocalizations.of(context)!.login_here,
                color: AppColors.ff1f41bb,
                fontSize: 30,
                fontWeight: FontWeight.bold,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              BaseTextLabel(
                AppLocalizations.of(context)!.welcome_back,
                fontSize: 20,
                fontWeight: FontWeight.w500,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 50),
              BaseTextInput(
                hintText: AppLocalizations.of(context)!.email,
                colorBgTextField: AppColors.fff1f4ff,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.white,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.ff1f41bb,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              const SizedBox(height: 20),
              BaseTextInput(
                hintText: AppLocalizations.of(context)!.password,
                colorBgTextField: AppColors.fff1f4ff,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.white,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.ff1f41bb,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.centerRight,
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {

                    },
                    child: BaseTextLabel(
                      AppLocalizations.of(context)!.forgot_password,
                      fontWeight: FontWeight.w500,
                      color: AppColors.ff1f41bb,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              BaseButton(
                title: AppLocalizations.of(context)!.sign_in,
                titleSize: 20,
                height: 60,
                titleWeight: FontWeight.bold,
                backgroundColor: AppColors.ff1f41bb,
                shadowColor: AppColors.ff1f41bb.withOpacity(0.5),
              ),
              const SizedBox(height: 40),
              Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    setState(() {
                      signType = SignType.register;
                    });
                  },
                  child: BaseTextLabel(
                    AppLocalizations.of(context)!.create_new_account,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _registerForm({Key? key}) {
    return Container(
      key: key,
      margin: EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              BaseTextLabel(
                AppLocalizations.of(context)!.create_account,
                color: AppColors.ff1f41bb,
                fontSize: 30,
                fontWeight: FontWeight.bold,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              BaseTextLabel(
                AppLocalizations.of(context)!.create_account_explore,
                fontWeight: FontWeight.w500,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 50),
              BaseTextInput(
                hintText: AppLocalizations.of(context)!.email,
                colorBgTextField: AppColors.fff1f4ff,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.white,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.ff1f41bb,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              const SizedBox(height: 20),
              BaseTextInput(
                hintText: AppLocalizations.of(context)!.password,
                colorBgTextField: AppColors.fff1f4ff,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.white,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.ff1f41bb,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              const SizedBox(height: 20),
              BaseTextInput(
                hintText: AppLocalizations.of(context)!.confirm_password,
                colorBgTextField: AppColors.fff1f4ff,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.white,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.ff1f41bb,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              const SizedBox(height: 40),
              BaseButton(
                title: AppLocalizations.of(context)!.sign_up,
                titleSize: 20,
                height: 60,
                titleWeight: FontWeight.bold,
                backgroundColor: AppColors.ff1f41bb,
                shadowColor: AppColors.ff1f41bb.withOpacity(0.5),
              ),
              const SizedBox(height: 40),
              Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    setState(() {
                      signType = SignType.login;
                    });
                  },
                  child: BaseTextLabel(
                    AppLocalizations.of(context)!.already_account,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _continueForm() {
    return Column(
      children: [
        BaseTextLabel(
          AppLocalizations.of(context)!.or_continue,
          fontWeight: FontWeight.w500,
          color: AppColors.ff1f41bb,
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BaseButton(
              backgroundColor: AppColors.ffececec,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: Assets.icons.icGoogle.svg(),
              ),
            ),
            const SizedBox(width: 20),
            BaseButton(
              backgroundColor: AppColors.ffececec,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: Assets.icons.icFacebook.svg(),
              ),
            ),
            const SizedBox(width: 20),
            BaseButton(
              backgroundColor: AppColors.ffececec,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: Assets.icons.icApple.svg(),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
