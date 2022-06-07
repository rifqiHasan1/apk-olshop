import 'package:flutter/material.dart';
import 'package:uas/pages/favorite.dart';
import 'package:uas/pages/home.dart';
import 'package:uas/pages/keranjang.dart';
import 'package:uas/pages/profile.dart';


class BottomNavigation extends StatefulWidget {


  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
     int _selectedNavbar = 0;

  void _changeSelectedNavBar(int index) {
  setState(() {
    _selectedNavbar = index;
  });
}
 List _screens=[Home(),Favorite(),Keranjang(),Profile()];
  @override
 
  Widget build(BuildContext context) {
    return Scaffold(
      
        bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "home" 
            // title: Text('Beranda'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
             label: "favorite" 
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_basket_rounded),
             label: "cart" 
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
             label: "profile" 
            
          ),
        ],
        currentIndex: _selectedNavbar,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        onTap: _changeSelectedNavBar,
      ),
      body: _screens[_selectedNavbar],
    );
  }
}