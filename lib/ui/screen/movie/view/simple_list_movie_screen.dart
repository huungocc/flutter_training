import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_training/gen_l10n/app_localizations.dart';
import 'package:flutter_training/res/colors.dart';
import 'package:flutter_training/ui/screen/movie/service/movie_service.dart';
import 'package:flutter_training/ui/screen/movie/cubit/movie_state.dart';
import 'package:flutter_training/ui/screen/movie/cubit/simple_movie_cubit.dart';
import 'package:flutter_training/ui/widget/base_screen.dart';
import 'package:flutter_training/ui/widget/base_text_label.dart';
import 'package:flutter_training/ui/widget/custom/movie_info_card.dart';
import 'package:flutter_training/util/routes.dart';

class SimpleListMovieScreen extends StatelessWidget {
  const SimpleListMovieScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SimpleMovieCubit(MovieService()),
      child: _SimpleListMovieBody(),
    );
  }
}

class _SimpleListMovieBody extends StatefulWidget {
  const _SimpleListMovieBody();

  @override
  State<_SimpleListMovieBody> createState() => _SimpleListMovieBodyState();
}

class _SimpleListMovieBodyState extends State<_SimpleListMovieBody> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    context.read<SimpleMovieCubit>().fetchPopularMovies(refresh: true);
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
      context.read<SimpleMovieCubit>().loadMoreMovies();
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
          context.read<SimpleMovieCubit>().fetchPopularMovies(refresh: true);
        },
        child: BlocBuilder<SimpleMovieCubit, MovieState>(
          builder: (context, state) {
            if (state is MovieLoading) {
              return Center(
                child: SpinKitCircle(size: 50, color: AppColors.white),
              );
            }

            if (state is MovieLoaded) {
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
                          children: [
                            SpinKitCircle(size: 25, color: AppColors.white),
                            const SizedBox(width: 10),
                            BaseTextLabel(
                              AppLocalizations.of(context)!.loading_movies,
                              color: AppColors.white,
                            ),
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
                          Routes.simpleDetailMovieScreen,
                          arguments: movie.id,
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