import 'package:flutter/cupertino.dart';
import 'package:islami_app/constant/app_assets.dart';

import '../../../../constant/app_color.dart';
import '../../../../modules/sura_model.dart';

class RecentlyContainer extends StatelessWidget {
  final SuraModel recentSura;

  const RecentlyContainer({super.key, required this.recentSura});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.primary,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 17),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  recentSura.suraNameEN,
                  style: const TextStyle(
                    color: AppColor.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // SizedBox(height: 10),
                Text(
                  recentSura.suraNameAR,
                  style: const TextStyle(
                    color: AppColor.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // SizedBox(height: 10),
                Text(
                  "${recentSura.verses} Verses",
                  style: const TextStyle(
                    color: AppColor.black,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(AppAssets.recentImage, fit: BoxFit.cover),
          ),
        ],
      ),
    );
  }
}
