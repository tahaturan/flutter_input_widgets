import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_input_widgets/widgets/drawer_menu.dart';

class DrawerKullanimi extends StatefulWidget {
  const DrawerKullanimi({Key? key}) : super(key: key);

  @override
  State<DrawerKullanimi> createState() => _DrawerKullanimiState();
}

class _DrawerKullanimiState extends State<DrawerKullanimi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Drawer Kullanimi'),
      ),
      drawer: DrawerMenu(),
      body: const Center(
        child: Text("Draver Kullanimi"),
      ),
    );
  }
}
