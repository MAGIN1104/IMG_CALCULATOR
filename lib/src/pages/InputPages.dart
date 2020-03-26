import 'package:bmi_calculator/src/Calcu/calculateResults.dart';
import 'package:bmi_calculator/src/Widgets/ButtomBottom.dart';
import 'package:bmi_calculator/src/Widgets/Card.dart';
import 'package:bmi_calculator/src/Widgets/ContenidoCard.dart';
import 'package:bmi_calculator/src/pages/ResultsPage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../constants.dart';


enum Gender{
  male,
  female
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

   class _InputPageState extends State<InputPage> {

  Gender selectedGerder;
  int height =150;
  int weight = 60;
  int age = 25;
  // Color maleCardColor=inactiveCardtColor;
  // Color femaleCardColor=inactiveCardtColor;

  // void updateColor(Gender selectedGender){       // nos permite actualizar el color de los botones 
  //   if(selectedGender == Gender.male){                  //masculino male
  //     if(maleCardColor == inactiveCardtColor){
  //       maleCardColor = activeCardColour;
  //       femaleCardColor=inactiveCardtColor;
  //     }else{
  //       maleCardColor =inactiveCardtColor;
  //     }
  //   }else if(selectedGender == Gender.female){              //femeniino female
  //     if(femaleCardColor == inactiveCardtColor){
  //       femaleCardColor=activeCardColour;
  //       maleCardColor=inactiveCardtColor;
  //     }else{
  //       femaleCardColor=inactiveCardtColor;
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch ,
        children: <Widget>[
          Expanded(child: Row(
            children: <Widget>[
              // Botton cards male and female 
              Expanded(
                child: ReusableCard(
                  onPress: (){
                    setState(() {
                      selectedGerder=Gender.male;
                    });
                  },
                  colour: selectedGerder==Gender.male 
                                          ? kActiveCardColour 
                                          : kInactiveCardtColor, 
                  cardChild: ContenidoCard(
                      iconos: FontAwesomeIcons.mars,
                      titulos: 'MALE',

                  ),
                  )),
              Expanded(
                child: ReusableCard(
                onPress: (){
                  setState(() {
                    selectedGerder=Gender.female;
                  });
                },
                colour: selectedGerder==Gender.female
                                        ? kActiveCardColour 
                                        : kInactiveCardtColor,
                cardChild: ContenidoCard(
                   iconos: FontAwesomeIcons.venus,
                    titulos: 'FEMALE',
                ),
                ))
            ],
          )),
          // sliderbar, indicate the height (cm) 
          Expanded(
            child: ReusableCard             //   
            (colour: kActiveCardColour,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('HEIGHT', 
                style: kLabelTextStyle,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: <Widget>[
                    Text(
                      height.toString(),
                      style: kNumberText
                    ),
                    Text(
                      'cm',
                      style: kLabelTextStyle
                    )
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    inactiveTrackColor: Color(0xFF8D8E98),
                    activeTrackColor: Colors.white,
                    thumbColor:   Color(0xFFEB1555),
                    overlayColor: Color(0x29EB1555),
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),

                  ),
                  child: Slider(
                    value: height.toDouble(),
                    min: 120.0,
                    max: 220.0,
                    
                    onChanged: (double newValue){
                      setState(() {
                      height=newValue.round();   
                      });              
                    },
                  ),
                )
              ],
            ),
           )
          ),
          Expanded(
            child: Row(
            children: <Widget>[
              Expanded(child:  ReusableCard(
                colour: kActiveCardColour,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                    'WEIGHT',
                    style: kLabelTextStyle,
                    ),
                    Text(
                      weight.toString(),        //PESO
                      style: kNumberText,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                      RoundIconButtom(
                        icon: FontAwesomeIcons.minus,
                        onPress: (){
                          setState(() {
                            weight--;
                          });
                        },
                      ),      
                      SizedBox(
                        width: 10.0,
                      ),
                       RoundIconButtom(
                        icon: FontAwesomeIcons.plus,
                        onPress: (){
                          setState(() {
                            weight++;
                          });
                        },
                      ), 
                      ],
                    )
                  ],
                ),       
              )),
              Expanded(child: ReusableCard(
                colour:kActiveCardColour,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                    'AGE',
                    style: kLabelTextStyle,
                    ),
                    Text(
                      age.toString(),        //PESO
                      style: kNumberText,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                      RoundIconButtom(
                        icon: FontAwesomeIcons.minus,
                        onPress: (){
                          setState(() {
                            age--;
                          });
                        },
                      ),      
                      SizedBox(
                        width: 10.0,
                      ),
                       RoundIconButtom(
                        icon: FontAwesomeIcons.plus,
                        onPress: (){
                          setState(() {
                            age++;
                          });
                        },
                      ), 
                      ],
                    )
                  ],
                ),
                ))
            ],
          )),
          ButtomBottom(
              buttomTitle: 'Calulate',
              onTap: (){
                  CalculatorResults cal = CalculatorResults(height: height, weight: weight);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context)=>ResultsPage(
                      bmiResult: cal.calculateBMI(),
                      resultText: cal.getResults(),
                      interpretation: cal.getInterpretation(),
                    )));
                },
           )
        ],
      )
    );
  }
}

class RoundIconButtom extends StatelessWidget {
  RoundIconButtom({@required this.icon,@required this.onPress});
  final IconData icon;
  final Function onPress;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed:onPress,
      elevation: 0.0,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0
      ),
      shape: CircleBorder(),
      fillColor:Color(0xff4c4f5e),
    );
  }
}
