import 'package:flutter/material.dart';
import 'package:flutter_input_widgets/widgets/sayfa_gecis.dart';

import '../views/drawer_kullanimi.dart';
import '../views/global_key_kullanimi.dart';
import '../views/stepper_kullanimi.dart';
import '../views/text_form_field_kullanimi.dart';
import '../views/textfield_islemleri.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SayfaGecisButton(
              buttonAdi: "TextField Islemleri", sayfa: TextFieldIslemleri()),
          SayfaGecisButton(
              buttonAdi: "TextFormField", sayfa: TextFormFieldKullanimi()),
          SayfaGecisButton(
              buttonAdi: "Global Key Kullanimi", sayfa: GlobalKeyKullanimi()),
          SayfaGecisButton(
              buttonAdi: "Stepper Kullanimi", sayfa: StepperKullanimi()),
          SayfaGecisButton(
              buttonAdi: "Drawer Kullanimi", sayfa: const DrawerKullanimi()),
        ],
      ),
    );
  }
}
