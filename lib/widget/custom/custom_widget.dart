import 'package:flutter/material.dart';
import 'package:flutter_training/gen/assets.gen.dart';
import 'package:flutter_training/res/colors.dart';
import 'package:flutter_training/widget/base_text_label.dart';
import 'package:flutter_training/util/enums.dart';

class CustomWidget {
  static Widget infoItem(MovieIconType type, String info) {
    Widget? icon;
    Color color = AppColors.white;
    FontWeight fontWeight = FontWeight.normal;
    switch (type) {
      case MovieIconType.star:
        icon = Assets.icons.icStar.svg();
        color = AppColors.fff98703;
        fontWeight = FontWeight.w600;
      case MovieIconType.ticket:
        icon = Assets.icons.icTicket.svg();
      case MovieIconType.calendar:
        icon = Assets.icons.icCalendar.svg();
      case MovieIconType.clock:
        icon = Assets.icons.icClock.svg();
    }
    return Row(
      spacing: 5,
      children: [
        icon,
        BaseTextLabel(info, color: color, fontWeight: fontWeight,)
      ],
    );
  }

  static Widget todoIcon(TodoIconType type, {GestureTapCallback? onTap, bool isSelected = false}) {
    Widget? icon;
    Color color = AppColors.white;
    switch (type) {
      case TodoIconType.list:
        icon = Assets.icons.icTodoList.svg(height: 30);
        color = AppColors.bgListIcon;
        break;
      case TodoIconType.calendar:
        icon = Assets.icons.icTodoCalendar2.svg(height: 30);
        color = AppColors.bgCalendarIcon;
        break;
      case TodoIconType.trophy:
        icon = Assets.icons.icTodoTrophy.svg(height: 30);
        color = AppColors.bgTrophyIcon;
        break;
    }

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(100),
          border: Border.all(
            width: 3,
            color: isSelected ? AppColors.todoPurple : AppColors.white,
          ),
        ),
        child: icon,
      ),
    );
  }
}