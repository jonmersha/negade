import 'package:flutter/material.dart';
import 'package:negade/utils/colors.dart';

SizedBox blankSpace({double width = 10, double height = 0}) {
  return SizedBox(
    width: width,
    height: height,
  );
}

Container hDivider(double width) {
  return Container(
    width: width * 0.99,
    height: 2,
    decoration:
        BoxDecoration(gradient: LinearGradient(colors: [white, grey, white])),
  );
}
