import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_training/gen_l10n/app_localizations.dart';
import 'package:flutter_training/network/api_constant.dart';
import 'package:flutter_training/res/colors.dart';
import 'package:flutter_training/ui/screen/movie/model/movie_model.dart';
import 'package:flutter_training/ui/widget/base_text_label.dart';
import 'package:flutter_training/ui/widget/custom/custom_widget.dart';
import 'package:flutter_training/util/constant.dart';

class MovieInfoCard extends StatelessWidget {
  final MovieModel? movie;
  final GestureTapCallback? onTap;

  const MovieInfoCard({super.key, this.movie, this.onTap});

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
              imageUrl: '${ApiConstant.movieImageUrl}${movie?.posterPath}',
              placeholder: (context, url) =>
                  SpinKitCircle(color: AppColors.white, size: 30),
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
                  movie?.title,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: AppColors.white,
                  maxLines: 1,
                ),
                const SizedBox(height: 15),
                CustomWidget.infoItem(
                  MovieIconType.star,
                  movie?.voteAverage?.toStringAsFixed(1) ?? 'N/A',
                ),
                const SizedBox(height: 5),
                CustomWidget.infoItem(
                  MovieIconType.ticket,
                  (movie?.genres?.isNotEmpty == true)
                      ? movie!.genres!.first.name ?? 'N/A'
                      : 'N/A'
                ),
                const SizedBox(height: 5),
                CustomWidget.infoItem(
                  MovieIconType.calendar,
                  movie?.releaseDate?.substring(0, 4) ?? 'N/A',
                ),
                const SizedBox(height: 5),
                CustomWidget.infoItem(
                  MovieIconType.clock,
                  AppLocalizations.of(context)!.count_minutes(movie?.runtime ?? 'N/A')
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
