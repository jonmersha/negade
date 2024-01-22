import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:negade/controller/provider/auth_provider/auth_provider.dart';
import 'package:negade/firebase_options.dart';
import 'package:negade/utils/theme.dart';
import 'package:negade/view/auth_screen/auth_screen.dart';
import 'package:negade/view/auth_screen/otp_screen.dart';
import 'package:negade/view/auth_screen/sign_in_logic.dart';
import 'package:negade/view/user/home/home_screen.dart';

import 'package:provider/provider.dart';

Future main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const Negade());
}

class Negade extends StatelessWidget {
  const Negade({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider<AuthProviders>(create: (_)=>AuthProviders())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme,
        initialRoute: "/",
        routes: {
          "/auth":(context)=>const AuthScreen(),
          "/home":(context)=>const HomeScreen(),
          "/otp":(context)=> const OTP(mobileNo: "+251938948155",),
        },
        home: const SignInLogic(),
      ),
    );
  }
}
