import 'package:flutter/material.dart';
class AuthProviders extends ChangeNotifier{
  String phoneNumber='';
  String verificationId='';
  String otp='';
   upDatePhoneNum({required String num}){
    phoneNumber=num;
    notifyListeners();
  }
   upDateVerificationId({required String verId}){
    verificationId=verId;
    notifyListeners();
  }
}