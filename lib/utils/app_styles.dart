import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_sun3_c13/utils/app_colors.dart';

class AppStyles {
  static TextStyle bold16White = GoogleFonts.elMessiri(
      color: AppColors.whiteColor,
      fontSize: 16,
      fontWeight: FontWeight.bold
  );
  static TextStyle bold20White = GoogleFonts.elMessiri(
      color: AppColors.whiteColor,
      fontSize: 20,
      fontWeight: FontWeight.bold
  );
  static TextStyle bold24Black = GoogleFonts.elMessiri(
      color: AppColors.blackColor,
      fontSize: 24,
      fontWeight: FontWeight.bold
  );
  static TextStyle bold20Primary = GoogleFonts.elMessiri(
      color: AppColors.primaryDark,
      fontSize: 20,
      fontWeight: FontWeight.bold
  );
  static TextStyle bold24Primary = GoogleFonts.elMessiri(
      color: AppColors.primaryDark,
      fontSize: 24,
      fontWeight: FontWeight.bold
  );
  static TextStyle bold18Black = GoogleFonts.elMessiri(
      color: AppColors.blackColor,
      fontSize: 18,
      fontWeight: FontWeight.bold
  );
}