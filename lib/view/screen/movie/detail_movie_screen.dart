import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_training/util/enums.dart';
import 'package:flutter_training/view/widget/base_screen.dart';
import 'package:flutter_training/view/widget/base_text_label.dart';
import 'package:flutter_training/view/widget/custom/custom_widget.dart';

import '../../../res/colors.dart';

class DetailMovieScreen extends StatefulWidget {
  const DetailMovieScreen({super.key});

  @override
  State<DetailMovieScreen> createState() => _DetailMovieScreenState();
}

class _DetailMovieScreenState extends State<DetailMovieScreen> {
  bool isMark = false;

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      colorAppBar: Colors.transparent,
      iconBackColor: AppColors.white,
      colorBackground: AppColors.movieBackground,
      isLightStatusBar: true,
      title: 'Details',
      colorTitle: AppColors.white,
      rightWidgets: [
        IconButton(
          onPressed: () {
            setState(() {
              isMark = !isMark;
            });
          },
          icon: Icon(
            isMark ? Icons.bookmark : Icons.bookmark_border,
            color: AppColors.white,
          ),
        ),
      ],
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                  child: CachedNetworkImage(
                    imageUrl:
                        'https://bloganchoi.com/wp-content/uploads/2021/12/anh-dai-dien-tu-thiet-ke-spiderman.jpg',
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    placeholder: (context, url) =>
                        SpinKitCircle(color: AppColors.white, size: 30),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
                Positioned(
                  bottom: -75,
                  left: 20,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: CachedNetworkImage(
                      height: 150,
                      width: 120,
                      imageUrl:
                          'https://image.api.playstation.com/vulcan/ap/rnd/202306/1219/60eca3ac155247e21850c7d075d01ebf0f3f5dbf19ccd2a1.jpg',
                      placeholder: (context, url) =>
                          SpinKitCircle(color: AppColors.white, size: 30),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  right: 10,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 7,
                          horizontal: 10,
                        ),
                        child: CustomWidget.infoItem(MovieIconType.star, '4.5'),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(155, 15, 20, 0),
              child: BaseTextLabel(
                'Spider-man No Way Home',
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: AppColors.white,
                maxLines: 2,
                textAlign: TextAlign.start,
              ),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomWidget.infoItem(MovieIconType.ticket, 'Action'),
                Container(
                  width: 2,
                  height: 18,
                  color: Colors.grey,
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                ),
                CustomWidget.infoItem(MovieIconType.calendar, '2019'),
                Container(
                  width: 2,
                  height: 18,
                  color: Colors.grey,
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                ),
                CustomWidget.infoItem(MovieIconType.clock, '139 minutes'),
              ],
            ),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: BaseTextLabel(
                'From DC Comics comes the Suicide Squad, an antihero team of incarcerated supervillains who act as deniable assets for the United States government, undertaking high-risk black ops missions in exchange for commuted prison sentences.',
                color: AppColors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
