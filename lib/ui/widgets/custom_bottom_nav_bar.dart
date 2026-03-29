import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  final bool isSelected;
  final String icnPath;

  const CustomBottomNavBar({
    super.key,
    required this.icnPath,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isSelected ? Colors.black54 : null,
        borderRadius: BorderRadius.circular(24),
      ),
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 18),
      child: ImageIcon(AssetImage(icnPath)),
    );
  }
}
