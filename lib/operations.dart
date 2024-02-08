// int first, second;
// String res, text = "";
// String opp;
// void btnClicked(String btnText) {
//   if (btnText == "C") {
//     res = "";
//     text = "";
//     first = 0;
//     second = 0;
//   } else if (btnText == "+" ||
//       btnText == "-" ||
//       btnText == "x" ||
//       btnText == "/") {
//     first = int.parse(text);
//     res = "";
//     opp = btnText;
//   } else if (btnText == "=") {
//     second = int.parse(text);
//     if (opp == "+") {
//       res = (first + second).toString();
//     }
//     if (opp == "-") {
//       res = (first - second).toString();
//     }
//     if (opp == "x") {
//       res = (first * second).toString();
//     }
//     if (opp == "/") {
//       res = (first ~/ second).toString();
//     }
//   } else {
//     res = int.parse(text + btnText).toString();
//   }
//   setState(() {
//     text = res;
//   });
// }