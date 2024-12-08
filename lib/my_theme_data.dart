import 'package:flutter/material.dart';
import 'package:islami_sun3_c13/app_colors.dart';

class MyThemeData {
  static final ThemeData darkTheme = ThemeData(
      scaffoldBackgroundColor: AppColors.transparentColor,
      primaryColor: AppColors.primaryDark,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        // backgroundColor: AppColors.primaryDark,
        //   type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.whiteColor,
        unselectedItemColor: AppColors.blackColor,
        showSelectedLabels: true,
      ));
}
