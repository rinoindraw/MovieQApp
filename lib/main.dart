import 'package:flutter/material.dart';
import 'package:weeklysubmission5_praktikum_mcs/app/themovies.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  setPathUrlStrategy();

  runApp(const TheMoviesApp());
}