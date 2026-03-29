import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/constant/app_assets.dart';
import 'package:islami_app/constant/app_color.dart';
import 'package:islami_app/modules/sura_model.dart';

class SuraDetailsView extends StatefulWidget {
  static const String routeName = "/sura_details_view";

  const SuraDetailsView({super.key});

  @override
  State<SuraDetailsView> createState() => _SuraDetailsViewState();
}

class _SuraDetailsViewState extends State<SuraDetailsView> {
  List versesText = [];
  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    var data = ModalRoute.of(context)?.settings.arguments as SuraModel;
    if (versesText.isEmpty) loadAssets(data.id);
    return Scaffold(
      backgroundColor: AppColor.black,
      appBar: AppBar(
        backgroundColor: AppColor.black,
        title: Text(data.suraNameEN),
        centerTitle: true,
        iconTheme: const IconThemeData(color: AppColor.primary),
        titleTextStyle: const TextStyle(
          color: AppColor.primary,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(AppAssets.leftSuraIcn),
                Text(
                  data.suraNameAR,
                  style: const TextStyle(
                    color: AppColor.primary,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Image.asset(AppAssets.rightSuraIcn),
              ],
            ),
          ),
          isLoading
              ? const CircularProgressIndicator(color: AppColor.primary)
              : Expanded(
                  child: ListView.builder(
                    itemCount: versesText.length,
                    itemBuilder: (context, index) {
                      return Text(
                        "(${index + 1}) ${versesText[index]}",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: AppColor.primary,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    },
                  ),
                ),
          // const Spacer(),
          // Image.asset(AppAssets.btnSuraIcn, fit: BoxFit.cover),
        ],
      ),
    );
  }

  Future loadAssets(int index) async {
    String content = await rootBundle.loadString('assets/Suras/$index.txt');
    setState(() {
      versesText = content.split("\n");
      isLoading = false;
    });
  }
}
