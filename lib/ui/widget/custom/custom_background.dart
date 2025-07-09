import 'package:flutter/material.dart';

import '../../../res/colors.dart';

class CustomBackground extends StatelessWidget {
  const CustomBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          Positioned(
            top: -500 / 2,
            right: -500 / 2,
            child: Container(
              width: 500,
              height: 500,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.fff8f9ff,
              ),
            ),
          ),
          Positioned(
            top: -600/2 + 30,
            right: -600/2 + 70,
            child: Container(
              width: 600,
              height: 600,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppColors.fff8f9ff,
                  width: 3,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: -300,
            left: -400,
            child: Container(
              width: 500,
              height: 500,
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.fff8f9ff,
                  width: 3,
                ),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(-350, 600),
            child: Transform.rotate(
              angle: 45 * 3.1415926 / 180,
              child: Positioned(
                bottom: -300,
                left: -400,
                child: Container(
                  width: 500,
                  height: 500,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColors.fff8f9ff,
                      width: 3,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
