import 'dart:math';

class CalculatorBrain {

  CalculatorBrain({this.height, this.weight});

  final int height;
  final int weight;

  double _bmi;
  /*
  private değişken yazdık. Çünkü önceden bmi değişkeni double bmi; olarak calculateBMI metodunda
   tanımlanmıştı sadece ve getResulttada kullanılması lazımdı fakat bmi değişkeni sadece tanımlandığı
   metot içinde kullanılabilirdi {} içinde dolayısıyla getResultta kullanıldığında hata veriyodu çünkü orada bmi
   değişkeni tanımlı değil. Oysa şimdi private olarak kurduk class içinde böylece bu classta her
   yerde erişilebilir.
   */

  String calculateBMI() {
    _bmi = weight / pow(height/100, 2);
    return _bmi.toStringAsFixed(1); //bmi değişkenini stringe çevirdik.
    //toStringAsFixed(1) yani virgülden sonra 1 tane sayı olsun dedik
  }

  String getResult (){
    if (_bmi >= 25){
      return 'Overweight';
    } else if (_bmi > 18.5){
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getInterpretation (){
    if (_bmi >= 25){
      return 'You have a higher than normal body weight. Try to exercise more.';
    } else if (_bmi > 18.5){
      return 'You have a normal body weight.';
    } else {
      return 'You have a lower than normal body weight. You can eat a bit more.';
    }
  }

}