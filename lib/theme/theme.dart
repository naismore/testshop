import 'package:flutter/material.dart';

final theme = ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
  textTheme: TextTheme(
    bodyMedium: TextStyle(
      color: Colors.grey[800],
      fontWeight: FontWeight.w500,
      fontSize: 20,
    ),
    labelSmall: TextStyle(
      color: Colors.grey[900],
      fontWeight: FontWeight.w700,
      fontSize: 15,
    ),
  ),
);
