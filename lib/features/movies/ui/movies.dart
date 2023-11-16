import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weeklysubmission5_praktikum_mcs/app/api/api.dart';
import 'package:weeklysubmission5_praktikum_mcs/app/theme/colors.dart';
import 'package:weeklysubmission5_praktikum_mcs/app/theme/styles.dart';
import 'package:weeklysubmission5_praktikum_mcs/app/widgets/fade_animation.dart';
import 'package:weeklysubmission5_praktikum_mcs/features/movies/bloc/movies_bloc.dart';
import 'package:weeklysubmission5_praktikum_mcs/features/movies/ui/movie_details.dart';

class MoviesPage extends StatefulWidget {
  static const String routeName = "/";
  const MoviesPage({super.key});

  @override
  State<MoviesPage> createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
  final MoviesBloc moviesBloc = MoviesBloc();

  @override
  void initState() {
    moviesBloc.add(MoviesInitialFetchEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("MovieQ", style: appbarTextStyle,),
        centerTitle: true,
      ),
      extendBody: true,
      body: BlocConsumer<MoviesBloc, MoviesState>(
        bloc: moviesBloc,
        listener: (context, state) {},
        builder: (context, state) {
          switch (state.runtimeType) {
            case MoviesFetchingLoadingState:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case MoviesFetchingSuccessfulState:
              final successState = state as MoviesFetchingSuccessfulState;

              return ListView.builder(
                itemCount: successState.movies.length,
                itemBuilder: (context, index) {
                  return FadeAnimation(
                    delay: (index + 1) * 10,
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          MovieDetailsPage.routeName,
                          arguments: successState.movies[index],
                        );
                      },
                      child: AspectRatio(
                        aspectRatio: 16 / 9,
                        child: Container(
                          padding: const EdgeInsets.all(0),
                          margin: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          decoration: const BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                            color: colorAppBackground,
                            shape: BoxShape.rectangle,
                          ),
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(8.0)),
                                child: CachedNetworkImage(
                                  fit: BoxFit.cover,
                                  imageUrl: urlTMdbImagesBig +
                                      successState.movies[index].backdropPath,
                                  progressIndicatorBuilder:
                                      (context, url, downloadProgress) =>
                                          Center(
                                    child: SizedBox(
                                      height: 42,
                                      width: 42,
                                      child: CircularProgressIndicator(
                                        value: downloadProgress.progress,
                                      ),
                                    ),
                                  ),
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.error),
                                ),
                              ),
                              Positioned(
                                bottom: 0.0,
                                left: 0.0,
                                right: 0.0,
                                child: Container(
                                  padding: const EdgeInsets.all(8.0),
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.vertical(
                                        bottom: Radius.circular(8.0)),
                                    gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Colors.transparent,
                                        Colors.black87,
                                      ],
                                    ),
                                  ),
                                  child: Text(
                                    successState.movies[index].title,
                                    style: upcomingMovieNameStyle,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            default:
              return const SizedBox();
          }
        },
      ),
    );
  }
}
