import 'package:flutter/material.dart';
import 'package:islami_app/ui/screens/quran/sura_details_view.dart';
import 'package:islami_app/ui/screens/quran/widgets/recently_container.dart';
import 'package:islami_app/ui/screens/quran/widgets/sura_item.dart';

import '../../../constant/app_assets.dart';
import '../../../constant/app_color.dart';
import '../../../modules/sura_model.dart';

class Quran extends StatefulWidget {
  const Quran({super.key});

  @override
  State<Quran> createState() => _QuranState();
}

class _QuranState extends State<Quran> {
  final myController = TextEditingController();
  String textfiled = "";
  List filterSuras = [];
  List recentSuraList = [
    SuraModel(id: 1, suraNameAR: "الفاتحه", suraNameEN: "Al-Fatiha", verses: 7),
    SuraModel(
      id: 2,
      suraNameAR: "البقرة",
      suraNameEN: "Al-Baqarah",
      verses: 286,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    searchInSuraList();
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppAssets.quranBackground),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.black54, AppColor.black],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                Image.asset(AppAssets.totalTitleIcn),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      searchBar(),
                      const SizedBox(height: 20),
                      const Text(
                        "Most Recently",
                        style: TextStyle(
                          color: AppColor.white,
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 10),
                      recentSuraView(),
                      const SizedBox(height: 20),
                      const Text(
                        "Sura List",
                        style: TextStyle(
                          color: AppColor.white,
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: filterSuras.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                SuraDetailsView.routeName,
                                arguments: filterSuras[index],
                              );
                            },
                            child: SuraItem(sura: filterSuras[index]),
                          );
                        },
                        separatorBuilder: (context, index) =>
                            const Divider(indent: 50, endIndent: 50),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List searchInSuraList() {
    if (textfiled.isEmpty) {
      return filterSuras = SuraModel.suras;
    } else {
      return filterSuras = SuraModel.suras
          .where(
            (sura) =>
                sura.suraNameEN.toLowerCase().trim().contains(
                  textfiled.toLowerCase().trim(),
                ) ||
                sura.suraNameAR.contains(textfiled.trim().toLowerCase()),
          )
          .toList();
    }
  }

  Widget searchBar() {
    return TextField(
      controller: myController,
      onChanged: (value) {
        setState(() {
          textfiled = value;
        });
      },
      style: const TextStyle(
        color: AppColor.textColor,
        fontSize: 17,
        fontWeight: FontWeight.w600,
      ),
      cursorColor: AppColor.primary,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColor.black.withOpacity(0.7),
        prefixIcon: Image.asset(
          AppAssets.quranIcon,
          color: AppColor.primary,
          scale: 1.2,
        ),
        hintText: "Sura Name",
        hintStyle: const TextStyle(
          color: AppColor.textColor,
          fontSize: 17,
          fontWeight: FontWeight.bold,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColor.primary),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColor.primary),
        ),
      ),
    );
  }

  Widget recentSuraView() {
    return SizedBox(
      height: 155,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                SuraDetailsView.routeName,
                arguments: recentSuraList[index],
              );
            },
            child: RecentlyContainer(recentSura: recentSuraList[index]),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemCount: recentSuraList.length,
      ),
    );
  }
}
