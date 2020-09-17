import 'package:flutter/material.dart';
import 'input_page.dart';

class CardContent extends StatelessWidget {
  final IconData contentIcon;
  final String contentText;
  final TextStyle contentTextStyle;

  CardContent({this.contentIcon, this.contentText, this.contentTextStyle});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          contentIcon,
          size: 80.0,
        ),
        SizedBox(
          height: 18.0,
        ),
        Text(contentText, style: contentTextStyle)
      ],
    );
  }
}

class ReusableCard extends StatelessWidget {
  final Color colour;
  final Widget cardChild;
  Function onPress;

  ReusableCard({@required this.colour, this.cardChild, this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  IconData embeddedIcon;
  Function theOnPress;

  RoundIconButton({@required this.embeddedIcon, @required this.theOnPress});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: theOnPress,
      child: Icon(embeddedIcon),
      fillColor: Color(0xFF535564),
      shape: CircleBorder(),
      constraints: BoxConstraints.tightFor(width: 45.0, height: 45.0),
    );
  }
}
