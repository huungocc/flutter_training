import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_training/gen_l10n/app_localizations.dart';
import 'package:flutter_training/network/api_constant.dart';
import 'package:flutter_training/res/colors.dart';
import 'package:flutter_training/ui/screen/movie/service/movie_service.dart';
import 'package:flutter_training/ui/screen/movie/cubit/movie_state.dart';
import 'package:flutter_training/ui/screen/movie/cubit/simple_movie_cubit.dart';
import 'package:flutter_training/ui/widget/base_screen.dart';
import 'package:flutter_training/ui/widget/base_text_label.dart';
import 'package:flutter_training/ui/widget/custom/custom_widget.dart';
import 'package:flutter_training/util/constant.dart';

class SimpleDetailMovieScreen extends StatelessWidget {
  final int? arg;

  const SimpleDetailMovieScreen({super.key, this.arg});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SimpleMovieCubit(MovieService()),
      child: _SimpleDetailMovieBody(arg: arg,),
    );
  }
}

class _SimpleDetailMovieBody extends StatefulWidget {
  final int? arg;

  const _SimpleDetailMovieBody({this.arg});

  @override
  State<_SimpleDetailMovieBody> createState() => _SimpleDetailMovieBodyState();
}

class _SimpleDetailMovieBodyState extends State<_SimpleDetailMovieBody> {
  bool isMark = false;

  @override
  void initState() {
    super.initState();
    if (widget.arg != null && widget.arg is int) {
      context.read<SimpleMovieCubit>().loadSingleMovie(widget.arg!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      colorAppBar: Colors.transparent,
      iconBackColor: AppColors.white,
      colorBackground: AppColors.movieBackground,
      isLightStatusBar: true,
      title: AppLocalizations.of(context)!.details,
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
      body: BlocBuilder<SimpleMovieCubit, MovieState>(
        builder: (context, state) {
          if (state is MovieLoading) {
            return Center(
              child: SpinKitCircle(size: 50, color: AppColors.white),
            );
          }
          if (state is SingleMovieLoaded) {
            final movie = state.movie;
            return SingleChildScrollView(
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
                          imageUrl: '${ApiConstant.movieImageUrl}${movie.backdropPath}',
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
                            imageUrl: '${ApiConstant.movieImageUrl}${movie.posterPath}',
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
                                movie.voteAverage?.toStringAsFixed(1) ?? 'N/A',
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
                      movie.title,
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
                        movie.releaseDate?.substring(0, 4) ?? 'N/A',
                      ),
                      Container(
                        width: 2,
                        height: 18,
                        color: Colors.grey,
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                      ),
                      CustomWidget.infoItem(
                          MovieIconType.clock,
                          AppLocalizations.of(context)!.count_minutes(movie.runtime ?? 'N/A')
                      ),
                      Container(
                        width: 2,
                        height: 18,
                        color: Colors.grey,
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                      ),
                          CustomWidget.infoItem(
                          MovieIconType.ticket,
                          (movie.genres?.isNotEmpty == true)
                              ? movie.genres!.first.name ?? 'N/A'
                              : 'N/A'
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: BaseTextLabel(
                      movie.overview,
                      color: AppColors.white,
                    ),
                  ),
                ],
              ),
            );
          }

          return SizedBox.shrink();
        },
      )
    );
  }
}


