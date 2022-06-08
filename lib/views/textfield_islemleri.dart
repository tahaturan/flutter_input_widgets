import 'package:flutter/material.dart';

class TextFieldIslemleri extends StatefulWidget {
  TextFieldIslemleri({Key? key}) : super(key: key);

  @override
  State<TextFieldIslemleri> createState() => _TextFieldIslemleriState();
}

class _TextFieldIslemleriState extends State<TextFieldIslemleri> {
  late TextEditingController _kullaniciAdiKontrol;
  late FocusNode _focusNode;
  late int maxLineCount = 1;
  @override
  void initState() {
    //*ekrana yazilmadan once calsitirilan yapidir genelde atamalari initState icinde yapariz
    super.initState();
    _kullaniciAdiKontrol = TextEditingController(text: "Kullanici Adi");
    _focusNode = FocusNode();
    _focusNode.addListener(() {
      //*yapilan degisikleri Dinler
      setState(() {
        if (_focusNode.hasFocus) {
          //*eger odak ondaysa
          maxLineCount = 3; //*satirsaysini 3 e cikar
        } else {
          maxLineCount = 1; //*degilse 1 indir
        }
      });
    });
    //*ilk atanan deger
  }

  @override
  void dispose() {
    _kullaniciAdiKontrol.dispose();
    _focusNode.dispose();
    super.dispose();
    //*burda da ise yok etme islemi yoksa bellekte kalir ve gereksiz yer kaplar
  }

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
              focusNode: _focusNode,
              controller: _kullaniciAdiKontrol,
              keyboardType: TextInputType.number, //*Klavye Stilimizi Belirler
              textInputAction: TextInputAction.done,
              //*kalvye acildiginda ilerimi yoksa okeylemisin felan onlari degistiyor
              autofocus: true,
              //* sayfa acildiginda ilk olarak burasi acilacaktir islem girmesi icin
              maxLines:
                  maxLineCount, //* 1 satirlik veri girilmesi icin yer olusturur
              maxLength: 50, //* maximum karakter sayisini belirleriz
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
          Text(_kullaniciAdiKontrol.text),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _kullaniciAdiKontrol.text = "Buttondan Gelen Hazir Veri";
          });
        },
        child: const Icon(Icons.edit),
      ),
    );
  }
}
