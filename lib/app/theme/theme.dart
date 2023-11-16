import 'package:flutter/material.dart';
import 'package:weeklysubmission5_praktikum_mcs/app/theme/colors.dart';
import 'package:weeklysubmission5_praktikum_mcs/app/theme/styles.dart';

class ThemeClass {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
        primaryColor: textColor,
        appBarTheme: const AppBarTheme(
          color: colorAppbar,
          foregroundColor: colorAppbar,
          titleTextStyle: appBarTitleStyle,
          iconTheme: IconThemeData(
            color: textColor,
            size: 32,
          ),
        ),
        scaffoldBackgroundColor: colorAppBackground, //page content area
        textTheme: Theme.of(context).textTheme.apply(
              fontFamily: 'Poppins',
              bodyColor: textColor,
            ),
        useMaterial3: true,

        canvasColor: colorAppBackground, //reset of the area / drawer

        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedItemColor: colorAppBackground,
          unselectedItemColor: colorTextAppbar,
          backgroundColor: colorNavBar,
          selectedLabelStyle: navBarTextStyle,
          unselectedLabelStyle: navBarTextStyle,
        ),
      );
}
