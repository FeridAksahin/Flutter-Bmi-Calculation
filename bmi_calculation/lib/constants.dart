import 'package:flutter/material.dart';
/*
bazı değişkenleri k başına yazarak k yani constant olduğunu belli edicez. c birçok yerde kullanıyoruz
 karışabilir o yüzden k kullandık. https://dart.dev/guides/language/effective-dart/style#dont-use-prefix-letters
 bu değişkenleri daha önce kullandık değiştirmek istediklerimizi sağ tık refactor rename diyip ismi yazıp
 refactor dediğimizde nerede kullanılıyorsa güncellediğimiz ismiyle değişir hepsi
 const bottomContainerHeight = 80.0;
flutter daha önce k olarak tanımlamıştır bazı şeyleri textleri text stylerı vb
mesela
k yazdığımızda çıkar
bunlar constant demek. Bizde kendi cons değişkenlerimizi k olarak değiştirdik isimlerini*/
const kBottomContainerHeight = 80.0;
const kActiveCardColour = Color(0xFF1D1E33);
const kBottomContainerColour=Color(0xFFEB1555);
const kInactiveCardColour = Color(0xFF111328);

const kLabelTextStyle = TextStyle(fontSize: 18.0, color: Color(0xFF8D8E98));

const kNumberTextStyle = TextStyle(fontSize: 50,fontWeight: FontWeight.w900);

//bütün constantları buraya taşıdık tek bir yerde topladık daha düzenli olsun diye. Bütün dosyalardan
//bunlarıı şimdi kullanmak için bu dosyayı import edicez

const kLargeButtonTextStyle = TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold,);

const kTitleTextStyle = TextStyle(fontWeight: FontWeight.bold, fontSize: 50.0,);

const kresultTextStyle = TextStyle(color: Color(0xFF24D876), fontSize: 22.0, fontWeight: FontWeight.bold);

const kBMITextStyle = TextStyle(fontSize: 100.0, fontWeight: FontWeight.bold);

const kBodyTextStyle = TextStyle(fontSize: 22.0);