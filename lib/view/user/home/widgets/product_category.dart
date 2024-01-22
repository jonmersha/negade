import 'package:flutter/material.dart';
import 'package:negade/constants/constants.dart';

SizedBox productCategory(double height, double width, TextTheme textTheme) {
  return SizedBox(
    height: height * 0.09,
    width: width,
    child: ListView.builder(
      itemCount: categories.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Container(
          height: height*0.01,
          margin: EdgeInsets.symmetric(horizontal: width*0.01),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image(
                image: AssetImage(
                    'assets/images/categories/${categories[index]}.png'),
                height: height * 0.07,
              ),
              Text(categories[index],style: textTheme.labelLarge,)
            ],
          ),
        );
      },
    ),
  );
}
