import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class CalculatePage extends StatelessWidget {
  final String theBmiResult;
  final String theComment;
  final String theDetailedComment;

  CalculatePage(
      {@required this.theBmiResult,
      @required this.theComment,
      this.theDetailedComment});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            margin: EdgeInsets.only(top: 35.0),
            child: Text(
              'Your Result',
              style: kLargeTextStyle,
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xFF1D1F33),
                borderRadius: BorderRadius.circular(10.0),
              ),
              margin: EdgeInsets.all(7.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(theComment, style: kResultCommentTextStyle),
                  Container(
                      margin: EdgeInsets.symmetric(vertical: 30.0),
                      child: Text(theBmiResult, style: kContentNumberStyling)),
                  Container(
                    margin: EdgeInsets.all(25.0),
                    child: Text(
                      theDetailedComment,
                      textAlign: TextAlign.center,
                      style: kDetailedCommentStyle,
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            height: kBottomBarHeight,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                child: Center(
                  child: Text('RE-CALCULATE YOUR BMI',
                      style: kLargeButtonTextStyle),
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
