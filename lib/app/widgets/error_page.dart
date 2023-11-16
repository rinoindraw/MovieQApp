import 'package:flutter/material.dart';
import 'package:weeklysubmission5_praktikum_mcs/app/theme/colors.dart';
import 'package:weeklysubmission5_praktikum_mcs/app/theme/styles.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key, required this.title, required this.error});

  final String title;
  final String error;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.error_outline_outlined,
              size: 72,
              color: colorTileGreen,
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(title, style: errorTitleTextStyle),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(error, style: errorDetailsTextStyle),
              ],
            ),
            const SizedBox(height: 16),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          ],
        ),
      ),
    );
  }
}
