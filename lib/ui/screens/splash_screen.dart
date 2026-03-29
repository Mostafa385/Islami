import 'dart:async';

import 'package:flutter/material.dart';
import 'package:islami_app/ui/screens/onboarding/onboarding.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = "splash";

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double _scale = 0.5;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _scale = 1.2;
      });

      Timer(const Duration(seconds: 2), () {
        Navigator.of(
          context,
        ).pushNamedAndRemoveUntil(Onboarding.routeName, (route) => false);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0XFF202020),
      body: Center(
        child: AnimatedScale(
          scale: _scale,
          duration: const Duration(milliseconds: 1500),
          child: Image.asset(
            "assets/icons/splash_screen.png",
            width: mediaQuery.width,
            height: mediaQuery.height,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
