import 'package:flutter/material.dart';
import 'package:negade/constants/app_bar.dart';
import 'package:negade/constants/button_widgets.dart';
import 'package:negade/constants/common_functions.dart';
import 'package:negade/constants/decorations.dart';
import 'package:negade/constants/text_form_widgets.dart';
import 'package:negade/constants/text_widgets.dart';
import 'package:negade/controller/services/auth_service/auth_service.dart';
import 'package:negade/utils/colors.dart';

class OTP extends StatefulWidget {
  final String  mobileNo;
   const OTP({super.key, required this.mobileNo});

  @override
  State<OTP> createState() => _OTPState( );
}

class _OTPState extends State<OTP> {
  TextEditingController otp = TextEditingController();


  void routeTo(String dgf){
    AuthServices.verifyOTP(context: context, otp: otp.text.trim());
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final textTheme = Theme.of(context).textTheme;
    return  Scaffold(
      backgroundColor: white,
      appBar: buildAppBar(height),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start ,
            children: [

            blankSpace(height:height*0.01 ),
            Container(
                child: textDisplayLarge(
                    textTheme: textTheme,
                    text: "Authentication Required"
                ),
            ),
              blankSpace(),
              Container(
                decoration: containerDecoration(),
                child: Row(
                  children: [
                    textDisplaySmall(textTheme: textTheme, text: widget.mobileNo),
                    TextButton(onPressed: (){}, child:
                    textDisplaySmall(textTheme: textTheme, text: "change number ",color: teal)

                    )
                  ],
                ),
              )
              ,
              blankSpace(height: height*0.03),
              textBodyLarge(textTheme: textTheme, text: "We have sent a One time Password(OTP) to the mobile number above, please enter it to complete verification "),
              blankSpace(height:height*0.04),
              textForm(
                height:height * 0.06,
                width:width,
                textTheme:textTheme,
                hint: "Inter the OPT",
                isPassword: false,
                mobileController: otp),

              blankSpace(height: height*0.03),
              buildElevatedButton(width, height, textTheme,"Continue",routeTo,'/otp'),
              blankSpace(),
              Center(child: TextButton(onPressed: ()  {

              },
                  child:  textDisplaySmall(textTheme: textTheme, text: "Resend OTP ",color: teal)

              )),
              hDivider(width),
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


            ],),
        ),
      ),
    );
  }
}
