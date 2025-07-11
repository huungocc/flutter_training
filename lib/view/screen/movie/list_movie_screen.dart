import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_training/service/movie_service.dart';
import 'package:flutter_training/view/widget/base_text_label.dart';
import 'package:flutter_training/view_model/movie/movie_state.dart';

import '../../../res/colors.dart';
import '../../../util/routes.dart';
import '../../../view_model/movie/movie_cubit.dart';
import '../../widget/base_screen.dart';
import '../../widget/custom/movie_info_card.dart';

class ListMovieScreen extends StatelessWidget {
  const ListMovieScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MovieCubit(MovieService()),
      child: ListMovieBody(),
    );
  }
}


class ListMovieBody extends StatefulWidget {
  const ListMovieBody({super.key});

  @override
  State<ListMovieBody> createState() => _ListMovieBodyState();
}

class _ListMovieBodyState extends State<ListMovieBody> {
  @override
  void initState() {
    super.initState();
    context.read<MovieCubit>().fetchPopularMovies();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      colorAppBar: Colors.transparent,
      iconBackColor: AppColors.white,
      colorBackground: AppColors.movieBackground,
      isLightStatusBar: true,
      title: 'Movies',
      colorTitle: AppColors.white,
      body: BlocBuilder<MovieCubit, MovieState>(
        builder: (context, state) {
          if (state is MovieLoading) {
            return Center(
              child: SpinKitCircle(size: 50, color: AppColors.white,),
            );
          } else if (state is MovieLoaded) {
            final movies = state.movies;
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: ListView.separated(
                itemCount: movies.length,
                separatorBuilder: (context, index) => const SizedBox(height: 20),
                itemBuilder: (context, index) {
                  final movie = movies[index];

                  return MovieInfoCard(
                    movie: movie,
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        Routes.detailMovieScreen,
                        arguments: movie,
                      );
                    },
                  );
                },
              ),
            );
          } else if (state is MovieError) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 10,
              children: [
                Icon(Icons.error, color: AppColors.white, size: 30,),
                BaseTextLabel(state.message, color: AppColors.white, fontStyle: FontStyle.italic,),
              ],
            );
          }
          return SizedBox.shrink();
        },
      ),
    );
  }
}
