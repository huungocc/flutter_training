import 'package:flutter/material.dart';
import 'package:flutter_training/res/colors.dart';
import 'package:flutter_training/ui/widget/base_text_label.dart';
import 'package:flutter_training/ui/widget/custom/custom_widget.dart';
import 'package:flutter_training/util/enums.dart';

class TodoInfoCard extends StatelessWidget {
  final String? title;
  final String? time;
  final bool isCompleted;
  final Function? onCheck;
  final VoidCallback? onTap;

  const TodoInfoCard({
    super.key,
    this.title,
    this.time,
    this.isCompleted = false,
    this.onTap,
    this.onCheck,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: AppColors.white,
        padding: EdgeInsets.symmetric(horizontal: 18, vertical: 14),
        child: Row(
          children: [
            Expanded(
              child: Stack(
                children: [
                  Row(
                    spacing: 15,
                    children: [
                      CustomWidget.todoIcon(TodoIconType.trophy),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BaseTextLabel(
                              title,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              maxLines: 1,
                              decoration: isCompleted ? TextDecoration.lineThrough : null,
                            ),
                            BaseTextLabel(
                              time,
                              fontSize: 16,
                              color: AppColors.gray,
                              fontWeight: FontWeight.w500,
                              decoration: isCompleted ? TextDecoration.lineThrough : null,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  if (isCompleted)
                    Positioned.fill(
                      child: Container(color: Colors.white.withOpacity(0.7)),
                    ),
                ],
              ),
            ),
            Checkbox(
              value: isCompleted,
              onChanged: (value) {
                if (onCheck != null) onCheck!();
              },
            ),
          ],
        ),
      ),
    );
  }
}
