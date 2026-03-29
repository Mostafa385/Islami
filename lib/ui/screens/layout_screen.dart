import 'package:flutter/material.dart';
import 'package:islami_app/constant/app_assets.dart';
import 'package:islami_app/constant/app_color.dart';
import 'package:islami_app/ui/screens/ahdeth/ahdeth.dart';
import 'package:islami_app/ui/screens/quran/quran.dart';
import 'package:islami_app/ui/screens/radio/radio.dart';
import 'package:islami_app/ui/screens/sebha/sebha.dart';
import 'package:islami_app/ui/screens/time/time.dart';

import '../widgets/custom_bottom_nav_bar.dart';

class LayoutScreen extends StatefulWidget {
  static const String routeName = "layout";
  const LayoutScreen({super.key});

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = const [
    Quran(),
    Ahdeth(),
    Sebha(),
    Radioo(),
    Time(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedItemColor: AppColor.white,
        unselectedItemColor: AppColor.black,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColor.primary,
        items: [
          BottomNavigationBarItem(
            icon: CustomBottomNavBar(
              icnPath: AppAssets.quranIcon,
              isSelected: _currentIndex == 0,
            ),
            label: "Quran",
          ),
          BottomNavigationBarItem(
            icon: CustomBottomNavBar(
              icnPath: AppAssets.ahethIcon,
              isSelected: _currentIndex == 1,
            ),
            label: "Ahades",
          ),
          BottomNavigationBarItem(
            icon: CustomBottomNavBar(
              icnPath: AppAssets.sebhaIcon,
              isSelected: _currentIndex == 2,
            ),
            label: "Sebha",
          ),
          BottomNavigationBarItem(
            icon: CustomBottomNavBar(
              icnPath: AppAssets.radioIcon,
              isSelected: _currentIndex == 3,
            ),
            label: "Radio",
          ),
          BottomNavigationBarItem(
            icon: CustomBottomNavBar(
              icnPath: AppAssets.timeIcon,
              isSelected: _currentIndex == 4,
            ),
            label: "Time",
          ),
        ],
      ),
      body: _screens[_currentIndex],
    );
  }
}
