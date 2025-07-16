import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_training/res/colors.dart';
import 'package:flutter_training/ui/widget/base_screen.dart';
import 'package:flutter_training/ui/widget/custom/custom_digit_number.dart';
import 'package:intl/intl.dart';


class DigitClockScreen extends StatefulWidget {
  const DigitClockScreen({super.key});

  @override
  State<DigitClockScreen> createState() => _DigitClockScreenState();
}

class _DigitClockScreenState extends State<DigitClockScreen> {
  DateTime time = DateTime.now();
  late Timer timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      setState(() {
        time = time.add(const Duration(seconds: 1));
      });
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final String timeString = DateFormat('mm:ss').format(time);
    final List<int> timeNumberList = timeString
        .replaceAll(':', '')
        .split('')
        .map(int.parse)
        .toList();

    return BaseScreen(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomDigitNumber(number: timeNumberList[0]),
            const SizedBox(width: 10),
            CustomDigitNumber(number: timeNumberList[1]),
            const SizedBox(width: 10),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(width: 8, height: 8, color: AppColors.black),
                const SizedBox(height: 10),
                Container(width: 8, height: 8, color: AppColors.black),
              ],
            ),
            const SizedBox(width: 10),
            CustomDigitNumber(number: timeNumberList[2]),
            const SizedBox(width: 10),
            CustomDigitNumber(number: timeNumberList[3]),
          ],
        ),
      ),
    );
  }
}
