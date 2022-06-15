import 'dart:ffi';

import 'package:flutter/material.dart';

class PageViewKullanimi extends StatefulWidget {
  const PageViewKullanimi({Key? key}) : super(key: key);

  @override
  State<PageViewKullanimi> createState() => _PageViewKullanimiState();
}

class _PageViewKullanimiState extends State<PageViewKullanimi> {
  var myController = PageController(
    initialPage: 0,
    keepPage: true,
    viewportFraction: 1,
  );
  bool yatayEksen = false;
  bool pageSnapping = true;
  bool reverseSira = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PageView Kullanimi'),
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: myController,
              scrollDirection:
                  yatayEksen == true ? Axis.horizontal : Axis.vertical,
              reverse: reverseSira,
              pageSnapping: pageSnapping,
              onPageChanged: (index) {
                debugPrint("page change gelen index $index");
              },
              children: [
                Container(
                  width: double.infinity, //*butun ekrana yayilsin
                  height: 300,
                  color: Colors.indigo.shade300,
                  child: const Center(
                    child: Text(
                      "Sayfa0",
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                ),
                Container(
                  width: double.infinity, //*butun ekrana yayilsin
                  height: 300,
                  color: Colors.blue.shade300,
                  child: const Center(
                    child: Text(
                      "Sayfa1",
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                ),
                Container(
                  width: double.infinity, //*butun ekrana yayilsin
                  height: 300,
                  color: Colors.teal.shade300,
                  child: const Center(
                    child: Text(
                      "Sayfa2",
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              height: 200,
              color: Colors.blueGrey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        const Text("Yatay eksende calis"),
                        Checkbox(
                          value: yatayEksen,
                          onChanged: (gelenDeger) {
                            setState(() {
                              yatayEksen = gelenDeger!;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        const Text("Page Snapping"),
                        Checkbox(
                          value: pageSnapping,
                          onChanged: (gelenDeger) {
                            setState(() {
                              pageSnapping = gelenDeger!;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        const Text("Tersten Sirala"),
                        Checkbox(
                          value: reverseSira,
                          onChanged: (gelenDeger) {
                            setState(() {
                              reverseSira = gelenDeger!;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
