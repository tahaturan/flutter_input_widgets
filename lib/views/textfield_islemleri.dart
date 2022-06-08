import 'package:flutter/material.dart';

class TextFieldIslemleri extends StatefulWidget {
  TextFieldIslemleri({Key? key}) : super(key: key);

  @override
  State<TextFieldIslemleri> createState() => _TextFieldIslemleriState();
}

class _TextFieldIslemleriState extends State<TextFieldIslemleri> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TextField Islemleri'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              keyboardType: TextInputType.number, //*Klavye Stilimizi Belirler
              textInputAction: TextInputAction.done,
              //*kalvye acildiginda ilerimi yoksa okeylemisin felan onlari degistiyor
              autofocus: true,
              //* sayfa acildiginda ilk olarak burasi acilacaktir islem girmesi icin
              maxLines: 1, //* 1 satirlik veri girilmesi icin yer olusturur
              maxLength: 20, //* maximum karakter sayisini belirleriz
              onChanged: (String deger) {
                //*burasi inputa girilen degeleri alir ve bize verir mesela arama islemlerinde felann kullabiliriz
                //! Basilan Her karakteri Alir
                debugPrint(deger);
              },
              onSubmitted: (String deger) {
                //*Burasi da yukarisi gibi fakat burasi her basilan karakteri degilde girilen deger onaylanirsa alir
                debugPrint("onaylanan deger $deger");
              },
              cursorColor: Colors.red, //* imlec Rengini Belirler
              decoration: const InputDecoration(
                labelText: "Label Text",
                hintText: "Kullanici Adini Giriniz",
                prefixIcon: Icon(Icons.add),
                suffixIcon: Icon(Icons.edit),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  gapPadding: 10,
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.edit),
      ),
    );
  }
}
