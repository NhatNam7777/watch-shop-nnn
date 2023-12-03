import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:nnn_watch_shop/constants.dart';
import 'package:nnn_watch_shop/ui/homebody-page.dart';
import 'package:nnn_watch_shop/ui/noti-page.dart';
import 'package:nnn_watch_shop/ui/user-page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> _pages = [HomeBodyPage(), NotiPage(), UserPage()];
  int _selectedItem = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedItem = index;
    });
  }

  double widthIcon = 35;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedItem],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        // backgroundColor: Colors.red,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: _selectedItem == 0
                  ? Image.asset(
                      'lib/assets/icons/home.png',
                      width: widthIcon,
                      color: Colors.red,
                    )
                  : Image.asset(
                      'lib/assets/icons/home.png',
                      width: widthIcon,
                      color: Colors.grey,
                    ),
              label: ''),
          BottomNavigationBarItem(
              icon: _selectedItem == 1
                  ? Image.asset(
                      'lib/assets/icons/notification.png',
                      width: widthIcon,
                      color: Colors.red,
                    )
                  : Image.asset(
                      'lib/assets/icons/notification.png',
                      width: widthIcon,
                      color: Colors.grey,
                    ),
              label: ''),
          BottomNavigationBarItem(
              icon: _selectedItem == 2
                  ? Image.asset(
                      'lib/assets/icons/user.png',
                      width: widthIcon,
                      color: Colors.red,
                    )
                  : Image.asset(
                      'lib/assets/icons/user.png',
                      width: widthIcon,
                      color: Colors.grey,
                    ),
              label: ''),
        ],
        currentIndex: _selectedItem,
        onTap: _onItemTapped,
      ),
    );
  }
}
