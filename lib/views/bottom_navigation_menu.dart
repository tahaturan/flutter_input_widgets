import 'package:flutter/material.dart';

class BottomNavMenu extends StatefulWidget {
  final Function secilenMenuItem;
  const BottomNavMenu({required this.secilenMenuItem, Key? key})
      : super(key: key);

  @override
  State<BottomNavMenu> createState() => _BottomNavMenuState();
}

class _BottomNavMenuState extends State<BottomNavMenu> {
  int secilenMenuItem = 0;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: secilenMenuItem,
      onTap: (int index) {
        setState(() {
          secilenMenuItem = index;
          widget.secilenMenuItem(secilenMenuItem);
        });
      },
      items: const [
        BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
            backgroundColor: Colors.blue),
        BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Search",
            backgroundColor: Colors.red),
        BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: "Info",
            backgroundColor: Colors.green),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: "Profile",
          backgroundColor: Colors.indigo,
          activeIcon: Icon(Icons.edit),
        )
      ],
      backgroundColor: Colors.blue,
      unselectedItemColor: Colors.white,
      selectedItemColor: Colors.greenAccent,
      selectedFontSize: 15,
      showUnselectedLabels: false,
      type: BottomNavigationBarType.shifting,
    );
  }
}
