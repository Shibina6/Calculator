import 'package:flutter/cupertino.dart';

class Myprovider extends ChangeNotifier
{
  var first, second;
  String res ="", text = "";
  String opp = "", input = "";

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

  void btnClicked(String btnText)
  {
    if (btnText == "C")
    {
      res = "";
      text = "";
      opp = "";
      first = 0;
      second = 0;
      input = "";

    }
    else if(btnText == "AC")
    {
      res = text.substring(0, text.length-1);
      text = res;
      //input = first.toString()+opp+second.toString();
      equalpressed();
    }
    else if (btnText == "+" ||
        btnText == "-" ||
        btnText == "x" ||
        btnText == "/")
    {
      first = int.parse(text);
      res = "";
      opp = btnText;
      input += btnText;

    }
    else if (btnText == "=")
    {
      equalpressed();

    }
    else
    {
      input += btnText;
      res = int.parse(text + btnText).toString();

    }


    text = res;
    //input = first.toString()+opp+second.toString();

    notifyListeners();

  }
  void equalpressed()
  {
    //res = "";
    second = int.parse(text);
    if (opp == "+")
    {
      res = (first + second).toString();

    }
    if (opp == "-")
    {
      res = (first - second).toString();

    }
    if (opp == "x")
    {
      res = (first * second).toString();

    }
    if (opp == "/")
    {
      res = (first ~/ second).toString();

    }
  }
}




// class Myprovider extends ChangeNotifier
// {
//   var first, second;
//   String res ="", text = "";
//   String opp = "", input = "";
//
//   final List<String> buttons = [
//     'C',
//     '+/-',
//     '%',
//     'AC',
//     '7',
//     '8',
//     '9',
//     '/',
//     '4',
//     '5',
//     '6',
//     'x',
//     '1',
//     '2',
//     '3',
//     '-',
//     '0',
//     '.',
//     '=',
//     '+',
//   ];
//
//   void btnClicked(String btnText)
//   {
//     if (btnText == "C")
//     {
//
//
//       clearAll();
//
//     }
//     else if(btnText == "AC")
//     {
//       opp = "";
//       input = input.substring(0,input.length-1);
//       //res = text.substring(0, text.length-1);
//       text = res;
//       //input = first.toString()+opp+second.toString();
//       equalpressed();
//     }
//     else if (btnText == "+" ||
//              btnText == "-" ||
//              btnText == "x" ||
//              btnText == "/")
//     {
//       first = int.parse(text);
//       res = "";
//       opp = btnText;
//       // input += btnText;
//
//     }
//     // else if (btnText == ".")
//     // {
//     //   if(opp == "")
//     //     {
//     //       input += btnText;
//     //     }
//     //
//     // }
//     else if (btnText == "=")
//     {
//       equalpressed();
//       //opp = "";
//
//     }
//     else
//     {
//       //input += btnText;
//       res = int.parse(text + btnText).toString();
//       //opp = "";
//
//     }
//
//
//       text = res;
//       //input = first.toString()+opp+second.toString();
//     print(int.tryParse("/////////////"+btnText));
//    // appendValue(btnText);
//       notifyListeners();
//
//   }
//   void equalpressed()
//   {
//     //res = "";
//
//     second = int.parse(text);
//     if (opp == "+")
//     {
//
//       res = (first + second).toString();
//
//     }
//     if (opp == "-")
//     {
//       res = (first - second).toString();
//
//     }
//     if (opp == "x")
//     {
//       res = (first * second).toString();
//
//     }
//     if (opp == "/")
//     {
//       res = (first ~/ second).toString();
//
//     }
//
//     //opp = "";
//   }
//
//   // void appendValue(String btnText) {
//   //   String fst = first.toString();
//   //   String scnd = second.toString();
//   //   print(fst);
//   //   print(scnd);
//   //   print("hello");
//   //   // number1 operand number2
//   //   // 234       +      5343
//   //
//   //   // if is operand and not "."
//   //   if (btnText != "." && int.tryParse(btnText) == null) {
//   //
//   //     // operand pressed
//   //     if (opp.isNotEmpty && scnd.isNotEmpty) {
//   //       // TODO calculate the equation before assigning new operand
//   //       equalpressed();
//   //     }
//   //     opp = btnText;
//   //   }
//   //   // assign value to number1 variable
//   //   else if (fst.isEmpty || opp.isEmpty)
//   //   {
//   //     //print("fst is empty");
//   //     // check if value is "." | ex: number1 = "1.2"
//   //     if (btnText == "." && fst.contains(".")) return;
//   //     if (btnText == "." && (fst.isEmpty || fst == '0'))
//   //     {
//   //       // ex: number1 = "" | "0"
//   //       btnText = "0.";
//   //     }
//   //     fst += btnText;
//   //     //input += btnText;
//   //   }
//   //   // assign value to number2 variable
//   //   else if (scnd.isEmpty || opp.isNotEmpty) {
//   //     // check if value is "." | ex: number1 = "1.2"
//   //     if (btnText == "." && scnd.contains(".")) return;
//   //     if (btnText == "." && (scnd.isEmpty || scnd == '0')) {
//   //       // number1 = "" | "0"
//   //       btnText = "0.";
//   //     }
//   //     scnd += btnText;
//   //   }
//   //
//   //   // if(btnText == "C")
//   //   //   {clearAll()}
//   //
//   //
//   //   btnText == "C"? clearAll() : input = fst+opp+scnd;
//   //   print(opp);
//   // }
//
//   void clearAll()
//   {
//       //first = 0;
//       opp = "";
//       //second = 0;
//       res = "";
//       text = "";
//       opp = "";
//       input = "";
//
//   }
// }
