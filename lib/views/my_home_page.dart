import 'package:flutter/material.dart';
import 'package:flutter_input_widgets/views/textfield_islemleri.dart';
import 'package:flutter_input_widgets/widgets/sayfa_gecis.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('AnaSayfa'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SayfaGecisButton(
                  buttonAdi: "TextField Islemleri",
                  sayfa: TextFieldIslemleri()),
            ],
          ),
        ));
  }
}
