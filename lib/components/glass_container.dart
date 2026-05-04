// ignore_for_file: prefer_typing_uninitialized_variables, strict_top_level_inference

import 'dart:ui';

import 'package:flutter/material.dart';

class GlassContainer extends StatelessWidget {
  final height;
  final width;
  final child;
  final margin;
  final padding;

  GlassContainer({
    super.key,
    required this.height,
    required this.width,
    required this.child,
    required this.margin,
    required this.padding,
  });
  final borderRadius = BorderRadius.circular(12);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: Container(
        padding: padding,
        margin: margin,
        width: width,
        height: height,

        // decoration: BoxDecoration(color: Colors.white),
        child: Stack(
          children: [
            // blur effect
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
              child: Container(),
            ),

            // gradient effect
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white.withOpacity(0.2)),
                borderRadius: borderRadius,
                gradient: LinearGradient(
                  colors: [
                    Colors.white.withOpacity(0.1),
                    Colors.white.withOpacity(0),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
            child,
          ],
        ),
      ),
    );
  }
}
