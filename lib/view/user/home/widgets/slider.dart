import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

CarouselSlider homeScreenBanner(double height, double width,List plist,path) {
  return CarouselSlider(
    options: CarouselOptions(height: height*0.23,autoPlay: true,viewportFraction: 1),
    items: plist.map((i) {
      return Builder(
        builder: (BuildContext context) {
          return Container(
            width: width,
            //margin: EdgeInsets.symmetric(horizontal: 5.0),
            decoration: BoxDecoration(
               // color: teal,
                borderRadius: BorderRadius.circular(0),
                image: DecorationImage(image: AssetImage(
                    '$path$i'),fit: BoxFit.cover)
            ),
          );
        },
      );
    }).toList(),
  );
}
CarouselSlider homeScreenBannerDeal(double height, double width,List plist,path, CarouselController controller) {
  return CarouselSlider(
    carouselController: controller,
    options: CarouselOptions(height: height*0.23,autoPlay: false,viewportFraction: 1),
    items: plist.map((i) {
      return Builder(
        builder: (BuildContext context) {
          return Container(
            width: width,
            //margin: EdgeInsets.symmetric(horizontal: 5.0),
            decoration: BoxDecoration(
               // color: teal,
                borderRadius: BorderRadius.circular(0),
                image: DecorationImage(image: AssetImage(
                    '$path$i'),fit: BoxFit.fitHeight)
            ),
          );
        },
      );
    }).toList(),
  );
}
