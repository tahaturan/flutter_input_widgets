import 'package:flutter/material.dart';
import 'package:flutter_input_widgets/screen/page_one.dart';
import 'package:flutter_input_widgets/screen/page_three.dart';
import 'package:flutter_input_widgets/screen/page_two.dart';
import 'package:flutter_input_widgets/views/bottom_navigation_menu.dart';
import 'package:flutter_input_widgets/widgets/home_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int secilenMenuItem = 0;
  static const List<Widget> pageList = [
    HomePage(),
    PageTwo(),
    PageThree(),
    PageFour(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AnaSayfa'),
      ),
      body: pageList.elementAt(secilenMenuItem),
      bottomNavigationBar: BottomNavMenu(secilenMenuItem: (int gelenDeger) {
        secilenMenuItem = gelenDeger;
      }),
    );
  }
}
