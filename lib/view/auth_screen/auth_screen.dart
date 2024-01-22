import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:negade/constants/app_bar.dart';
import 'package:negade/constants/button_widgets.dart';
import 'package:negade/constants/common_functions.dart';
import 'package:negade/constants/decorations.dart';
import 'package:negade/constants/text_widgets.dart';
import 'package:negade/controller/services/auth_service/auth_service.dart';
import 'package:negade/utils/colors.dart';

import '../../constants/text_form_widgets.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});
  @override
  State<AuthScreen> createState() => _AuthScreenState();
}
class _AuthScreenState extends State<AuthScreen> {
  bool inLogin = true;
  bool isRemember=false;
  String currentCountry = '+251';
  TextEditingController mobileController = TextEditingController();

  void isCreateAccount(){
    setState(() {
      inLogin = false;
      //print("Login Is pressed $inlogin");
    });
  }
  void routeTo(String path){
    setState(() {
      AuthServices.receiveOTP(context: context, mobileNo: "+251938948155");
    });
  }
  void authService(String path){
    setState(() {
      AuthServices.receiveOTP(
          context: context,
          mobileNo: '$currentCountry${mobileController.text.trim()}');
    });
  }
  void toglecheck(){
    setState(() {
      isRemember=!isRemember;
     // print("Is Rememeber $isRemember");
    });
    // return checked;
  }

  void isLogin(){
    setState(() {
      inLogin = true;
     // print("Login Is pressed $inlogin");
    });
  }
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: white,
      appBar: buildAppBar(height),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            height: height,
            width: width,
            padding: EdgeInsets.symmetric(
                horizontal: width * 0.03, vertical: height * 0.02),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Welcome",
                  style: textTheme.displaySmall!
                      .copyWith(fontWeight: FontWeight.w600),
                ),
                blankSpace(height: height * 0.02, width: 0),
                Container(
                  width: width,
                  decoration: containerDecoration(),
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                      children: [
                        custom_radio(
                            message1: "Create Account",
                            message2: "New to shemach?",
                            height:height,
                            width:width,
                            textTheme:textTheme,
                            inverted: false,
                            func:isCreateAccount,
                            inLogin: inLogin),
                        if(inLogin)
                          custom_radio(
                              message1: "Sign in",
                              message2: "Already Customer",
                              height:height,
                              width:width,
                              textTheme:textTheme,
                              inverted: true,
                              func:isLogin,
                              inLogin: inLogin),

                        if(!inLogin)
                          textForm(
                              height:height * 0.06,
                              width:width,
                              textTheme:textTheme,
                              hint: "Full name",
                              isPassword: false,
                              mobileController: mobileController),


                        blankSpace(height: height*0.01),
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
                                height: height * 0.06,
                                decoration: BoxDecoration(
                                    border: Border.all(color: grey),
                                    borderRadius: BorderRadius.circular(5),
                                    color: greyShade1),
                                child: textDisplaySmall(textTheme:textTheme,text: currentCountry),
                              ),
                            ),
                            //For Mobile numbers
                            textForm(
                                height:height * 0.06,
                                width:width * 0.65,
                                textTheme:textTheme,
                                hint: "Mobile number",
                                isPassword: false,
                                mobileController: mobileController),
                          ],
                        ),
                        if(!inLogin)
                          blankSpace(height: height * 0.02, width: 0),
                        if(!inLogin)
                          Container(decoration: containerDecoration(

                          ),
                            child:   const Row(children: [
                              // Icon(Icons.in,)
                            ],),
                          ),
                        if(!inLogin)
                          custom_checkbox(
                            message1: "Show",
                            message2: "Password",
                            height:height,
                            width:width,
                            textTheme:textTheme,
                            func:toglecheck,
                            isChecked: isRemember,
                          )
                        ,
                        blankSpace(height: height * 0.02, width: 0),
                        if(!inLogin)
                          Container(
                            //  height: height*0.06,
                            width: width*0.9,
                            decoration: containerDecoration(),
                            child: Text("By enrolling your mobile number, you concent to receive automated security notifications via text message from shemach. Message and data rates may apply",
                              style: textTheme.displayMedium,),
                          ),
                        blankSpace(height: height * 0.02, width: 0),

                        if(!inLogin)
                          buildElevatedButton(width, height, textTheme,"Verify Mobile number",routeTo,"/otp"),
                        if(inLogin)
                          buildElevatedButton(width, height, textTheme,"Continue",authService,'/otp'),

                        blankSpace(height: height * 0.03, width: width * 0.88),
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
                      //  blankSpace(height: height * 0.03)
                      ]),
                ),
                if(inLogin)
                blankSpace(height: height * 0.02, width: 0),
                if(!inLogin)
                  custom_radio(
                      message1: "Sign in",
                      message2: "Already Customer",
                      height:height,
                      width:width,
                      textTheme:textTheme,
                      inverted: true,
                      func:isLogin,
                      inLogin: inLogin),
                hDivider(width),
                if(!inLogin)
                blankSpace(height: height * 0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Condition Of Use',
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
                blankSpace(height: height * 0.01, width: 0),
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
