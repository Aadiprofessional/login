import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rail_food/Screens/HomePage.dart';
import 'package:rail_food/Screens/CartPage.dart';
import 'package:rail_food/Screens/AccountPage.dart';

class AppAfterLogin extends StatefulWidget {
  const AppAfterLogin({Key? key}) : super(key: key);

  @override
  State<AppAfterLogin> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<AppAfterLogin> {

  int currentIndex = 0;

  final screens = const [
    HomePage(),
    CartPage(),
    AccountPage(),
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final user = FirebaseAuth.instance.currentUser!;

    return Scaffold(

      body: screens[currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,

        onTap: (index){
          setState(() {
            currentIndex = index;
          });
        },

        selectedItemColor: Colors.amber[900],

        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            label: 'Acount',
          ),
        ],
      ),
    );
  }
}

