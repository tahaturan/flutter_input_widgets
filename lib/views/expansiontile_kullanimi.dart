import 'package:flutter/material.dart';

class ExpansionTileKullanimi extends StatelessWidget {
  const ExpansionTileKullanimi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 15,
      itemBuilder: (BuildContext context, int index) {
        return ExpansionTile(
          title: Text("Baslik ${index + 1}"),
          leading: CircleAvatar(child: Text("${index + 1}")),
          subtitle: const Text("Hakkinda"),
          backgroundColor:
              index % 2 == 0 ? Colors.cyan.shade300 : Colors.amber.shade200,
          controlAffinity: ListTileControlAffinity.platform,
          children: [
            Card(
              color:
                  index % 2 == 0 ? Colors.amber.shade200 : Colors.cyan.shade300,
              margin: const EdgeInsets.all(20),
              elevation: 15,
              child: ListTile(
                leading: const CircleAvatar(
                  child: Icon(Icons.arrow_forward_sharp),
                ),
                title: Text("isim ${index + 1}"),
                subtitle: Text("Mail: ${index + 1}@gmail.com"),
                trailing: const Icon(Icons.info_outline),
              ),
            )
          ],
        );
      },
      separatorBuilder: (context, index) {
        return const Divider(
          color: Colors.blueGrey,
          height: 2,
          thickness: 2,
          indent: 5,
          endIndent: 5,
        );
      },
    );
  }
}
