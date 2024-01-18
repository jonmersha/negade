import 'package:flutter/material.dart';
import 'package:negade/utils/theme.dart';
import 'package:negade/view/auth_screen.dart';

void main() {
  runApp(const Negade());
}

class Negade extends StatelessWidget {
  const Negade({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
      home: AuthScreen(),
    );
  }
}
