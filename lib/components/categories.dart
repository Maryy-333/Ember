import 'package:ember/components/glass_container.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Categories extends StatelessWidget {
  final String text;
  final Widget icon;
  const Categories({super.key, required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GlassContainer(
          height: 70,
          width: 70,
          padding: EdgeInsets.all(12),
          margin: EdgeInsets.only(right: 15),
          child: icon,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Text(
            text,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w300,
              fontSize: 12,
            ),
          ),
        ),
      ],
    );
  }
}
