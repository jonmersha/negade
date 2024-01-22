import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:negade/constants/common_functions.dart';
import 'package:negade/constants/constants.dart';
import 'package:negade/utils/colors.dart';
import 'package:negade/view/user/home/widgets/slider.dart';

SizedBox todayDeals(double width, double height, TextTheme textTheme,dealController) {
  return SizedBox(
    width: width,
    child: Padding(
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.03, vertical: height * 0.01),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '50%-80% off | Latest deal',
            style: textTheme.displaySmall!.copyWith(
                fontWeight: FontWeight.w600, color: black),
          ),
          homeScreenBannerDeal(height, width * 0.9, dealsOfTheDay,
              'assets/images/todays_deals/',dealController),
          blankSpace(height: height * 0.01),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(4),
                alignment: Alignment.centerLeft,
                height: height * 0.04,
                //width: width*0.5,
                decoration: BoxDecoration(
                    color: red,
                    borderRadius: BorderRadius.circular(5)),
                child: Text(
                  'Deals of 62% off',
                  style:
                  textTheme.labelMedium!.copyWith(color: white),
                ),
              ),
              blankSpace(width: width * 0.03),
              Text(
                'Deal of the day!',
                style: textTheme.labelMedium!.copyWith(
                    color: red, fontWeight: FontWeight.bold),
              )
            ],
          ),
          blankSpace(width: width * 0.03),
          GridView.builder(
            itemCount: 4,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: (){
                  log(index.toString());
                  dealController.jumpToPage(index);
                },
                child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border:Border.all(color: greyShade3),
                      image: DecorationImage(
                          image: AssetImage(
                              'assets/images/todays_deals/${dealsOfTheDay[index]}'),
                          fit: BoxFit.cover)),
                ),
              );
            },
          ),
          TextButton(
              onPressed: () {},
              child: Text(
                'See all deals',
                style: textTheme.bodySmall!.copyWith(color: teal),
              ))
        ],
      ),
    ),
  );
}
