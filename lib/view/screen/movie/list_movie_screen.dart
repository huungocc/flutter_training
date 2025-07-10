import 'package:flutter/material.dart';

import '../../../res/colors.dart';
import '../../../util/routes.dart';
import '../../widget/base_screen.dart';
import '../../widget/custom/movie_info_card.dart';

class ListMovieScreen extends StatefulWidget {
  const ListMovieScreen({super.key});

  @override
  State<ListMovieScreen> createState() => _ListMovieScreenState();
}

class _ListMovieScreenState extends State<ListMovieScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      colorAppBar: Colors.transparent,
      iconBackColor: AppColors.white,
      colorBackground: AppColors.movieBackground,
      isLightStatusBar: true,
      title: 'Movies',
      colorTitle: AppColors.white,
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            MovieInfoCard(
              onTap: () {
                Navigator.pushNamed(context, Routes.detailMovieScreen);
              }
            )
          ],
        ),
      ),
    );
  }
}
