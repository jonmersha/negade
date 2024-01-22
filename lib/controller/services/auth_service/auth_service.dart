import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:negade/controller/provider/auth_provider/auth_provider.dart';
import 'package:negade/view/auth_screen/otp_screen.dart';
import 'package:negade/view/auth_screen/sign_in_logic.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class AuthServices {
  static bool CheckAuthentication() {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;
    if (user != null) {
      return true;
    }
    return false;
  }

  static receiveOTP(
      {required BuildContext context, required String mobileNo}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    try {
      await auth.verifyPhoneNumber(
          phoneNumber: mobileNo,
          verificationCompleted: (PhoneAuthCredential credential) {
            log(credential.toString());
          },
          verificationFailed: (FirebaseAuthException exception) {
            log(exception.toString());
          },
          codeSent: (String verificationId, int? resendToken) {
            context
                .read<AuthProviders>()
                .upDateVerificationId(verId: verificationId);
                context.read<AuthProviders>().upDatePhoneNum(num:mobileNo);
            Navigator.push(
              context,
              PageTransition(
                  child: OTP(mobileNo: mobileNo),
                  type: PageTransitionType.rightToLeft),
            );
          },
          codeAutoRetrievalTimeout: (String verificationId) {});
    } catch (e) {
      log(e.toString());
    }
  }
  static verifyOTP(
    {required BuildContext context, required String otp}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    try {
      AuthCredential credential = PhoneAuthProvider.credential(
          verificationId: context.read<AuthProviders>().verificationId,
          smsCode: otp);
      await auth.signInWithCredential(credential);
      Navigator.push(
          context,
          PageTransition(
              child: const SignInLogic(),
              type: PageTransitionType.rightToLeft));
    } catch (e) {}
  }
}
