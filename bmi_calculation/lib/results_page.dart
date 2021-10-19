import 'package:bmi_calculator/input_page.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'reusable_card.dart'; //ReusableCard widgetı kullanmak için import ettik
class ResultsPage extends StatelessWidget {

  ResultsPage({@required this.interpretation, @required this. bmiResult, @required this.resultText});
  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly, //spaceEvenly ctrl+q basıp ne oldugu görülebilir
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(child: Container(
            padding: EdgeInsets.all(15.0),
            alignment: Alignment.bottomLeft,
            child: Text('Your Result',
              style: kTitleTextStyle,
            ),
          )),
          Expanded(flex: 5, child: ReusableCard ( //flex default olarak 1 dir expandedda değiştirilmezse
            colour: kActiveCardColour,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(resultText.toUpperCase(), style: kresultTextStyle,),
                Text(bmiResult,style: kBMITextStyle,),
                Text(interpretation, style: kBodyTextStyle, textAlign: TextAlign.center,),
                //textler sola doğruydu default olarak textAlign solaydı textleri ortaladık align kodu ile

              ],
            ),
          ),),
          BottomButton(onTap: () {Navigator.pop(context);}, buttonTitle: 'RE-CALCULATE'),
        ],
      ),
    );
  }
}
