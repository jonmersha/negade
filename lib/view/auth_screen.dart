import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:negade/constants/common_functions.dart';
import 'package:negade/constants/decorations.dart';
import 'package:negade/utils/colors.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool inlogin = false;
  String currentCountry = '+251';
  TextEditingController mobileController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final heght = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: white,
          title: Image.asset(
            "assets/images/logos.png",
            height: heght * 0.04,
          )),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            height: heght,
            width: width,
            padding: EdgeInsets.symmetric(
                horizontal: width * 0.03, vertical: heght * 0.02),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Welcome",
                      style: textTheme.displaySmall!
                          .copyWith(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'lang',
                      style: textTheme.labelMedium,
                    )
                  ],
                ),
                blankSpace(height: heght * 0.02, width: 0),
                Container(
                  width: width,
                  decoration: containerDecoration(),
                  child: Column(children: [
                    Container(
                      height: heght * 0.06,
                      width: width,
                      decoration: BoxDecoration(
                          border:
                              Border(bottom: BorderSide(color: greyShade1))),
                      padding: EdgeInsets.symmetric(horizontal: width * 0.03),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            inlogin = false;
                          });
                        },
                        child: Row(children: [
                          Container(
                            height: heght * 0.03,
                            width: heght * 0.03,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: grey),
                                color: white),
                            child: Icon(
                              Icons.circle,
                              size: heght * 0.015,
                              color: inlogin ? transparent : secondaryColor,
                            ),
                          ),
                          blankSpace(width: width * 0.02, height: 0),
                          RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                  text: 'Create Account. ',
                                  style: textTheme.bodyMedium!
                                      .copyWith(fontWeight: FontWeight.bold)),
                              TextSpan(
                                  text: 'New to Shemach?',
                                  style: textTheme.bodyMedium)
                            ]),
                          )
                        ]),
                      ),
                    ),
                  ]),
                ),
                blankSpace(height: heght * 0.02, width: 0),
                Container(
                  width: width,
                  decoration: containerDecoration(),
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Column(children: [
                    Container(
                      height: heght * 0.06,
                      width: width,
                      decoration: BoxDecoration(
                          border:
                              Border(bottom: BorderSide(color: greyShade1))),
                      padding: EdgeInsets.symmetric(horizontal: width * 0.03),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            inlogin = true;
                          });
                        },
                        child: Row(children: [
                          Container(
                            height: heght * 0.03,
                            width: heght * 0.03,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: grey),
                                color: white),
                            child: Icon(
                              Icons.circle,
                              size: heght * 0.015,
                              color: inlogin ? secondaryColor : transparent,
                            ),
                          ),
                          blankSpace(width: width * 0.02, height: 0),
                          RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                  text: 'Sign in. ',
                                  style: textTheme.bodyMedium!
                                      .copyWith(fontWeight: FontWeight.bold)),
                              TextSpan(
                                  text: 'Already a customer?',
                                  style: textTheme.bodyMedium)
                            ]),
                          ),
                        ]),
                      ),
                    ),
                    blankSpace(height: heght * 0.01, width: 0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            showCountryPicker(
                                context: context,
                                onSelect: (val) {
                                  setState(() {
                                    currentCountry = '+${val.phoneCode}';
                                  });
                                });
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: width * 0.2,
                            height: heght * 0.06,
                            decoration: BoxDecoration(
                                border: Border.all(color: grey),
                                borderRadius: BorderRadius.circular(5),
                                color: greyShade1),
                            child: Text(
                              currentCountry,
                              style: textTheme.displaySmall!.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: heght * 0.06,
                          width: width * 0.65,
                          child: TextFormField(
                            controller: mobileController,
                            cursorColor: black,
                            style: textTheme.bodyMedium!
                                .copyWith(fontWeight: FontWeight.w500),
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                hintText: "Mobile Number",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide(color: grey),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide:
                                      const BorderSide(color: secondaryColor),
                                ),
                                disabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide(color: grey),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide(color: grey),
                                )),
                          ),
                        )
                      ],
                    ),
                    blankSpace(height: heght * 0.02, width: 0),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          minimumSize: Size(width * 0.95, heght * 0.06),
                          backgroundColor: teal),
                      child: Text(
                        "Continue",
                        style: textTheme.displaySmall!.copyWith(
                            fontWeight: FontWeight.w600, color: white),
                      ),
                    ),
                    blankSpace(height: heght * 0.03, width: width * 0.88),
                    RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text: 'By Continuing you are to shemachoch',
                            style: textTheme.labelMedium),
                        TextSpan(
                            text: ' Condition of Use',
                            style:
                                textTheme.labelMedium!.copyWith(color: blue)),
                        TextSpan(text: ' and ', style: textTheme.labelMedium),
                        TextSpan(
                            text: 'Privacy Notice.',
                            style:
                                textTheme.labelMedium!.copyWith(color: blue)),
                      ]),
                    ),
                    blankSpace(height: heght * 0.03)
                  ]),
                ),
                blankSpace(height: heght * 0.03, width: 0),
                hDivider(width),
                blankSpace(height: heght * 0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Condintion Of Use',
                      style: textTheme.bodyMedium!.copyWith(color: blue),
                    ),
                    Text(
                      'Privacy Notice',
                      style: textTheme.bodyMedium!.copyWith(color: blue),
                    ),
                    Text(
                      'Help',
                      style: textTheme.bodyMedium!.copyWith(color: blue),
                    ),
                  ],
                ),
                blankSpace(height: heght * 0.01, width: 0),
                Container(
                  //color: black,
                  width: width,
                  // alignment: Alignment.,
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                    '@ 2023-25, besheger.com LLC or its affilates',
                    style: textTheme.bodyMedium!.copyWith(color: grey),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
