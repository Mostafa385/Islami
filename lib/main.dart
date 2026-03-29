import 'package:flutter/material.dart';
import 'package:islami_app/ui/screens/layout_screen.dart';
import 'package:islami_app/ui/screens/onboarding/onboarding.dart';
import 'package:islami_app/ui/screens/quran/sura_details_view.dart';
import 'package:islami_app/ui/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Islami',
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (context) => const SplashScreen(),
        LayoutScreen.routeName: (context) => const LayoutScreen(),
        Onboarding.routeName: (context) => const Onboarding(),
        SuraDetailsView.routeName: (context) => SuraDetailsView(),
      },
    );
  }
}
