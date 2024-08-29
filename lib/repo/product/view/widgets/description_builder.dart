import 'package:flutter/material.dart';

Widget productDescriptionBuilder(BuildContext context, String description) {
  return Text(
    (description == '') ? 'Нет описания' : description,
    style: const TextStyle(
      fontSize: 18,
    ),
  );
}
