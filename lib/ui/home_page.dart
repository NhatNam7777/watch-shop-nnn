import 'package:flutter/material.dart';
import 'package:nnn_watch_shop/constants.dart';
import 'package:nnn_watch_shop/ui/home_body_page.dart';
import 'package:nnn_watch_shop/ui/message_page.dart';
import 'package:nnn_watch_shop/ui/noti_page.dart';
import 'package:nnn_watch_shop/ui/user_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Widget> _pages = const [
    HomeBodyPage(),
    NotiPage(),
    UserPage(),
    MessPage()
  ];
  int _selectedItem = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedItem = index;
    });
  }

  double widthIcon = 25;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedItem],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: kmainColor,
        unselectedItemColor: Colors.grey,
        // backgroundColor: kmainColor,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        items: [
          BottomNavigationBarItem(
              icon: _selectedItem == 0
                  ? Image.asset(
                      'lib/assets/icons/home.png',
                      width: widthIcon,
                      color: kmainColor,
                    )
                  : Image.asset(
                      'lib/assets/icons/home.png',
                      width: widthIcon,
                      color: Colors.grey,
                    ),
              label: 'Trang chủ'),
          BottomNavigationBarItem(
              icon: _selectedItem == 1
                  ? Image.asset(
                      'lib/assets/icons/bell.png',
                      width: widthIcon,
                      color: kmainColor,
                    )
                  : Image.asset(
                      'lib/assets/icons/bell.png',
                      width: widthIcon,
                      color: Colors.grey,
                    ),
              label: 'Thông báo'),
          BottomNavigationBarItem(
              icon: _selectedItem == 2
                  ? Image.asset(
                      'lib/assets/icons/message.png',
                      width: widthIcon,
                      color: kmainColor,
                    )
                  : Image.asset(
                      'lib/assets/icons/message.png',
                      width: widthIcon,
                      color: Colors.grey,
                    ),
              label: 'Chat'),
          BottomNavigationBarItem(
              icon: _selectedItem == 3
                  ? Image.asset(
                      'lib/assets/icons/user.png',
                      width: widthIcon,
                      color: kmainColor,
                    )
                  : Image.asset(
                      'lib/assets/icons/user.png',
                      width: widthIcon,
                      color: Colors.grey,
                    ),
              label: 'Tôi'),
        ],
        currentIndex: _selectedItem,
        onTap: _onItemTapped,
      ),
    );
  }
}
