import 'package:flutter/cupertino.dart';

import '../../../constant/app_assets.dart';
import '../../widgets/custom_scaffold.dart';

class Sebha extends StatelessWidget {
  const Sebha({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      img: AppAssets.sebhaBackground,
      body: Center(child: Text("Sebha")),
    );
  }
}
