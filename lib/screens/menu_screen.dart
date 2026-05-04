import 'package:ember/components/cards.dart';
import 'package:ember/components/categories.dart';
import 'package:ember/components/hero_Section.dart';
import 'package:ember/models/shop.dart';
import 'package:ember/screens/food_detail_screen.dart';
import 'package:ember/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  // navigate to food item detail page
  void navigateToFoodItem(int index) {
    // get the shop and its menu
    final shop = context.read<Shop>();
    final foodMenu = shop.foodMenu;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FoodDetailScreen(food: foodMenu[index]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final shop = context.read<Shop>();
    final foodMenu = shop.foodMenu;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: AppColors.textSecondary,
        centerTitle: true,
        title: Text(
          "E M B E R",
          style: GoogleFonts.dmSerifDisplay(color: AppColors.primary),
        ),
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, "/CartScreen");
            },
            icon: Icon(Icons.shopping_cart_outlined),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // hero section
                HeroSection(),
                const SizedBox(height: 20),

                // categories
                Text(
                  "CATEGORIES",
                  style: GoogleFonts.dmSerifDisplay(
                    fontSize: 16,
                    letterSpacing: 2,
                  ),
                ),

                const SizedBox(height: 10),

                SizedBox(
                  height: 100,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Categories(
                        text: "Grills",
                        icon: Center(
                          child: Icon(
                            Icons.fireplace_sharp,
                            color: AppColors.gold,
                            size: 20,
                          ),
                        ),
                      ),
                      // SizedBox(width: 25),
                      Categories(
                        text: "BBQ",
                        icon: Center(
                          child: Icon(
                            Icons.fastfood_outlined,
                            color: AppColors.gold,
                            size: 20,
                          ),
                        ),
                      ),
                      // SizedBox(width: 25),
                      Categories(
                        text: "Burger",
                        icon: Center(
                          child: Icon(
                            Icons.fireplace_sharp,
                            color: AppColors.gold,
                            size: 20,
                          ),
                        ),
                      ),
                      // SizedBox(width: 25),
                      Categories(
                        text: "Wings",
                        icon: Center(
                          child: Icon(
                            Icons.fastfood_outlined,
                            color: AppColors.gold,
                            size: 20,
                          ),
                        ),
                      ),
                      // SizedBox(width: 25),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                // featured
                Text(
                  "FEATURED",
                  style: GoogleFonts.dmSerifDisplay(
                    fontSize: 16,
                    letterSpacing: 2,
                  ),
                ),
                const SizedBox(height: 25),

                //  cards
                SizedBox(
                  height: 230,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: foodMenu.length,
                    itemBuilder: (context, index) => Cards(
                      food: foodMenu[index],

                      onTap: () => navigateToFoodItem(index),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
