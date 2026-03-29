import 'package:flutter/cupertino.dart';

import '../../../constant/app_assets.dart';
import '../../widgets/custom_scaffold.dart';

class Radioo extends StatelessWidget {
  const Radioo({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      img: AppAssets.radioBackground,
      body: Center(child: Text("Radio")),
    );
  }
}
