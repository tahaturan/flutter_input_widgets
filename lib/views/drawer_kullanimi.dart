import 'dart:ui';

import 'package:flutter/material.dart';

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
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              accountName: const Text("Taha Turan"),
              accountEmail: const Text("tahaaturann16@gmail.com"),
              currentAccountPicture: Image.network(
                  "https://avatars.githubusercontent.com/u/94213149?v=4"),
              otherAccountsPictures: [
                CircleAvatar(
                  backgroundColor: Colors.blueGrey.shade200,
                  child: const Text("T.T"),
                ),
                CircleAvatar(
                  backgroundColor: Colors.blueGrey.shade200,
                  child: const Text("S.T"),
                ),
              ],
            ),
            Expanded(
              child: ListView(
                children: [
                  const ListTile(
                    leading: Icon(Icons.home),
                    title: Text("AnaSayfa"),
                    trailing: Icon(Icons.arrow_forward_rounded),
                  ),
                  const ListTile(
                    leading: Icon(Icons.person),
                    title: Text("Profil"),
                    trailing: Icon(Icons.arrow_forward_rounded),
                  ),
                  InkWell(
                    onTap: () {},
                    splashColor: Colors.red,
                    child: const ListTile(
                      leading: Icon(Icons.explicit_outlined),
                      title: Text("Cikis"),
                      trailing: Icon(Icons.arrow_forward_rounded),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      body: const Center(
        child: Text("Draver Kullanimi"),
      ),
    );
  }
}
