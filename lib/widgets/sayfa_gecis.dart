import 'package:flutter/material.dart';

class SayfaGecisButton extends StatefulWidget {
  String buttonAdi;
  Widget sayfa;
  SayfaGecisButton({required this.buttonAdi, required this.sayfa, Key? key})
      : super(key: key);

  @override
  State<SayfaGecisButton> createState() => _SayfaGecisButtonState();
}

class _SayfaGecisButtonState extends State<SayfaGecisButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => widget.sayfa),
        );
      },
      child: Text(
        widget.buttonAdi,
      ),
    );
  }
}
