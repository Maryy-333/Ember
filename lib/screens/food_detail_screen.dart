import 'package:ember/components/cook_slider.dart';
import 'package:ember/components/heat_meter.dart';
import 'package:ember/components/my_button.dart';
import 'package:ember/models/food.dart';
import 'package:ember/models/shop.dart';
import 'package:ember/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FoodDetailScreen extends StatefulWidget {
  final Food food;
  const FoodDetailScreen({super.key, required this.food});

  @override
  State<FoodDetailScreen> createState() => _FoodDetailScreenState();
}

class _FoodDetailScreenState extends State<FoodDetailScreen> {
  int quantityCount = 0;

  // decrement method
  void decrementCount() {
    setState(() {
      if (quantityCount > 0) {
        quantityCount--;
      }
    });
  }

  // increment Method
  void incrementCount() {
    setState(() {
      quantityCount++;
    });
  }

  // add to cart method

  void addToCart() {
    // only add if there is something in the cart
    if (quantityCount > 0) {
      // get acces to shop
      final shop = context.read<Shop>();
      shop.addToCart(widget.food, quantityCount);

      // show Dialogue
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => AlertDialog(
          backgroundColor: AppColors.card,
          content: Text(
            "Added Successfully",
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(color: AppColors.gold),
          ),
          actions: [
            // ok button
            IconButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
              icon: Icon(Icons.done),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: AppColors.textSecondary,
        centerTitle: true,
        title: Text(
          "EMBER Kitchen",
          style: GoogleFonts.poppins(
            color: AppColors.gold,
            fontSize: 14,
            letterSpacing: 3,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // image
              Container(
                height: 250,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(widget.food.imagePath),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        //title and detail
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              widget.food.name,
                              style: GoogleFonts.dmSerifDisplay(),
                            ),
                            Text(
                              widget.food.price,
                              style: GoogleFonts.dmSerifDisplay(
                                color: AppColors.gold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // rating
                            Row(
                              children: [
                                Text(
                                  widget.food.rating,
                                  style: TextStyle(
                                    color: AppColors.textSecondary,
                                  ),
                                ),
                                const SizedBox(width: 5),
                                Icon(
                                  Icons.star,
                                  color: AppColors.gold,
                                  size: 16,
                                ),
                              ],
                            ),
                            Text(
                              "|",
                              style: TextStyle(color: AppColors.textSecondary),
                            ),
                            // gram
                            Text(
                              "450g",
                              style: TextStyle(color: AppColors.textSecondary),
                            ),
                            Text(
                              "|",
                              style: TextStyle(color: AppColors.textSecondary),
                            ),
                            // description
                            Text(
                              "Premium Cut",
                              style: TextStyle(color: AppColors.textSecondary),
                            ),
                          ],
                        ),
                        // description
                        const SizedBox(height: 10),
                        Text(
                          widget.food.description,
                          style: GoogleFonts.poppins(
                            color: AppColors.textSecondary,
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                            height: 2,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),

                    //cook level
                    CookSlider(),

                    SizedBox(height: 20),
                    // heat meter
                    Text("HEAT LEVEL", style: TextStyle(color: AppColors.gold)),
                    SizedBox(height: 10),
                    HeatMeter(level: 3),
                  ],
                ),
              ),

              // add to cart button
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8.0,
                  horizontal: 18,
                ),
                child: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(
                        color: AppColors.textSecondary,
                        width: 0.5,
                      ),
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // quantity counter
                      Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: AppColors.textSecondary,
                            width: 0.8,
                          ),
                        ),
                        child: Row(
                          children: [
                            // - button
                            Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(8),
                                color: AppColors.background,
                                border: Border.all(
                                  color: AppColors.textSecondary,
                                  width: 0.8,
                                ),
                              ),
                              child: IconButton(
                                onPressed: () {
                                  decrementCount();
                                },
                                icon: Icon(
                                  Icons.remove,
                                  size: 12,
                                  color: AppColors.gold,
                                ),
                              ),
                            ),
                            // text
                            SizedBox(
                              width: 40,
                              child: Center(
                                child: Text(quantityCount.toString()),
                              ),
                            ),
                            // + button
                            Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(8),
                                color: AppColors.background,
                                border: Border.all(
                                  color: AppColors.textSecondary,
                                  width: 0.8,
                                ),
                              ),
                              child: IconButton(
                                onPressed: () {
                                  incrementCount();
                                },
                                icon: Icon(
                                  Icons.add,
                                  size: 12,
                                  color: AppColors.gold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // const SizedBox(width: 15),
                      MyButton(
                        text: "Add to Cart",
                        icon: Icon(
                          Icons.shopping_cart_outlined,
                          color: Colors.black,
                        ),
                        onTap: addToCart,
                        width: 180,
                        padding: EdgeInsets.symmetric(horizontal: 4),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
