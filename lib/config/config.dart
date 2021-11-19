import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

const Color primaryColor = Color(0xFFAA3E89);
const String articlesUrl = 'https://60a4954bfbd48100179dc49d.mockapi.io/api/innocent/newsapp/articles';

DateFormat globalDateFormat = DateFormat('EEEE, dd MMM yyyy');

const TextStyle headlineText = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 24,
    letterSpacing: 0.27,
    color: Colors.black,
);

const TextStyle titlePrimary = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 17,
    letterSpacing: 0.27,
    color: primaryColor,
);

const TextStyle dateText = TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: 17,
    letterSpacing: 0.27,
    color: Colors.black54,
);

const TextStyle bodyText = TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: 15,
    letterSpacing: 0.27,
    color: Colors.black,
);