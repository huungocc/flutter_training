import 'package:flutter/material.dart';
import 'package:flutter_training/view/widget/base_text_label.dart';
import 'package:flutter_training/util/enums.dart';

import '../../../gen/assets.gen.dart';
import '../../../res/colors.dart';

class CustomWidget {
  static Widget infoItem(MovieIconType type, String info) {
    Widget? icon;
    switch (type) {
      case MovieIconType.star:
        icon = Assets.icons.icStar.svg();
      case MovieIconType.ticket:
        icon = Assets.icons.icTicket.svg();
      case MovieIconType.calendar:
        icon = Assets.icons.icCalendar.svg();
      case MovieIconType.clock:
        icon = Assets.icons.icClock.svg();
    }
    return Row(
      children: [
        icon,
        const SizedBox(width: 5,),
        BaseTextLabel(info, color: AppColors.white,)
      ],
    );
  }
}