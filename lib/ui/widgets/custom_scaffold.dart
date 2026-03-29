import 'package:flutter/material.dart';
import 'package:islami_app/constant/app_assets.dart';

import '../../constant/app_color.dart';

class CustomScaffold extends StatelessWidget {
  final String img;
  final Widget body;

  const CustomScaffold({super.key, required this.img, required this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(img), fit: BoxFit.cover),
        ),
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.black54, AppColor.black],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            children: [
              Image.asset(AppAssets.totalTitleIcn),
              Expanded(child: body),
            ],
          ),
        ),
      ),
    );
  }
}
