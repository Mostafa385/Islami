import 'package:flutter/cupertino.dart';
import 'package:islami_app/constant/app_assets.dart';
import 'package:islami_app/ui/widgets/custom_scaffold.dart';

class Ahdeth extends StatelessWidget {
  const Ahdeth({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      img: AppAssets.ahdethBackground,
      body: Center(child: Text("Ahdeth")),
    );
  }
}
