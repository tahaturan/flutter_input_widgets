import 'package:flutter/material.dart';
import 'package:flutter_input_widgets/screen/page_one.dart';
import 'package:flutter_input_widgets/screen/page_three.dart';
import 'package:flutter_input_widgets/screen/page_two.dart';
import 'package:flutter_input_widgets/widgets/home_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const List<Widget> pageList = [
    HomePage(),
    PageTwo(),
    PageThree(),
    PageFour(),
  ];
  int secilenMenuItem = 0;

  void _onItemTapped(int index) {
    setState(() {
      secilenMenuItem = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AnaSayfa'),
      ),
      body: pageList.elementAt(secilenMenuItem),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: secilenMenuItem,
        onTap: _onItemTapped,
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
              icon: Icon(Icons.add),
              label: "Add",
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
      ),
    );
  }
}
