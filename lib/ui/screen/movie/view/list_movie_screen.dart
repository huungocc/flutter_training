import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_training/gen_l10n/app_localizations.dart';
import 'package:flutter_training/res/colors.dart';
import 'package:flutter_training/ui/screen/movie/service/movie_service.dart';
import 'package:flutter_training/ui/screen/movie/cubit/movie_cubit.dart';
import 'package:flutter_training/ui/screen/movie/cubit/movie_state.dart';
import 'package:flutter_training/ui/widget/base_screen.dart';
import 'package:flutter_training/ui/widget/base_text_label.dart';
import 'package:flutter_training/ui/widget/custom/movie_info_card.dart';
import 'package:flutter_training/util/routes.dart';

class ListMovieScreen extends StatelessWidget {
  const ListMovieScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MovieCubit(MovieService()),
      child: _ListMovieBody(),
    );
  }
}

class _ListMovieBody extends StatefulWidget {
  const _ListMovieBody();

  @override
  State<_ListMovieBody> createState() => _ListMovieBodyState();
}

class _ListMovieBodyState extends State<_ListMovieBody> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    context.read<MovieCubit>().fetchPopularMoviesStream(refresh: true);
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent) {
      context.read<MovieCubit>().loadMoreMovies();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      colorAppBar: Colors.transparent,
      iconBackColor: AppColors.white,
      colorBackground: AppColors.movieBackground,
      isLightStatusBar: true,
      title: AppLocalizations.of(context)!.movies,
      colorTitle: AppColors.white,
      body: RefreshIndicator(
        backgroundColor: AppColors.white,
        color: AppColors.black,
        onRefresh: () async {
          context.read<MovieCubit>().fetchPopularMoviesStream(refresh: true);
        },
        child: BlocBuilder<MovieCubit, MovieState>(
          builder: (context, state) {
            if (state is MovieLoading) {
              return Center(
                child: SpinKitCircle(size: 50, color: AppColors.white),
              );
            }

            if (state is MovieStreaming) {
              final movies = state.movies;
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: ListView.separated(
                  controller: _scrollController,
                  itemCount: movies.length + (state.isLoadingMore || !state.isComplete ? 1 : 0),
                  separatorBuilder: (context, index) => const SizedBox(height: 20),
                  itemBuilder: (context, index) {
                    if (index == movies.length) {
                      return Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          spacing: 10,
                          children: [
                            SpinKitCircle(size: 25, color: AppColors.white),
                            BaseTextLabel(
                              AppLocalizations.of(context)!.loading_movies,
                              color: AppColors.white,
                            )
                          ],
                        ),
                      );
                    }

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
            }

            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}