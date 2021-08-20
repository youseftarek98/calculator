import 'package:flutter/material.dart';


class MyCalculator extends StatefulWidget {
  const MyCalculator({Key? key}) : super(key: key);

  @override
  _MyCalculatorState createState() => _MyCalculatorState();
}

class _MyCalculatorState extends State<MyCalculator> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        margin: EdgeInsets.only(bottom: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                    padding: const EdgeInsets.only(
                        left: 10, right: 10, top: 30, bottom: 30),
                    child:  Text(
                      text,
                      style: TextStyle(color: Colors.white, fontSize: 60),
                      maxLines: 2,
                      textAlign: TextAlign.right,
                    )),

              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                raisedButton("AC", Colors.grey, 1),
                raisedButton("+/-", Colors.grey, 1),
                raisedButton("%", Colors.grey, 1),
                raisedButton("/", Colors.orange, 1),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                raisedButton("7", Colors.white38, 1),
                raisedButton("8", Colors.white38, 1),
                raisedButton("9", Colors.white38, 1),
                raisedButton("x", Colors.orange, 1),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                raisedButton("4", Colors.white38, 1),
                raisedButton("5", Colors.white38, 1),
                raisedButton("6", Colors.white38, 1),
                raisedButton("-", Colors.orange, 1),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                raisedButton("1", Colors.white38, 1),
                raisedButton("2", Colors.white38, 1),
                raisedButton("3", Colors.white38, 1),
                raisedButton("+", Colors.orange, 1),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                raisedButton("0", Colors.white38, 0),
                raisedButton(".", Colors.white38, 1),
                raisedButton("=", Colors.orange, 1),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String text = "0";
  String result = "0";
  String finalResult = "0";
  String operation = "";
  String prfOperation = "";
  double numberOne = 0;
  double numberTwo = 0;

  Widget raisedButton(String string, Color color, int number) {
    Container container ;
    if (number == 0) {
      container = Container(
        padding: EdgeInsets.only(bottom: 10),
        child: RaisedButton(
          onPressed: () {
            calculator(string);
          },
          child: Text(
            string,
            style: TextStyle(fontSize: 30),
          ),
          color: color,
          padding: EdgeInsets.only(left: 80, top: 20, right: 80, bottom: 20),
          shape: StadiumBorder(),
        ),
      );
    } else {
      container = Container(
        padding: EdgeInsets.only(bottom: 10),
        child: RaisedButton(
          onPressed: () {
            calculator(string);
          },
          child: Text(
            string,
            style: TextStyle(fontSize: 30),
          ),
          color: color,
          padding: EdgeInsets.all(20),
          shape: CircleBorder(),
        ),
      );
    }

    return container;
  }

  void calculator(textButton) {
    if (textButton == "AC") {
      text = "0";
      numberOne = 0;
      numberTwo = 0;
      result = "0";
      finalResult = "0";
      operation = "";
      prfOperation = "";

    }
    else if (operation == " = " && textButton == "=") {
      switch (prfOperation) {
        case "+":
          finalResult = add();
          break;
        case "-":
          finalResult = sub();
          break;
        case "x":
          finalResult = mull();
          break;
        case "/":
          finalResult = div();
          break;
      }
    } else if (textButton == "+" ||
        textButton == "-" ||
        textButton == "x" ||
        textButton == "/" ||
        textButton == "="){
      if (numberOne == 0) {
        numberOne = double.parse(result);
      } else {
        numberTwo = double.parse(result);
      }
      switch (operation) {
        case "+":
          finalResult = add();
          break;
        case "-":
          finalResult = sub();
          break;
        case "x":
          finalResult = mull();
          break;
        case "/":
          finalResult = div();
          break;
      }

      prfOperation = operation ;
      operation =textButton ;
      result = '' ;
    }

    /*
    else if (operation == " = " && textButton == "=") {
      switch (operation) {
        case "+":
          finalResult = add();
          break;
        case "-":
          finalResult = sub();
          break;
        case "*":
          finalResult = mull();
          break;
        case "/":
          finalResult = div();
          break;
      }
    } else if (textButton == "+" ||
        textButton == "-" ||
        textButton == "*" ||
        textButton == "/" ||
        textButton == "=") {
      if (numberOne == 0) {
        numberOne = double.parse(result);
      } else {
        numberTwo = double.parse(result);
      }
      switch (operation) {
        case "+":
          finalResult = add();
          break;
        case "-":
          finalResult = sub();
          break;
        case "x":
          finalResult = mull();
          break;
        case "/":
          finalResult = div();
          break;
      }
      prfOperation = operation;
      operation = textButton;
      result = "";
    } else {
      if (result == "0")
        result = textButton;
      else
      result = result + textButton;
      finalResult = result;
    }



     */

    else if(textButton == "%"){
      result = (numberOne / 100).toString();
      finalResult = result ;
    }
    else if(textButton == '.'){
      if(!result.contains('.'))
        result += '.' ;
      finalResult = result ;
    }
    else if(textButton == "+/-"){
      result.startsWith('-') ? result = result.substring(1) : result ='-' + result ;
      finalResult = result ;
    }

    else {
      if(result== '0')
        result = textButton ;
      else
        result += textButton ;
      finalResult = result ;
    }
    setState(() {
      text = finalResult;
    });
  }

  String add() {
    result = (numberOne + numberTwo).toString();
    numberOne = double.parse(result);
    return remove (result);
  }

  String sub() {
    result = (numberOne - numberTwo).toString();
    numberOne = double.parse(result);
    return remove (result);
  }

  String mull() {
    result = (numberOne * numberTwo).toString();
    numberOne = double.parse(result);
    return remove(result);
  }

  String div() {
    result = (numberOne / numberTwo).toString();
    numberOne = double.parse(result);
    return remove(result);
  }

  String remove (String _result){
    if (_result.contains('.')){
      List <String> list = _result.split(".") ;
      if(!(int.parse(list[1])> 0 ) )
        return list[0] ;
    }
    return _result ;
  }


}
