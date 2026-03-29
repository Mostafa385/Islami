import 'package:flutter/cupertino.dart';

import '../../../constant/app_assets.dart';
import '../../widgets/custom_scaffold.dart';

class Time extends StatelessWidget {
  const Time({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      img: AppAssets.timeBackground,
      body: Center(child: Text("Times")),
    );
  }
}
