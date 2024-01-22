import 'package:flutter/material.dart';
import 'package:negade/controller/services/auth_service/auth_service.dart';
import 'package:negade/view/auth_screen/auth_screen.dart';
import 'package:negade/view/user/user_persistant_nav_bar/bottom_bar.dart';
import 'package:page_transition/page_transition.dart';

class SignInLogic extends StatefulWidget {
  const SignInLogic({super.key});

  @override
  State<SignInLogic> createState() => _SignInLogicState();
}

class _SignInLogicState extends State<SignInLogic> {
  checkAuthentication(){
    bool userIsAuthenticated=AuthServices.CheckAuthentication();

    userIsAuthenticated?
    Navigator.pushAndRemoveUntil(
        context,
        PageTransition(
            child: const BottomBar(),
            type: PageTransitionType.rightToLeft), (route) => false)
        : Navigator.pushAndRemoveUntil(
        context, PageTransition(
        child: const AuthScreen(),
        type: PageTransitionType.rightToLeft), (route) => false);

  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) { 
      checkAuthentication();
    });
  }

  @override
  Widget build(BuildContext context) {
    //checkAuth();
    return const Scaffold(
      body: Image(
        image: AssetImage('assets/images/splash.png'),
        fit: BoxFit.fill,),);
  }
}
