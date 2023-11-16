import 'package:flutter/material.dart';
import 'package:weeklysubmission5_praktikum_mcs/app/theme/theme.dart';
import 'package:weeklysubmission5_praktikum_mcs/features/movies/model/movies_model.dart';
import 'package:weeklysubmission5_praktikum_mcs/features/movies/ui/movie_details.dart';
import 'package:weeklysubmission5_praktikum_mcs/features/movies/ui/movies.dart';

class TheMoviesApp extends StatelessWidget {
  const TheMoviesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MovieQ',
      theme: ThemeClass.lightTheme(context),
      initialRoute: MoviesPage.routeName,
      routes: {
        MoviesPage.routeName: (context) => const MoviesPage(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == MovieDetailsPage.routeName) {
          return MaterialPageRoute(
            builder: (context) {
              return MovieDetailsPage(
                  movieModel: settings.arguments as MoviesModel);
            },
          );
        }
        assert(false, 'Implementation not found for ${settings.name}');
        return null;
      },
    );
  }
}
