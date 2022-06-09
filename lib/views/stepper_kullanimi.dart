import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class StepperKullanimi extends StatefulWidget {
  StepperKullanimi({Key? key}) : super(key: key);

  @override
  State<StepperKullanimi> createState() => _StepperKullanimiState();
}

class _StepperKullanimiState extends State<StepperKullanimi> {
  int aktifStep = 0;
  //*ilk olarak aktif olacak stepi(adimin index degerini belirledik 0 verdik ilk olarak en bastaki acik olsun diye)
  String kullaniciAdi = "";
  String mail = "";
  String sifre = "";
  //*alacagimiz degerler oldugu icin bu degerlerimizi tutacak degiskenler olsuturduk
  late List<Step> tumSteplerListesi;
  //*Steplerimizi atayacagimiz bir liste olsuturduk
  //?---------------------------------------------
  var key0 = GlobalKey<FormFieldState>();
  var key1 = GlobalKey<FormFieldState>();
  var key2 = GlobalKey<FormFieldState>();
  //*Kontrolleri yapmak icin 3 adimimiz var ve biz onlarin index degelerine gore keyler olusturduk key0-key1-key2 seklinde
  //*boylelikle bu keylerden kontrolleimizi yapabilecegiz mesela hatali olan textformfield olursa diger adima gecmesin gibi
  //* <FormFieldState> dememizin sebebi de biz form yapisi olusutmadan textformfield lari olsuturdugumuz icin bu keyler icinde FormFieldState yapisi tutacak dedik
  bool hata = false;
  //* buarda bunu yapmamizin nedeni ise hata oldugu zaman iste iconlari felan degistirmek icin kullanicaz ternary if ile mesela

  @override
  Widget build(BuildContext context) {
    tumSteplerListesi = tumStepler();
    //*Stepleri listemize aktardik
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stepper Kullanimi'),
      ),
      body: SingleChildScrollView(
        child: Stepper(
          steps: tumSteplerListesi,
          //*steps kismida bizden icinde stepler olan bir liste istiyordu onada olsuturudugumuz listeyi atadik
          currentStep: aktifStep,
          //*ilk olarak aktif olacak stepin indexini istiyor bizde buna yukarida tanimladigimiz aktifstep indexini atadik
          // onStepTapped: (tiklanilanStep) {
          //   setState(() {
          //     aktifStep = tiklanilanStep;
          //    *burada ise tiklanilan stepin indexini aktifstep e atadik ve ekrani guncelledik
          //   });
          // },
          onStepContinue: () {
            if (aktifStep < tumSteplerListesi.length - 1) {
              //*burada kurdugumuz mantik aktifstep index degeriydi ya sonuc onu ilk olarak listenin uzunlugundan kucuk mu diye kontrol ettik indexlerde 0 dan basladiginda -1 i de ekeldik
              // setState(() {
              //   aktifStep++;
              // });
              setState(() {
                ileriButonKontrolu();
              });
            }
          },
          onStepCancel: () {
            if (aktifStep > 0) {
              setState(() {
                aktifStep--;
              });
            }
          },
        ),
      ),
    );
  }

  List<Step> tumStepler() {
    List<Step> stepler = [
      Step(
        title: const Text("Kullanici Adi"),
        subtitle: const Text("Alt Baslik"),
        state: stateleriAyarla(0),
        //*burada stepdurumlarini kontrol edebilecegimiz bir metod olusturduk ve icine index degerini girdik
        //*amacimiz da hata varsa durumu error yada tamamlandiysada tik isareti seklinde gostermesini isiyoruz
        isActive: true,
        content: TextFormField(
          key: key0, //* yukarida olsuturdugumuz key degerini atadik
          //*bu keyleri buraya verilen bir id degeri gibi dusunebiliriz biz key0 dedigimizde burayla ilgili islemeri yapicaz anlamina gelir
          decoration: const InputDecoration(
            prefixIcon: Icon(Icons.arrow_forward_sharp),
            suffixIcon: Icon(Icons.edit),
            labelText: "Kullanici Adi",
            hintText: "Kullanici Adiniz Giriniz",
          ),
          validator: (girilenDeger) {
            if (girilenDeger!.length < 8) {
              return "En az 8 karakter giriniz";
            }
            return null;
          },
          onSaved: (girilenDeger) {
            kullaniciAdi = girilenDeger!;
            //*burada da eger bi validator hatasi cikmazsa girilen degeri yukarida tanimladigimiz kullanici adi degiskenine ata diyoruz
          },
        ),
      ),
      Step(
        title: const Text("Mail"),
        subtitle: const Text("Alt Baslik"),
        state: stateleriAyarla(1),
        isActive: true,
        content: TextFormField(
          key: key1,
          keyboardType: TextInputType.emailAddress,
          decoration: const InputDecoration(
            prefixIcon: Icon(Icons.arrow_forward_sharp),
            suffixIcon: Icon(Icons.mail),
            labelText: "Mail",
            hintText: "Mail Adresinizi Giriniz",
          ),
          validator: (girilenDeger) {
            if (!EmailValidator.validate(girilenDeger!)) {
              return "Lutfen Gecerli Mail Adresi Giriniz";
            }
            return null;
          },
          onChanged: (girilenDeger) {
            mail = girilenDeger;
          },
        ),
      ),
      Step(
        title: const Text("Sifre"),
        subtitle: const Text("Alt Baslik"),
        state: stateleriAyarla(2),
        isActive: true,
        content: TextFormField(
          key: key2,
          obscureText: true,
          decoration: const InputDecoration(
            prefixIcon: Icon(Icons.arrow_forward_sharp),
            suffixIcon: Icon(Icons.password),
            labelText: "Sifre",
            hintText: "Sifrenizi Giriniz",
          ),
          validator: (girilenDeger) {
            if (girilenDeger!.length < 8) {
              return "Sifre En az 8 karakter olmalidir";
            }
            return null;
          },
          onSaved: (girilenDeger) {
            sifre = girilenDeger!;
          },
        ),
      ),
    ];

    return stepler;
  }

  StepState stateleriAyarla(int oankiStep) {
    //*metodumuz burada bize bir index degeri gelecek int seklinde
    if (aktifStep == oankiStep) {
      //*eger aciklan olan step bize gelen index degeriyle ayniysa burayda gir
      if (hata) {
        //* yukarida hata diye bool deger tanimlamistik ve gelen indexdeki textformfiel da hata varsa burayu dondur bize
        return StepState.error;
      } else {
        //*eger gelen indexe sahip textformfield da hata yoksada burayi dondur
        return StepState.editing;
      }
    } else {
      //*burada ise aktifstep bize gelene indexe esit degilse demekki orasi tamamlanmistir ve bu sekilde goster dedik
      return StepState.complete;
    }
  }

  void ileriButonKontrolu() {
    //*burada bir switch case yapisi kullandik ve aktifstep i kontrol ediyoruz
    switch (aktifStep) {
      case 0:
        //*aktifstep eger 0 sa yani kullanici daha ilk adimdaysa
        if (key0.currentState!.validate()) {
          //*biz ilk textformfield icin key0 i olustureumustuk ve orasi hatasiz bir sekilde geldiyse demek burasi
          key0.currentState!.save();
          //* artik onu kaydedebilirsin dedik Yani textformfiled lerin incinde onSaved metodunu calistir demistik oda verilerimizi yukaridaki ilk basta olsuturdugumuiz degiskenlere atiyordu
          hata = false;
          //*daha once bi hata olduysada artik bu satirdda hata yok demektir ve hatayi false olarak tekrar duzellik
          aktifStep++;
          //*en sonda da aktif step i arttirdik cunki kullaci hatasiz girdi butona basti ve artik ilerleyebilsin diye
        } else {
          //*eger hata varsada
          hata = true;
        }
        break;

      case 1:
        if (key1.currentState!.validate()) {
          key1.currentState!.save();
          hata = false;
          aktifStep++;
        } else {
          hata = true;
        }
        break;
      case 2:
        if (key2.currentState!.validate()) {
          key2.currentState!.save();
          hata = false;
          aktifStep++;
        } else {
          hata = true;
        }
        break;
    }
  }
}
