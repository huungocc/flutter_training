import 'package:flutter/material.dart';
import 'package:flutter_training/view/widget/base_text_label.dart';
import 'package:flutter_training/util/enums.dart';

import '../../../gen/assets.gen.dart';
import '../../../res/colors.dart';

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
    return SizedBox(
      child: Row(
        spacing: 5,
        children: [
          icon,
          BaseTextLabel(info, color: color, fontWeight: fontWeight,)
        ],
      ),
    );
  }
}