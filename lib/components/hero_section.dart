// import 'package:ember/components/my_button.dart';
// ignore_for_file: file_names

import 'dart:ui';

import 'package:ember/components/my_button.dart';
import 'package:ember/themes/app_colors.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(
          image: AssetImage("smoked-ribeye.png"),

          fit: BoxFit.fill,
          opacity: 0.8,
        ),
      ),

      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("IGNITE", style: GoogleFonts.dmSerifDisplay(fontSize: 25)),
              Text(
                "YOUR HUNGER",
                style: GoogleFonts.dmSerifDisplay(
                  fontSize: 25,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "Premium Grill,Bold Flavour,",
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.w600,
                ),
              ),

              Text(
                "UnForgettable Taste",
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 20),

              MyButton(
                text: "Explore",
                icon: Icon(
                  Icons.arrow_forward_outlined,
                  color: Colors.black,
                  size: 20,
                ),
                onTap: () {},
                width: 150,
                padding: EdgeInsets.symmetric(horizontal: 6),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
