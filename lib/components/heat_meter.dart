import 'package:ember/themes/app_colors.dart';
import 'package:flutter/material.dart';

class HeatMeter extends StatelessWidget {
  final int level;
  const HeatMeter({super.key, required this.level});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(5, (index) {
        return Icon(
          Icons.local_fire_department,
          color: index < level ? AppColors.primary : AppColors.textSecondary,
        );
      }),
    );
  }
}
