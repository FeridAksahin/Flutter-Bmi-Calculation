import 'package:flutter/material.dart';
import 'constants.dart';
//const labelTextStyle = TextStyle(fontSize: 18.0, color: Color(0xFF8D8E98)); constants dosyasına taşıyoruz
//constantları


class IconContent extends StatelessWidget {

  IconContent({@required this.icon, @required this.text}); //constructor'Imız
  final IconData icon;
  final String text;


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 80.0,
        ), //constructor inputımız
        SizedBox(
          height: 15.0,
        ),
        Text(text, style: kLabelTextStyle,
        ),],
    );
  }
}