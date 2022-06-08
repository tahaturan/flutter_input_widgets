import 'package:flutter/material.dart';

class SayacWidget extends StatefulWidget {
  SayacWidget({Key? key}) : super(key: key);

  @override
  State<SayacWidget> createState() => SayacWidgetState();
}

class SayacWidgetState extends State<SayacWidget> {
  int _sayac = 0;
  void arttir() {
    setState(() {
      _sayac++;
    });
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("Sayac Widget icindeki Build Tetiklendi");
    return Text(
      _sayac.toString(),
      style: Theme.of(context).textTheme.headline2,
    );
  }
}
