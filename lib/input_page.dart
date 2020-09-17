import 'package:bmi_calculator/calculate_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'custom_widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'constants.dart';
import 'calculator_brain.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  double height = 190;
  double weight = 60;
  double age = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    colour: selectedGender == Gender.male
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: CardContent(
                      contentIcon: FontAwesomeIcons.mars,
                      contentText: 'MALE',
                      contentTextStyle: kContentTextStyling,
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    colour: selectedGender == Gender.female
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: CardContent(
                      contentText: 'FEMALE',
                      contentIcon: FontAwesomeIcons.venus,
                      contentTextStyle: kContentTextStyling,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              child: ReusableCard(
            colour: kActiveCardColor,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('HEIGHT', style: kContentTextStyling),
                Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(height.round().toString(),
                          style: kContentNumberStyling),
                      Text(
                        'cm',
                        style: kContentTextStyling,
                      )
                    ]),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    thumbColor: Color(0xFFFB0165),
                    activeTrackColor: Colors.white,
                    inactiveTrackColor: Color(0xFF535564),
                    overlayColor: Color(0x29FB0165),
                    thumbShape: RoundSliderThumbShape(
                        enabledThumbRadius: 13.0, disabledThumbRadius: 10.0),
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 25.0),
                  ),
                  child: Slider(
                    value: height,
                    min: 100.0,
                    max: 290.0,
                    onChanged: (double newValue) {
                      setState(() {
                        height = newValue;
                      });
                    },
                  ),
                )
              ],
            ),
          )),
          Expanded(
            child: Row(
              children: [
                Expanded(
                    child: ReusableCard(
                  colour: kActiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'WEIGHT',
                        style: kContentTextStyling,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              weight.round().toString(),
                              style: kContentNumberStyling,
                            ),
                            Text('KG'),
                          ]),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                            embeddedIcon: FontAwesomeIcons.minus,
                            theOnPress: () {
                              setState(() {
                                if (weight >= 5 && weight <= 900) {
                                  weight = weight - 1;
                                }
                                if (weight == 4) {
                                  weight = weight + 1;
                                }
                              });
                            },
                          ),
                          SizedBox(width: 10.0),
                          RoundIconButton(
                            embeddedIcon: FontAwesomeIcons.plus,
                            theOnPress: () {
                              setState(() {
                                if (weight >= 5 && weight <= 900) {
                                  weight = weight + 1;
                                }
                                if (weight == 901) {
                                  weight = weight - 1;
                                }
                              });
                            },
                          )
                        ],
                      )
                    ],
                  ),
                )),
                Expanded(
                    child: ReusableCard(
                  colour: kActiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'AGE',
                        style: kContentTextStyling,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(age.round().toString(),
                                style: kContentNumberStyling),
                            Text('yrs')
                          ]),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                            embeddedIcon: FontAwesomeIcons.minus,
                            theOnPress: () {
                              setState(() {
                                if (age >= 2 && age <= 150) {
                                  age = age - 1;
                                }
                                if (age == 1) {
                                  age = age + 1;
                                }
                              });
                            },
                          ),
                          SizedBox(width: 10.0),
                          RoundIconButton(
                            embeddedIcon: FontAwesomeIcons.plus,
                            theOnPress: () {
                              setState(() {
                                if (age >= 2 && age <= 150) {
                                  age = age + 1;
                                }
                                if (age == 149) {
                                  age = age - 1;
                                }
                              });
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                )),
              ],
            ),
          ),
          Container(
            height: kBottomBarHeight,
            child: GestureDetector(
              onTap: () {
                CalculatorBrain getBMI =
                    CalculatorBrain(height: height, weight: weight);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CalculatePage(
                            theBmiResult: getBMI.calculateBMI(),
                            theComment: getBMI.getComment(),
                            theDetailedComment: getBMI.getDetailedComment(),
                          )),
                );
              },
              child: Container(
                child: Center(
                  child: Text('CALCULATE', style: kLargeButtonTextStyle),
                ),
                margin: EdgeInsets.only(top: 10.0),
                color: kBottomBarColor,
                width: double.infinity,
              ),
            ),
          )
        ],
      ),
    );
  }
}
