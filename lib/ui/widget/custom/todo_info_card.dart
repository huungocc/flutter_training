import 'package:flutter/material.dart';
import 'package:flutter_training/res/colors.dart';
import 'package:flutter_training/ui/widget/base_text_label.dart';
import 'package:flutter_training/ui/widget/custom/custom_widget.dart';
import 'package:flutter_training/util/constant.dart';

class TodoInfoCard extends StatelessWidget {
  final BorderRadiusGeometry? borderRadiusGeometry;
  final String? title;
  final String? time;
  final String? type;
  final bool isCompleted;
  final Function? onCheck;
  final VoidCallback? onTap;

  const TodoInfoCard({
    super.key,
    this.borderRadiusGeometry,
    this.title,
    this.time,
    this.type,
    this.isCompleted = false,
    this.onTap,
    this.onCheck,
  });

  @override
  Widget build(BuildContext context) {
    TodoIconType todoType = TodoIconType.list;
    switch (type) {
      case 'list':
        todoType = TodoIconType.list;
      case 'calendar':
        todoType = TodoIconType.calendar;
      case 'trophy':
        todoType = TodoIconType.trophy;
    }
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: borderRadiusGeometry ?? BorderRadius.circular(20),
        ),
        padding: EdgeInsets.symmetric(horizontal: 18, vertical: 14),
        child: Row(
          children: [
            Expanded(
              child: Stack(
                children: [
                  Row(
                    spacing: 15,
                    children: [
                      CustomWidget.todoIcon(todoType),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 4,
                          children: [
                            BaseTextLabel(
                              title,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              maxLines: 1,
                              decoration: isCompleted
                                  ? TextDecoration.lineThrough
                                  : null,
                            ),
                            BaseTextLabel(
                              time,
                              fontSize: 16,
                              color: AppColors.gray,
                              fontWeight: FontWeight.w500,
                              maxLines: 1,
                              decoration: isCompleted
                                  ? TextDecoration.lineThrough
                                  : null,
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
