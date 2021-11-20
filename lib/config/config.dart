import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

const Color primaryColor = Color(0xFFAA3E89);
const String articlesUrl =
    'https://60a4954bfbd48100179dc49d.mockapi.io/api/innocent/newsapp/articles';

DateFormat globalDateFormat = DateFormat('EEEE, dd MMM yyyy');

class AppTheme {
  static String fontName = 'Poppins';
  static String fontNameMedium = 'Poppins-Medium';
  static String fontNameReguler = 'Poppins-Regular';
  static String fontNameBold = 'Poppins-Bold';

  static TextStyle headlineText = TextStyle(
    fontFamily: fontNameBold,
    fontWeight: FontWeight.bold,
    fontSize: 24,
    letterSpacing: 0.27,
    color: Colors.black,
  );

  static TextStyle titlePrimary = TextStyle(
    fontFamily: fontNameMedium,
    fontWeight: FontWeight.bold,
    fontSize: 17,
    letterSpacing: 0.27,
    color: primaryColor,
  );

  static TextStyle dateText = TextStyle(
    fontFamily: fontNameReguler,
    fontWeight: FontWeight.normal,
    fontSize: 17,
    letterSpacing: 0.27,
    color: Colors.black54,
  );

  static TextStyle bodyText = TextStyle(
    fontFamily: fontNameReguler,
    fontWeight: FontWeight.normal,
    fontSize: 15,
    letterSpacing: 0.27,
    color: Colors.black,
  );
}
