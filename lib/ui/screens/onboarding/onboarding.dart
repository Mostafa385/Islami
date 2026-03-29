import 'package:flutter/material.dart';
import 'package:islami_app/constant/app_assets.dart';
import 'package:islami_app/ui/screens/layout_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Onboarding extends StatefulWidget {
  static const String routeName = "onboarding";
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class OnboardingItem {
  late String image;
  late String header;
  String? desc;

  OnboardingItem({required this.image, required this.header, this.desc});
}

class _OnboardingState extends State<Onboarding> {
  int _currentIndex = 0;
  late final PageController _controller;
  final List<OnboardingItem> frames = [
    OnboardingItem(
      image: "assets/images/frame_1.png",
      header: "Welcome To Islmi App",
    ),
    OnboardingItem(
      image: "assets/images/frame_2.png",
      header: "Welcome To Islmi App",
      desc: "We Are Very Excited To Have You In Our Community",
    ),
    OnboardingItem(
      image: "assets/images/frame_3.png",
      header: "Reading the Quran",
      desc: "Read, and your Lord is the Most Generous",
    ),
    OnboardingItem(
      image: "assets/images/frame_4.png",
      header: "Bearish",
      desc: "Praise the name of your Lord, the Most High",
    ),
    OnboardingItem(
      image: "assets/images/frame_5.png",
      header: "Holy Quran Radio",
      desc:
          "You can listen to the Holy Quran Radio through the application for free and easily",
    ),
  ];
  @override
  void initState() {
    // TODO: implement initState
    _controller = PageController();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFF202020),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              alignment: AlignmentGeometry.bottomCenter,
              children: [
                Image.asset(AppAssets.mosqueIcon, width: 250),
                Image.asset(AppAssets.islamiWordIcon, width: 150),
              ],
            ),
            Expanded(
              child: PageView.builder(
                controller: _controller,
                itemCount: frames.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                itemBuilder: (context, index) {
                  return pageViewWidgetBuilder(index);
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      if (_currentIndex == 0) {
                        Navigator.pushReplacementNamed(
                          context,
                          LayoutScreen.routeName,
                        );
                      } else {
                        _controller.previousPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      }
                    });
                  },
                  child: Text(
                    _currentIndex == 0 ? "Skip" : "Back",
                    textAlign: TextAlign.end,
                    style: const TextStyle(
                      fontSize: 20,
                      color: Color(0XFFE2BE7F),
                    ),
                  ),
                ),
                SmoothPageIndicator(
                  controller: _controller,
                  count: frames.length,
                  effect: const WormEffect(
                    dotHeight: 12,
                    dotWidth: 12,
                    dotColor: Colors.grey,
                    activeDotColor: Color(0XFFE2BE7F),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      if (_currentIndex == frames.length - 1) {
                        Navigator.pushReplacementNamed(
                          context,
                          LayoutScreen.routeName,
                        );
                      } else {
                        _controller.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      }
                    });
                  },
                  child: Text(
                    _currentIndex == frames.length - 1 ? "Finish" : "Next",
                    textAlign: TextAlign.end,
                    style: const TextStyle(
                      fontSize: 20,
                      color: Color(0XFFE2BE7F),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget pageViewWidgetBuilder(index) {
    return Column(
      children: [
        Image.asset(frames[index].image, fit: BoxFit.contain),
        Text(
          frames[index].header,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 35, color: Color(0XFFE2BE7F)),
        ),
        Text(
          frames[index].desc ?? "",
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 20, color: Color(0XFFE2BE7F)),
        ),
      ],
    );
  }
}
