import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_training/util/enums.dart';
import 'package:flutter_training/view/widget/base_screen.dart';
import 'package:flutter_training/view/widget/base_text_label.dart';
import 'package:flutter_training/view/widget/custom/custom_widget.dart';

import '../../../model/movie_model.dart';
import '../../../network/api_constant.dart';
import '../../../res/colors.dart';

class DetailMovieScreen extends StatelessWidget {
  final MovieModel? arg;

  const DetailMovieScreen({super.key, this.arg});

  @override
  Widget build(BuildContext context) {
    bool isMark = false;
    return BaseScreen(
      colorAppBar: Colors.transparent,
      iconBackColor: AppColors.white,
      colorBackground: AppColors.movieBackground,
      isLightStatusBar: true,
      title: 'Details',
      colorTitle: AppColors.white,
      rightWidgets: [
        StatefulBuilder(
          builder: (context, setState) {
            return IconButton(
              onPressed: () {
                setState(() {
                  isMark = !isMark;
                });
              },
              icon: Icon(
                isMark ? Icons.bookmark : Icons.bookmark_border,
                color: AppColors.white,
              ),
            );
          },
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
                    imageUrl: '${ApiConstant.movieImageUrl}${arg?.backdropPath}',
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => SpinKitCircle(color: AppColors.white, size: 30),
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
                      imageUrl: '${ApiConstant.movieImageUrl}${arg?.posterPath}',
                      placeholder: (context, url) => SpinKitCircle(color: AppColors.white, size: 30),
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
                      filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 10),
                        child: CustomWidget.infoItem(
                          MovieIconType.star,
                          arg?.voteAverage?.toStringAsFixed(1) ?? 'N/A',
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(155, 15, 20, 0),
              child: BaseTextLabel(
                arg?.title,
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: AppColors.white,
                maxLines: 2,
                textAlign: TextAlign.start,
              ),
            ),
            const SizedBox(height: 60),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomWidget.infoItem(
                  MovieIconType.calendar,
                  arg?.releaseDate?.substring(0, 4) ?? 'N/A',
                ),
                Container(
                  width: 2,
                  height: 18,
                  color: Colors.grey,
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                ),
                CustomWidget.infoItem(
                  MovieIconType.clock,
                  '${arg?.runtime ?? 'N/A'} minutes',
                ),
                Container(
                  width: 2,
                  height: 18,
                  color: Colors.grey,
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                ),
                CustomWidget.infoItem(
                  MovieIconType.ticket,
                  arg?.genres?.first.name ?? 'N/A',
                ),
              ],
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: BaseTextLabel(
                arg?.overview,
                color: AppColors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

