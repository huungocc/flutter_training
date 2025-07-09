import 'package:flutter/material.dart';
import 'package:flutter_training/ui/widget/base_screen.dart';
import 'package:flutter_training/ui/widget/base_text_label.dart';

import '../../../res/colors.dart';
import '../../../util/enums.dart';

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
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          children: [
            BaseTextLabel(
              signType == SignType.login ? 'Login here' : 'Create Account',
              color: AppColors.ff1f41bb,
              fontSize: 30,
              fontWeight: FontWeight.bold,
              textAlign: TextAlign.center,
            ),
            BaseTextLabel(
              signType == SignType.login
                  ? 'Welcome back you’ve been missed!'
                  : 'Create an account so you can explore all the existing jobs',
              fontSize: signType == SignType.login ? 20 : 14,
              fontWeight: FontWeight.w500,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
