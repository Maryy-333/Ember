import 'package:ember/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CookSlider extends StatefulWidget {
  const CookSlider({super.key});

  @override
  State<CookSlider> createState() => _CookSliderState();
}

class _CookSliderState extends State<CookSlider> {
  double value = 2;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // text
        Text("Cook Level", style: GoogleFonts.poppins(color: AppColors.gold)),
        const SizedBox(height: 10),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.textSecondary, width: 0.9),
            borderRadius: BorderRadius.circular(24),
          ),

          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Rare", style: TextStyle(fontSize: 12)),
              Text("Medium Rare", style: TextStyle(fontSize: 12)),
              Text(" Medium", style: TextStyle(fontSize: 12)),
              Text("Well done", style: TextStyle(fontSize: 12)),
            ],
          ),
        ),
        Slider(
          value: value,
          min: 0,
          max: 3,
          divisions: 3,
          activeColor: AppColors.gold,
          onChanged: (v) {
            setState(() {
              value = v;
            });
          },
        ),
      ],
    );
  }
}
