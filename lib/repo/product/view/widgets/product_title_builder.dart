import 'package:flutter/material.dart';

Widget productTitleBuilder(BuildContext context, String title) {
  return Text(
    title,
    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
  );
}
