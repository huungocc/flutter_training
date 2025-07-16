import 'package:flutter/material.dart';

import '../../../res/colors.dart';

class CustomTodoBackground extends StatelessWidget {
  final double height;

  const CustomTodoBackground({super.key, this.height = 280});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      color: AppColors.todoPurple,
      child: Stack(
        children: [
          Positioned(
            top: -150,
            right: -200,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppColors.todoLightPurple,
                  width: 50,
                ),
              ),
            ),
          ),
          Positioned(
            top: 80,
            left: -350,
            child: Container(
              width: 500,
              height: 500,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppColors.todoLightPurple,
                  width: 50,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
