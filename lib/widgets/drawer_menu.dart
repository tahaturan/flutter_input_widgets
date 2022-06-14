import 'package:flutter/material.dart';

class DrawerMenu extends StatefulWidget {
  DrawerMenu({Key? key}) : super(key: key);

  @override
  State<DrawerMenu> createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
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
    );
  }
}
