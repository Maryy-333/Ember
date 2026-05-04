// ignore_for_file: must_be_immutable

import 'package:ember/models/food.dart';
import 'package:ember/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Cards extends StatefulWidget {
  final Food food;

  void Function()? onTap;
  Cards({super.key, required this.food, required this.onTap});

  @override
  State<Cards> createState() => _CardsState();
}

class _CardsState extends State<Cards> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        margin: EdgeInsets.only(right: 20),
        width: 150,
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(color: AppColors.textSecondary, width: 1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // image
            Container(
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  image: AssetImage(widget.food.imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // title
                  Text(widget.food.name, style: GoogleFonts.poppins()),
                  const SizedBox(height: 10),
                  // price + rating
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // price
                      Text(
                        widget.food.price,
                        style: TextStyle(color: AppColors.gold),
                      ),

                      // rating + icon
                      Row(
                        children: [
                          Text(
                            widget.food.rating,
                            style: TextStyle(color: AppColors.gold),
                          ),
                          SizedBox(width: 5),
                          Icon(Icons.star, color: AppColors.gold, size: 14),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
