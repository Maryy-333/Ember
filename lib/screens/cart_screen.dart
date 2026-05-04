import 'package:ember/components/glass_container.dart';
import 'package:ember/components/my_button.dart';
import 'package:ember/models/food.dart';
import 'package:ember/models/shop.dart';
import 'package:ember/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  // remove from cart method
  void removeFromCart(Food food, BuildContext context) {
    // get access to shop
    final shop = context.read<Shop>();

    shop.removeFrmCart(food);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Shop>(
      builder: (context, value, child) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "MY CART",
            style: GoogleFonts.poppins(
              color: AppColors.gold,
              fontWeight: FontWeight.w300,
              fontSize: 16,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // listview
              GlassContainer(
                height: 300,
                width: double.infinity,
                margin: EdgeInsets.all(8),
                padding: EdgeInsets.all(4),
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: value.cart.length,
                  itemBuilder: (context, index) {
                    // get food from the cart
                    final Food food = value.cart[index];
                    // get food name and price
                    final String foodName = food.name;
                    final String price = food.price;
                    final String imagepath = food.imagePath;
                    return Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: AppColors.textSecondary,
                            width: 0.4,
                          ),
                        ),
                      ),
                      child: ListTile(
                        title: Text(
                          foodName,
                          style: GoogleFonts.dmSerifDisplay(),
                        ),
                        subtitle: Text(
                          price,
                          style: TextStyle(color: AppColors.gold),
                        ),
                        leading: Image.asset(imagepath),
                        trailing: IconButton(
                          onPressed: () => removeFromCart(food, context),
                          icon: Icon(Icons.delete),
                        ),
                      ),
                    );
                  },
                ),
              ),
              MyButton(
                text: "Pay now",
                icon: Icon(Icons.attach_money_sharp, color: Colors.black),
                onTap: () {},
                width: double.infinity,
                padding: EdgeInsets.all(2),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
