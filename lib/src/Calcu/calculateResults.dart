
import 'dart:math';

class CalculatorResults{
  CalculatorResults({this.height, this.weight});

  final int height;
  final int weight;

  double _bmi;
  String calculateBMI(){
      _bmi = weight / pow(height/100,2);
      return _bmi.toStringAsFixed(1);
  }
  String getResults(){
    if(_bmi>=25 && _bmi <= 29.0){
      return 'Alto';
    }else if(_bmi>=18.5 && _bmi <=24.9){
      return 'Normal';
    }else if(_bmi <= 18.5) {
      return 'Bajo';
    }else{
      return 'Obesidad';
    }
  }

    String getInterpretation(){
    if(_bmi>=25 && _bmi <= 29.0){
      return 'Tu IMC es alta...!, cuida tu alimentacion y haz ejercicio.';
    }else if(_bmi>=18.5 && _bmi <=24.9){
      return 'Excelenete...!, Tu IMC indica que estas en el rango normal.';
    }else if(_bmi <= 18.5) {
      return 'Debes alimentarte un poco más.';
    }else{
      return 'Cuidado...!, Tu IMC es muy alta, recomendaria una dieta.';
    }
  }

}