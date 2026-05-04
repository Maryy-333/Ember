import 'package:ember/models/shop.dart';
import 'package:ember/screens/cart_screen.dart';
import 'package:ember/screens/ember_screen.dart';
import 'package:ember/screens/menu_screen.dart';
import 'package:ember/themes/app_theme.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(create: (context) => Shop(), child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: EmberScreen(),
      theme: AppTheme.darkTheme,
      routes: {
        '/MenuScreen': (context) => MenuScreen(),
        '/CartScreen': (context) => CartScreen(),
      },
    );
  }
}
