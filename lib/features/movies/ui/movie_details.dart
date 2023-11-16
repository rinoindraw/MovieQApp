import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weeklysubmission5_praktikum_mcs/app/api/api.dart';
import 'package:weeklysubmission5_praktikum_mcs/app/theme/colors.dart';
import 'package:weeklysubmission5_praktikum_mcs/app/theme/styles.dart';
import 'package:weeklysubmission5_praktikum_mcs/app/widgets/error_page.dart';
import 'package:weeklysubmission5_praktikum_mcs/features/movies/bloc/movies_bloc.dart';
import 'package:weeklysubmission5_praktikum_mcs/features/movies/model/movies_model.dart';

class MovieDetailsPage extends StatefulWidget {
  static const String routeName = "/movies";
  const MovieDetailsPage({super.key, required this.movieModel});

  final MoviesModel movieModel;

  @override
  State<MovieDetailsPage> createState() => _MovieDetailsPageState();
}

class _MovieDetailsPageState extends State<MovieDetailsPage> {
  final MoviesBloc moviesBloc = MoviesBloc();

  @override
  void initState() {
    if (widget.movieModel.id > 0) {
      moviesBloc
          .add(MovieDetailsInitialFetchEvent(movieId: widget.movieModel.id));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.movieModel.id <= 0) {
      return const ErrorPage(
        title: "Movie Details not found...",
        error: "No movie found in the response.",
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "MovieQ",
          style: appBarSubTitleStyle,
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_outlined,
            color: textColorDark,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      extendBodyBehindAppBar: true,
      body: BlocConsumer<MoviesBloc, MoviesState>(
        bloc: moviesBloc,
        listener: (context, state) {},
        builder: (context, state) {
          switch (state.runtimeType) {
            case MovieDetailsFetchingLoadingState:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case MovieDetailsFetchingSuccessfulState:
              final successState = state as MovieDetailsFetchingSuccessfulState;
              double width = MediaQuery.of(context).size.width;
              double buttonSize = width * 0.5;
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      CachedNetworkImage(
                        imageUrl: urlTMdbImagesBig +
                            successState.movieDetails.backdropPath,
                        imageBuilder: (context, imageProvider) => Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Container(
                            width: double.infinity,
                            height: 420,// agar memenuhi lebar layar
                            child: CachedNetworkImage(
                              fit: BoxFit.fitWidth,  // atau sesuaikan dengan kebutuhan desain
                              imageUrl: urlTMdbImagesBig +
                                  successState.movieImageList.logos[0].filePath,
                              progressIndicatorBuilder: (context, url, downloadProgress) => Center(
                                child: SizedBox(
                                  height: 42,
                                  width: 42,
                                  child: CircularProgressIndicator(
                                    value: downloadProgress.progress,
                                  ),
                                ),
                              ),
                              errorWidget: (context, url, error) => const Icon(Icons.error),
                            ),
                          ),
                        ),
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) => AspectRatio(
                          aspectRatio: 1,
                          child: Center(
                            child: SizedBox(
                              height: 42,
                              width: 42,
                              child: CircularProgressIndicator(
                                value: downloadProgress.progress,
                              ),
                            ),
                          ),
                        ),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                      Positioned(
                        bottom: 0.0,
                        left: 0.0,
                        right: 0.0,
                        child: Container(
                          padding: const EdgeInsets.all(8.0),
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              stops: [0, 0.3, 0.9],
                              colors: [
                                Colors.transparent,
                                Colors.black54,
                                Colors.black,
                              ],
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(
                                height: 8.0,
                              ),
                              if (successState.movieImageList.logos.isEmpty)
                                Text(
                                  widget.movieModel.title,
                                  style: movieNameStyle,
                                ),
                              if (successState.movieImageList.logos.isNotEmpty)
                                SizedBox(
                                  width: buttonSize,
                                  child: AspectRatio(
                                    aspectRatio: successState
                                        .movieImageList.logos[0].aspectRatio,
                                    child: CachedNetworkImage(
                                      height: 400,
                                      fit: BoxFit.cover,
                                      imageUrl: urlTMdbImagesBig +
                                          successState
                                              .movieImageList.logos[0].filePath,
                                      progressIndicatorBuilder:
                                          (context, url, downloadProgress) =>
                                              Center(
                                        child: Text(
                                          widget.movieModel.title,
                                          style: movieNameStyle,
                                        ),
                                      ),
                                      errorWidget: (context, url, error) =>
                                          const Icon(Icons.error),
                                    ),
                                  ),
                                ),
                              const SizedBox(
                                height: 8.0,
                              ),
                              Text(
                                "In Theaters ${widget.movieModel.releaseDateFormatted}",
                                style: appBarSubTitleStyle,
                              ),
                              const SizedBox(
                                height: 8.0,
                              ),
                              const SizedBox(
                                height: 8.0,
                              ),
                              const SizedBox(
                                height: 16.0,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: ListView(
                      padding: const EdgeInsets.all(16.0),
                      children: [
                        const Text(
                          "Genres",
                          style: appBarTitleStyle,
                        ),
                        Wrap(
                          direction: Axis.horizontal,
                          alignment: WrapAlignment.start,
                          spacing: 8.0,
                          children: state.movieDetails.genres
                              .map(
                                (genre) => Chip(
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(20),
                                    ),
                                  ),
                                  label: Text(genre.name, style: chipTextStyle),
                                  backgroundColor: getTileColor(
                                      state.movieDetails.genres.indexOf(genre)),
                                  side: BorderSide.none,
                                  elevation: 0.0,
                                ),
                              )
                              .toList(),
                        ),
                        const Divider(
                          height: 32.0,
                          thickness: 1,
                          color: colorDivider,
                        ),
                        const Text(
                          "Overview",
                          style: appBarTitleStyle,
                        ),
                        Text(
                          successState.movieDetails.overview,
                          style: overviewTextStyle,
                          textAlign: TextAlign.justify,
                        ),
                      ],
                    ),
                  ),
                ],
              );
            default:
              return const SizedBox();
          }
        },
      ),
    );
  }

  getTileColor(int index) {
    return [
      colorTileGreen,
      colorTileMagenta,
      colorTilePurple,
      colorSecondary,
      colorTileYellow
    ][index % 5];
  }
}
