import 'package:flutter/material.dart';
import '../../constants.dart';

class ContenidoCard extends StatelessWidget {
  ContenidoCard({@required this.iconos,this.titulos});
  final IconData iconos;
  final String titulos;
  
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          iconos,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(titulos, style: kLabelTextStyle
        ),
      ],
    );
  }
}
   