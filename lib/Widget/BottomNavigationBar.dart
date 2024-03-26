import 'package:final_exam/Widget/Home_Page.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'FavoritePage.dart';
import 'NotificationPage.dart';
import 'ShopPage.dart';

class BottomNagivation extends StatefulWidget {
  const BottomNagivation({super.key});

  @override
  State<BottomNagivation> createState() => _BottomNagivationState();
}

class _BottomNagivationState extends State<BottomNagivation> {
  int _selectIndex = 0;
  var screen = [
    HomePage(),
    Favorite(),
    Shop(),
    NotificationPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screen.elementAt(_selectIndex),
      bottomNavigationBar: GNav(
        backgroundColor: Colors.black,
        color: Colors.white,
        activeColor: Colors.white,
        tabBackgroundColor: Colors.grey.shade800,
        curve: Curves.easeInExpo,
        gap: 8,
        padding: EdgeInsets.all(16),
        tabs: [
          GButton(icon: Icons.home, text: 'Home'),
          GButton(icon: Icons.favorite, text: 'Favorite'),
          GButton(icon: Icons.shopping_cart, text: 'Card'),
          GButton(icon: Icons.notifications, text: 'Notification'),
        ],
        selectedIndex: _selectIndex,
        onTabChange: (index){
          setState(() {
            _selectIndex = index;
          });
        },
      ),
    );
  }
}
