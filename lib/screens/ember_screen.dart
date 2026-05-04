import 'package:ember/components/my_button.dart';
import 'package:ember/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EmberScreen extends StatelessWidget {
  const EmberScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // App name
                    Text(
                      "EMBER",
                      style: GoogleFonts.dmSerifDisplay(
                        color: AppColors.primary,
                        fontSize: 40,
                        letterSpacing: 3,
                      ),
                    ),
                    const SizedBox(height: 20),

                    // image
                    Container(
                      margin: EdgeInsets.symmetric(
                        vertical: 20,
                        horizontal: 10,
                      ),
                      height: 220,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: DecorationImage(
                          image: AssetImage("smoked-ribeye.png"),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),
                    // heading
                    Text(
                      "Ignite",
                      style: GoogleFonts.dmSerifDisplay(fontSize: 40),
                    ),

                    Text(
                      "Your Hunger",
                      style: GoogleFonts.dmSerifDisplay(
                        fontSize: 40,
                        color: AppColors.primary,
                      ),
                    ),
                    const SizedBox(height: 20),

                    // subheading
                    Text(
                      "Premium grill, Bold Flavour,",
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        letterSpacing: 2,
                        height: 2,
                        fontWeight: FontWeight.w300,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    Text(
                      "Unforgettable Experience",
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        height: 2,
                        fontWeight: FontWeight.w300,
                        color: AppColors.textPrimary,
                        letterSpacing: 2,
                      ),
                    ),
                  ],
                ),

                // subheading
                const SizedBox(height: 30),
                // button
                MyButton(
                  text: "Explore Menu",
                  onTap: () {
                    Navigator.pushNamed(context, "/MenuScreen");
                  },
                  icon: Icon(
                    Icons.arrow_forward_rounded,
                    color: Colors.black,
                    size: 25,
                  ),
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
