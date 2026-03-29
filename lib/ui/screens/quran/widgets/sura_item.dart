import 'package:flutter/cupertino.dart';
import 'package:islami_app/constant/app_assets.dart';
import 'package:islami_app/constant/app_color.dart';
import 'package:islami_app/modules/sura_model.dart';

class SuraItem extends StatelessWidget {
  final SuraModel sura;

  const SuraItem({super.key, required this.sura});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 50,
          height: 50,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppAssets.suraIcon),
              fit: BoxFit.cover,
            ),
          ),
          child: Text(
            sura.id.toString(),
            style: const TextStyle(
              color: AppColor.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(width: 25),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              sura.suraNameEN,
              style: const TextStyle(
                color: AppColor.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              "${sura.verses} Verses",
              style: const TextStyle(color: AppColor.white, fontSize: 14),
            ),
          ],
        ),
        const Spacer(),
        Text(
          sura.suraNameAR,
          style: const TextStyle(
            color: AppColor.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
