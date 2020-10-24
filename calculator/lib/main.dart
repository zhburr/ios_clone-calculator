import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Calculator",
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int num1 = 0;
  int num2 = 0;
  dynamic text = "0";
  dynamic result = "";
  dynamic finalResult = "";
  dynamic operation = "";
  dynamic preOpr = "";

  Widget btn(String btnVal, Color color) {
    return Container(
      padding: EdgeInsets.only(bottom: 10),
      child: RaisedButton(
        child: Text(
          btnVal,
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
        color: color,
        padding: EdgeInsets.all(22),
        shape: CircleBorder(),
        onPressed: () {
          calculation(btnVal);
        },
      ),
    );
  }

  Widget zeroButton(String btnVal, Color color) {
    return Container(
      padding: EdgeInsets.only(bottom: 10),
      child: RaisedButton(
          child: Text(
            btnVal,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
          color: color,
          // shape: ,
          padding: EdgeInsets.only(left: 80, top: 20, right: 80, bottom: 20),
          shape: StadiumBorder(),
          onPressed: () {
            calculation(btnVal);
          }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 25),
                child: Text(
                  text,
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 60,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              btn("C", Colors.grey),
              btn("+/-", Colors.grey),
              btn("%", Colors.grey),
              btn("/", Colors.orange),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              btn("7", Colors.grey[900]),
              btn("8", Colors.grey[900]),
              btn("9", Colors.grey[900]),
              btn("x", Colors.orange),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              btn("4", Colors.grey[900]),
              btn("5", Colors.grey[900]),
              btn("6", Colors.grey[900]),
              btn("-", Colors.orange),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              btn("1", Colors.grey[900]),
              btn("2", Colors.grey[900]),
              btn("3", Colors.grey[900]),
              btn("+", Colors.orange),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              zeroButton("0", Colors.grey[900]),
              btn(".", Colors.grey[900]),
              btn("=", Colors.orange),
            ],
          )
        ],
      ),
    );
  }

  void calculation(btnVal) {
    if (btnVal == "C") {
      num1 = 0;
      num2 = 0;
      text = "0";
      result = "";
      finalResult = "";
      operation = "";
      preOpr = "";
    } else if (btnVal == "=" && preOpr == "=") {
    } else if (btnVal == "+" ||
        btnVal == "-" ||
        btnVal == "x" ||
        btnVal == "/") {
      if (num1 == 0) {
        num1 = int.parse(result);
      } else {
        num2 = int.parse(result);
      }
      if (operation == "+") {
        result = (num1 + num2).toString();
        finalResult = result;
        num1 = int.parse(result);
      }
      preOpr = operation;
      operation = btnVal;
      result = "";
    } else {
      result = result + btnVal;
      finalResult = result;
    }
    setState(() {
      text = finalResult;
    });
  }
}
