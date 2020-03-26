import 'package:flutter/material.dart';

import '../../constants.dart';

class ButtomBottom extends StatelessWidget {

  ButtomBottom({@required this.onTap, @required this.buttomTitle});

  final Function onTap;
  final String buttomTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(
            buttomTitle,
            style: kLargeButtomTextStyle,
          ),
        ),
        color: kBottomContainerColor,
        margin: EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: kBottomContainerHeight,
      ),
    );
  }
}