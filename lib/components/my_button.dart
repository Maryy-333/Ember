// ignore_for_file: must_be_immutable

import 'package:ember/themes/app_colors.dart';
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  void Function()? onTap;
  final Widget icon;
  final width;
  final padding;
  MyButton({
    super.key,
    required this.text,
    required this.icon,
    required this.onTap,

    required this.width,
    required this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        // height: height,
        width: width,
        padding: padding,
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(10),
        ),
        child: TextButton(
          onPressed: onTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              // text
              Text(text, style: TextStyle(fontSize: 18, color: Colors.black)),
              SizedBox(width: 10),

              icon,
            ],
          ),
        ),
      ),
    );
  }
}
