import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusable_card.dart';
import 'constants.dart';
import 'results_page.dart';
import 'bottom_button.dart';
import 'round_icon_button.dart ';
import 'calculating_brain.dart';

/*
const bottomContainerHeight = 80.0;
const activeCardColour = Color(0xFF1D1E33);
const bottomContainerColour=Color(0xFFEB1555);
const inactiveCardColour = Color(0xFF111328);
constants dart dosyasına taşıyoruz
*/
enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height =
  180; //bu property final ya da cons olmaz çünkü hep değişicek. Slider widgetımızda kullanıcaz
  int weight = 75;
  int age = 23;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    //reusable card dosyamızda gesture detectoru return der orada fonksiyon açtık
                    //onu kullanarak setState fonksiyonumuzu yazdık
                    onPress: () {
                      setState(() {
                        //setState fonkisyonunu açtığımız onPress fonksiyon tipinde değişkenimize eşitledik burada
                        selectedGender = Gender.male;
                      });
                    }, //aynı işlemi female içinde yaptık
                    /*
                   şuan bu kod oldu yani kalabalık olmadı böyle yaparak
                       GestureDetector(
                    onTap: (){
                      setState(() {
                        selectedGender = Gender.female;
                      }); } ,
                     */
                    colour: selectedGender == Gender.male
                        ? kActiveCardColour
                        : kInactiveCardColour, // maleCardColour, ternary operatorle yapıcaz
                    cardChild: //custom widget
                    IconContent(icon: FontAwesomeIcons.mars, text: 'MALE'),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        //
                        selectedGender = Gender.female;
                      });
                    },
                    colour: selectedGender == Gender.female
                        ? kActiveCardColour
                        : kInactiveCardColour,
                    cardChild: IconContent(
                        icon: FontAwesomeIcons.venus, text: 'FEMALE'),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              colour: kActiveCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment
                    .center, // aşağıdaki widgetlarımızı ortaladık columnumuzun içinde
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    //ctrl+q basıldığında rowun üstüne gidip classın propertyeslerini görebiliriz.
                    mainAxisAlignment: MainAxisAlignment
                        .center, // column yani sütun için yukarıda ortaladık
                    //bu ise satır için ortaladı aşağıdaki widgetları
                    crossAxisAlignment: CrossAxisAlignment
                        .baseline, //yazıları hizalar. https://flutter.dev/docs/codelabs/layout-basics
                    textBaseline: TextBaseline.alphabetic,
                    //crossaxis baselinenını yazdıktan sonra textBaseline property zorunludur girilmese hata verir.
                    //baseline kodundan önce cm yazısı 180'Nin sağ ortasındaydı baseline kodunu yazdıktan sonra
                    //sağ altına geçti hizalandı
                    children: <Widget>[
                      Text(
                          height
                              .toString() /*classımızın propertyesi int olduğundan tip dönüştürme yaptık
                    çünkü text widget string kabul eder
                    .*/
                          ,
                          style: kNumberTextStyle),
                      Text(
                        'cm',
                        style: kLabelTextStyle,
                      ),
                    ],
                  ),
                  /*
                 Text('HEIGHT', style: kLabelTextStyle,), kod şöyle iken card widgetımızın boyutları
                 resized oldu yani boyutu bozuldu. Bunun sebebi containerımızda children yoktu oysa şimdi
                 cardChild yazdığımızda childrenı oldu. Children olunca ona göre sizeları ayarladı.
                 Bunu düzeltmek için ise en yukardaki columna  crossAxisAlignment: CrossAxisAlignment.stretch,
                 yazdık dolayısıyla bütün childrenlar columnları streçlendi en sağa sola doğru. Columnun
                 childı olmasının bi önemi kalmadı artık hepsi streçlendi
                 */
                  //https://api.flutter.dev/flutter/material/Slider-class.html
                  //slider widgetında bütün kullandığımız property'eslere bakılabilir bu linkten
                  SliderTheme(
                    // Slider widgetına wrap widgettan widget ekledik slider theme widgetını.
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors
                          .white, //active color yani kaydırıcının solundaki yer
                      inactiveTrackColor:
                      Color(0xFF8D8E98), //kaydırıcının sağındaki renk
                      overlayColor: Color(0X29EB1555),
                      /*
                    overlayColora biraz şeffaflık vermek istiyoruz. Bu property daireye tıklandığında
                    etrafında yeni bir daire olan dairenin colorudur. Biraz daha şeffaflık vermek istiyoruz.
                    Bunun için Color(0XFFEB1555)
                    0 dan sonra gelen Ox'ten sonra gelen ilk iki karakter alpha ya da transparency sayısıdır
                    yani şeffaflık transparency opaklık ise alpha'dır.
                    daha sonra gelen 2 karakter ise red oranı sonraki iki blue sonraki iki ise green oranıdır
                    transparenty i ayarlamak istiyoruz. Default transparenty'i şöyle bulduk
                    SliderTheme kısmına gittik ctrl+sol tık daha sonra SlidertTheme classı geldi
                    ctrl+f ten overlayColor property'esine gittik.
                    overlayColor: primaryColor.withAlpha(overlayAlpha)
                    kodunu bulduk
                    overlayAlpha arattık bu sefer orada opacity sayılıranı gördük. oradan 0x29 olarak aldık ayarı
                    şimdi şeffaflaştı
                     */
                      thumbColor: Color(0XFFEB1555), //dairenin rengi
                      thumbShape: RoundSliderThumbShape(
                          enabledThumbRadius: 15.0), //büyüklüğü dairenin
                      overlayShape: RoundSliderOverlayShape(
                          overlayRadius:
                          30.0), //ikinci dairenin büyüklüğü ilk daireye tıklandığında
                      //2. çıkan
                    ),
                    /*
                  SliderThemeData çağırınca birsürü propertyes geliyo birlikte. Bunların hepsini ayarlamak zorundaydık fakat
                  biz hepsini ayarlamak istemiyoruz bu yüzden SliderTheme. dedğimizde of çıkıyor ctrl+q dediğimizde ise
                  Returns the data from the closest SliderTheme instance that encloses the given context.
Defaults to the ambient ThemeData.sliderTheme if there is no SliderTheme in the given build context. yazar.
 Buradan sonra SliderTheme.of(context).copyWith(), yazdığımızda SliderThemeData daki her özelliği değil
 istediğimiz özellikleri değiştirebiliriz artık
                   */
                    child: Slider(
                      value: height
                          .toDouble(), //value olarak classımızın propertyesini girdik double
                      //kabul eder valuede slider widget o yüzden tip dönüştürme yaptık. height 180 verdik
                      //property es kısmında classın bu bizim başlangıç değerimiz.
                      min: 10.0, //slider widgetın min ve max değerlerini girdik
                      max: 300.0,
                      //     activeColor: Colors.white, //active color yani kaydırıcının solundaki yer
                      // bunu slidertheme widgetına taşıyoruz çünkü dairenin rengi girildiğinde olmuyor çünkü active color widgetı oradada var
                      //  inactiveColor: Color(0xFF8D8E98),//kaydırıcının sağındaki renk - slidertheme widgetında var bu özellik orada yaptık
                      //slider widget şuan sarı kutu olarak gözüküyor üzerini gittiğimizde ya da sağda sarı tireden
                      //gittiğimizde onChanged required diyor. Widgetlar bir classtır. Slider widgetı aslında
                      //slider classının constructorıdır. orada yazarken  @required onChanged olarak yazmışlar yani
                      //onChanged girmeliyiz yani
                      onChanged: (double newValue) {
                        // kısaca o kaydırıcı oluyor bu.
                        setState(() {
                          //setState metoduna yazarızki anında değişsin uygulama açıkken olacaklar.
                          // Kaydırınca gözüksün direk diye

                          height = newValue.round();
                          /*
                          height integer, newValue double hata verir. .round dedik yani en yakın
                          int değerine yuvarlar. Böylece tip dönüştürmede olur
                           */
                        });
                      }, //yazarken onChanged yanında double -> void yazar bu şu demek double metodu
                      // return olarak void döndürür demek
                    ),
                  ),
                ],
              ),
            ), //sadece colour required diğer inputlar değil
            //yani sadece colour inputını girmek zorunlu
          ),
          Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      colour: kActiveCardColour,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'WEİGHT',
                            style: kLabelTextStyle,
                          ),
                          Text(
                            weight.toString(),
                            style: kNumberTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(
                                //constructorımız
                                icon: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                              ),
                              /*
                            flutter açık kaynaktır. Bütün widgetların vb kodlarını görebiliriz. Değiştirebiliriz.
                            FloatingActionButton ctrl+sol tık
                            çıkan dosyadaki bütün kodlar FloatingActionButton widgetının kodlarıdır.
                            Flutter widgetları yerine mesela slider widgetını istemiyoruz flutterdaki
                            başkalarının yaptıgı slider paketlerine bakabiliriz
                            https://pub.dev/flutter/packages?q=slider
                            flutter widgetı değil mesela başka birşey yapmak istiyoruz kendi widgetımızı
                            yazabiliriz ya da paketlere bakabiliriz ya da olan widgetı açık kaynaklarından
                            değiştirebiliriz.

                             */
                              SizedBox(
                                width: 10,
                              ),
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      colour: kActiveCardColour,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('AGE', style: kLabelTextStyle),
                          Text(age.toString(), style: kNumberTextStyle),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(
                                  icon: FontAwesomeIcons.minus,
                                  onPressed: () {
                                    setState(() {
                                      age--;
                                    });
                                  }),
                              SizedBox(width: 10.0),
                              RoundIconButton(
                                  icon: FontAwesomeIcons.plus,
                                  onPressed: () {
                                    setState(() {
                                      age++;
                                    });
                                  }),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )),
          BottomButton(
            //constructorımız
            buttonTitle: 'CALCULATE',
            onTap: () {

              CalculatorBrain calc = CalculatorBrain(height: height, weight: weight); //input olarak constrotorımıza
              //bu classtaki height ve weight değişkenlerini girdik.



              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ResultsPage( //constroctorımız
                    bmiResult: calc.calculateBMI(),//inputlarını calc yani CalculatorBrain sınıfından aldığımız nesne ile
                    //calculatorBrain sınıfındaki metotları çağırdık
                    resultText: calc.getResult(),
                    interpretation: calc.getInterpretation(),
                  )));
            },
          ),
        ],
      ),
    );
  }
}

class BottomButton extends StatelessWidget {
  BottomButton({@required this.onTap, @required this.buttonTitle});
  final Function onTap;
  final String buttonTitle;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      //widget treeden extract widget ile BottomButton yazdık böylece bu butonun kodlarını
      //BottomButton classı içine aldı
      onTap: onTap,
      /* () { //sadece 2 ekran arasında geçiş olcağından named route'a gerek yok o yüzden normal Navigator.push kullandık
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return ResultsPage(); //sayfa geçişi yapmak istediğimiz sayfanın classının ismini yazarız buraya
        }, burayı constructordan yazıcaz*/
      //return yerine şöylede yazabiliriz
      //  Navigator.push(context, MaterialPageRoute(builder: (context) => ResultsPage()));
      /*main.dart ta temayı define olarak
     theme: ThemeData.dark().copyWith(
      primaryColor: Color(0xFF0A0E21),
      scaffoldBackgroundColor: Color(0xFF0A0E21),    ),
      yazdığımızdan açılan görüldüğü gibi results pagete bunları ayarlamadık ama yinede tema rengi mainde yazdığımız gibi oluyor
      results page ekranında  çünkü mainde MaterialApp'in içinde theme:  propertyesine yazarak fabrika ayarı gibi yaptık. Uygulama mainden
     uygulamalar mainden başlar. görüldüğü gibi mainde MaterialApp'i return eder ilk içinde ise theme bilgileri var yani theme: property
     esine ne yazdıysak app mainden başlatıldığından otomatik oradaki tema özellikleri olucak
      */
      child: Container(
        child: Center(
            child: Text(
              buttonTitle,
              style: kLargeButtonTextStyle,
            )),
        color: kBottomContainerColour,
        margin: EdgeInsets.only(top: 10.0),
        padding: EdgeInsets.only(bottom: 20.0),
        width: double.infinity,
        height: kBottomContainerHeight, //const değişkenimiz
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  //kendi floating action buton versiyonumuz ismini RoundIconButton verdik
  RoundIconButton({@required this.icon, @required this.onPressed});
  final IconData icon;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    //https://api.flutter.dev/flutter/material/RawMaterialButton-class.html
    return RawMaterialButton(
      //RawMaterialButton widgetını aldık
      // bazılarını değiştircez
      child: Icon(icon),
      onPressed:
      onPressed, //düğmeye basıldığında. değişkenimizi girdik değer olarak constructordan alıcaz
      // elevation: 0.0, //https://api.flutter.dev/flutter/material/RawMaterialButton/elevation.html
      //elevation yani butonun etrafındaki gölge 6 pixellik ekledik
      //elevation disabledelevetion propertyesini kullanmamız lazım çünkü elevation properrtyesinde
      //elevation aktif fakat basılmamış durumda iken disable yerine direk onPress propertyesini kullanarak
      //yaptık böylece hem elevation aktif hemde basıldığında olur. elevation istemediğimizde 0 yaptık
      shape:
      CircleBorder(), //https://api.flutter.dev/flutter/painting/ShapeBorder-class.html
      //kendi istediğimiz şekilde ayarlayabiliriz. Mesela RawMaterialButton propertysi olan shape'i
      //RoundedRectangleBorder widgetını kullanarak şöyle yapabiliriz
      //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0),),
      //şeklinde böylece köşeleri dik olmayan dikdörtgen şeklinde olur butonlarımız vb
      fillColor: Color(0xFF4C4F5E),
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      /*
        size özelliği yazmadık ve şuan küçük olarak geliyor buton. FloatingActionButton widgetını araştırıp
        size özelliğini bulmaktansa direk FloatingActionButton dosyasına gidip ctrl+sol tık ile oradan
        RawMaterialButton widgetını bulup
        şu tarz olarak yazılmıştır görüldüğü gibi
        Widget result = RawMaterialButton(
      onPressed: onPressed,
      mouseCursor: mouseCursor,
      elevation: elevation,
      focusElevation: focusElevation,
      hoverElevation: hoverElevation,
      highlightElevation: highlightElevation,
      disabledElevation: disabledElevation,
      constraints: _sizeConstraints,
      materialTapTargetSize: materialTapTargetSize,
      fillColor: backgroundColor,
      focusColor: focusColor,
      hoverColor: hoverColor,
      splashColor: splashColor,
      textStyle: textStyle,
      shape: shape,
      clipBehavior: clipBehavior,
      focusNode: focusNode,
      autofocus: autofocus,
      child: child,
    );
    widgetın bütün propertyesleri mevcut buradan görüldüğü gibi _sizeConstraints özelliği yani size özelliği
    var. _sizeConstraints kopyalayıp dosyada aramaya yazıyoruz. görüldüğü gibi
     _sizeConstraints = mini ? _kMiniSizeConstraints : _kSizeConstraints, kodu var yani bir constanta atanmış
     ternary operator ile. _kSizeConstraints gelip ctrl+sol tık diyoruz. görüldüğü gibi
     BoxConstraints.tightFor(
  width: 56.0,
  height: 56.0,
); kodunu aldık. şimdi constraints: _sizeConstraints, kısmındaki constraints propertyesimizi yazalım
         */
      //böylece FloatingActionButton(backgroundColor: Color(0xFF4C4F5E) kodu yerine direk bu butonumuzu çağırdık
    );
    /*
      RawMaterialButton widgetı FloatingActionButton widgetının içindedir. FloatingActionButton
      widgetına ctrl+sol tık ile dosyasına gittiğimizde, dosyanın içinde RawMaterialButton widgetını göre
      biliriz.
       */
  }
}

/*
kendi widgetımızı yazabiliriz. Custom widget olarak. Farklı flutter widgetlarıyla kombine edebiliriz.
Şuana kadar böyle yaptık. Ya da flutterın hazırladığı material components widgetlarına bakabiliriz
https://flutter.dev/docs/development/ui/widgets/material
mesela buradan alertdialog widgetını aldık daha sonra themeData sınıfını kullanarak
https://api.flutter.dev/flutter/material/ThemeData-class.html#constructors
constructorlarda gözüktüğü gibi constructorlarda mesela dialogtheme var themedata constructorında dialog
theme inputını kullanarak değiştirebiliriz. Bunun gibi constructorda bir sürü özellik var. color, textTheme
vbvb sadece alertdialog widgetıda değil. https://flutter.dev/docs/development/ui/widgets/material
linkindeki tüm widgetlarda theme data classını kullanabiliriz.
 */
