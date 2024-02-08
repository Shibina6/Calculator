import 'package:flutter/cupertino.dart';

class ProviderNew extends ChangeNotifier
{
  String text ='0';
  double numOne = 0;
  double numTwo = 0;

  String result = '';
  String finalResult = '';
  String opr = '';
  String preOpr = '';
  String userInput = '';
  bool equal = false;

  final List<String> buttons = [
    'C',
    '+/-',
    '%',
    'AC',
    '7',
    '8',
    '9',
    '/',
    '4',
    '5',
    '6',
    'x',
    '1',
    '2',
    '3',
    '-',
    '0',
    '.',
    '=',
    '+',
  ];

  void BtnClicked(String btnText)
  {
    if(btnText == "C")
    {
      text ='0';
      numOne = 0;
      numTwo = 0;

      result = '';
      finalResult = '';
      opr = '';
      preOpr = '';
      userInput = "";
      equal = false;
    }
    else if(btnText == "AC")
      {}
    else if(btnText == "+/-")
      {}
    else if(btnText == "%")
    {}
    else if( opr == '=' && btnText == "=")
      {}
    else if(btnText == '+' || btnText == '-' || btnText == 'x' || btnText == '/' )
      {}
    else if(btnText == '=')
      {}
    else if(btnText == ".")
      {}
    else
      {

      }
  }
}