import 'package:flutter/material.dart';
import 'package:flutter_input_widgets/sayac_state.dart';

class GlobalKeyKullanimi extends StatefulWidget {
  GlobalKeyKullanimi({Key? key}) : super(key: key);

  @override
  State<GlobalKeyKullanimi> createState() => _GlobalKeyKullanimiState();
}

class _GlobalKeyKullanimiState extends State<GlobalKeyKullanimi> {
  final sayacWidgetKey = GlobalKey<SayacWidgetState>();
  //*global key disaridan widgetlara ulasmak icin bir nevi id degeri veriyor
  //*artik bu key sayesinde sayac sinifimizin state ine yani icerigine erisebilecegiz
  @override
  Widget build(BuildContext context) {
    debugPrint("Anasayfa Build Tetiklendi");
    return Scaffold(
      appBar: AppBar(
        title: const Text('Global Key Kullanimi'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text("Butona Basilma Miktari"),
            SayacWidget(key: sayacWidgetKey),
            //*olusturudugmuz keyin hangi wigdet da kullanilacagini belittik
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          sayacWidgetKey.currentState!.arttir();
          //*buradan da sayac sinifimizin icindeki fonksiyona eristik
          //* surekli olarak tum scaffold da buildi tetiklemektense sadece bir nokta tetiklensin dedik uygulama daha performasli hale geldi
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
