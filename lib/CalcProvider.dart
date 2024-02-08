import 'package:flutter/cupertino.dart';

class CalcProvider extends ChangeNotifier
{
  String text ='0';
  double numOne = 0;
  double numTwo = 0;
  double temp1 = 0;
  double temp2 = 0;

  String result = '';
  String finalResult = '';
  String opr = '';
  String preOpr = '';
  String userInput = '';
  bool equal = false;
  double font = 25;

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
    font = 25;
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
      {
        if(userInput.isEmpty)
          {
            finalResult = '';
          }
        else {
          userInput = userInput.substring(0, userInput.length - 1);
          finalResult = '';

          if (result.isNotEmpty) {
            print("result = $result , hi $numTwo");
            // 12323 => 1232
            result = result.substring(0, result.length - 1);
            print("numtwo = $numTwo");
            //calculate(btnText);
          }
          else if (opr.isNotEmpty) {
            opr = "";
          }
          else if (numOne
              .toString()
              .isNotEmpty) {
            numOne = double.parse(numOne.toString().substring(0, numOne
                .toString()
                .length - 1));
            result = numOne.toString();
          }
          notifyListeners();
        }
      }
    else if(btnText == "+/-")
      {

        result.startsWith('-') ? result = result.substring(1): result = '-'+result;
        finalResult = result;

      }
    else if(btnText == "%")
      {

      }
    else if( opr == '=' && btnText == "=")
      {
        equal = true;
       // print("Hiiiiiiiiiiiiiiiiiiiii preop = $preOpr");
        numOne = temp1;
        numTwo = temp2;
        if(preOpr == '+') {
          finalResult = add();
        } else if( preOpr == '-') {
          finalResult = sub();
        } else if( preOpr == 'x') {
          finalResult = mul();
        } else if( preOpr == '/') {
          finalResult = div();
        }
        userInput = finalResult;
        result = '';
        font = 35;
        temp1 = numOne;
        temp2 = numTwo;
        numOne =0;
        numTwo = 0;
        //finalResult ='';
        // print("temp1 = $temp1");
        // print("temp2 = $temp2");
      }
    else if(btnText == '+' || btnText == '-' || btnText == 'x' || btnText == '/' )
    {
      //print("buttontext = $btnText");
      equal = false;
      userInput += btnText;
      //print("operator userinput $userInput");

     calculate(btnText);

     finalResult='';
     numTwo=0;

      notifyListeners();
    }
    else if(btnText == '=')
      {
        //print("Equal pressed");

        btnText == "=" ? equal = true : equal = false;
        calculate(btnText);
        userInput = finalResult;
        //result = finalResult;
        temp1 = numOne;
        temp2 = numTwo;
        numTwo = 0;
        //result = '';
        finalResult = '';
        font = 35;
        //opr='';

      }
    else if(btnText == ".")
    {
      equal = false;
      if(!result.contains('.'))
      {
        result = result+'.';
        userInput += ".";
      }
      finalResult = result;
    }
    //if btnTxt is numbers 0-9
    else
      {
        //print("number pressed result = $result");
        equal == true ? userInput = result = "" : userInput ;
        equal = false;
        //print("num2 = $numTwo");
        if(numTwo == 0)
        {
         // print("result ====== $result");
          result = result + btnText;
        }
        else
          {
            //print("result -------- $result, $numTwo");
            //result=numTwo.toString() + btnText;
            result = doesContainDecimal(numTwo.toString());
            //print(result);
            numTwo=double.parse(result + btnText);
            //print(numTwo);
          }

        userInput += btnText;

        finalResult = result;
        //calculate(btnText);

      }
    text = finalResult;
    notifyListeners();
  }

  calculate (String btnText)
  {

    if(numOne == 0 || opr =='') {

      numOne = double.parse(result);

    }
    else if(result.isNotEmpty) {

      numTwo = double.parse(result);

    }
    else
      {

        btnText!="="? numTwo = 0:null;}

    if(opr == '+') {
      finalResult = add();
      isOperator(btnText)? result = '':null;
    }
    else if( opr == '-') {
      finalResult = sub();
      isOperator(btnText)? result = '':null;
    } else if( opr == 'x') {
      finalResult = mul();
      isOperator(btnText)? result = '':null;
    } else if( opr == '/') {
      finalResult = div();
      isOperator(btnText)? result = '':null;
    }
    preOpr = opr;
    if(isOperator(btnText) == true)
    {
      opr=btnText ;
      result ='';

    }

    //opr = btnText;
    //result = '';
    // if(btnText != '=')
    // {userInput += btnText;}

    notifyListeners();
  }

  String add()
  {

    result = (numOne + numTwo).toString();
    numOne = double.parse(result);
    //numTwo = 0;

    return doesContainDecimal(result);
    //return result;
  }

  String sub()
  {
    result = (numOne - numTwo).toString();
    numOne = double.parse(result);
    //return doesContainDecimal(result);
    return result;
  }

  String mul()
  {
    result = (numOne * numTwo).toString();
    numOne = double.parse(result);
    //return doesContainDecimal(result);
    return result;
  }

  String div()
  {
    result = (numOne / numTwo).toString();
    numOne = double.parse(result);
    //return doesContainDecimal(result);
    return result;
  }


  String doesContainDecimal(dynamic result)
  {
    if(result.toString().contains('.')) {
      List<String> splitDecimal = result.split('.');
      if(!(int.parse(splitDecimal[1]) > 0)) {
        result = splitDecimal[0];
      }

    }

    return result;
  }

  bool isOperator(String x)
  {
    if (x == '/' || x == 'x' || x == '-' || x == '+' || x == '=') {
      return true;
    }
    return false;
  }
}