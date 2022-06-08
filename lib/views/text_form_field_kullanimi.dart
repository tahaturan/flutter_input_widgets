import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

class TextFormFieldKullanimi extends StatefulWidget {
  TextFormFieldKullanimi({Key? key}) : super(key: key);

  @override
  State<TextFormFieldKullanimi> createState() => _TextFormFieldKullanimiState();
}

class _TextFormFieldKullanimiState extends State<TextFormFieldKullanimi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TextFormField'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            autovalidateMode: AutovalidateMode.always,
            child: Column(
              children: [
                TextFormField(
                  initialValue: "tahaturann", //*direk icinde yazili halde gelir
                  decoration: const InputDecoration(
                    labelText: "kullanici Adi",
                    hintText: "Kullanici Adi",
                    border: OutlineInputBorder(),
                    //errorStyle: TextStyle(color: Colors.green),
                  ),
                  validator: (String? deger) {
                    if (deger!.length < 4) {
                      return "Kullanici Adi en az 4 karakter olmali";
                    }
                    return null;
                    //* girdigimiz kullanici adi 4 karakterden kucukse bize bir hata mesaji verecek ama 4 karakterden buyukse bir hata mesaji vermeden devam edecek
                  },
                ),
                const SizedBox(height: 15),
                TextFormField(
                  initialValue: "tahaaturann@gmail.com",
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: "Email",
                    hintText: "Email",
                    border: OutlineInputBorder(),
                    //errorStyle: TextStyle(color: Colors.green),
                  ),
                  validator: (String? deger) {
                    if (EmailValidator.validate(deger!)) {
                      return "Gecerli mail Giriniz";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 15),
                TextFormField(
                  //initialValue: "tahaaturann@gmail.com",
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: "Sifre",
                    hintText: "Sifre",
                    border: OutlineInputBorder(),
                    //errorStyle: TextStyle(color: Colors.green),
                  ),
                  validator: (String? deger) {
                    if (deger!.length < 8) {
                      return "Sifre en az 8 karakter olmali";
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
