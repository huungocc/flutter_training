import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_training/view/widget/base_text_label.dart';
import 'package:flutter_training/view/widget/custom/custom_widget.dart';
import 'package:flutter_training/util/enums.dart';

import '../../../res/colors.dart';

class MovieInfoCard extends StatelessWidget {
  final GestureTapCallback? onTap;

  const MovieInfoCard({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: CachedNetworkImage(
              height: 130,
              width: 100,
              imageUrl: 'https://image.api.playstation.com/vulcan/ap/rnd/202306/1219/60eca3ac155247e21850c7d075d01ebf0f3f5dbf19ccd2a1.jpg',
              placeholder: (context, url) => SpinKitCircle(color: AppColors.white, size: 30,),
              errorWidget: (context, url, error) => Icon(Icons.error),
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BaseTextLabel(
                  'Spider-man',
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: AppColors.white,
                  maxLines: 1,
                ),
                const SizedBox(height: 15),
                CustomWidget.infoItem(MovieIconType.star, '4.5'),
                const SizedBox(height: 5),
                CustomWidget.infoItem(MovieIconType.ticket, 'Action'),
                const SizedBox(height: 5),
                CustomWidget.infoItem(MovieIconType.calendar, '2019'),
                const SizedBox(height: 5),
                CustomWidget.infoItem(MovieIconType.clock, '139 minutes'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
