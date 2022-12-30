import 'package:flutter/material.dart';
import './button.dart';

void main(List<String> args) {
  runApp(Calculator());
}

class Calculator extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        // UI
        brightness: Brightness.light,
        primaryColor: Colors.orange[800],
        accentColor: Colors.cyan[600],

        // font
        fontFamily: 'Chewy',
        //text style
        textTheme: TextTheme(
          headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          // headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Chewy'),
        ),
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  // var btnValue = 1;
  int firstNum = 0;
  int secNum = 0;
  String result = "";
  String textToDisplay = "0";
  String operator = "";
  void btnClicked(btnValue) {
    if (btnValue == "C") {
      textToDisplay = "0";
      result = "0";
      firstNum = 0;
      secNum = 0;
      result = "";
      operator = "";
    } else if (btnValue == "+" ||
        btnValue == "-" ||
        btnValue == "*" ||
        btnValue == "/") {
      firstNum = int.parse(textToDisplay);
      result = "";
      operator = btnValue;
    } else if (btnValue == "=") {
      secNum = int.parse(textToDisplay);
      if (operator == "+") {
        result = (firstNum + secNum).toString();
      }
      if (operator == "-") {
        result = (firstNum - secNum).toString();
      }
      if (operator == "*") {
        result = (firstNum * secNum).toString();
      }
      if (operator == "/") {
        result = (firstNum ~/ secNum).toString();
      }
    } else {
      result = int.parse(textToDisplay + btnValue).toString();
    }

    setState(() {
      textToDisplay = result;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text(
          "CALCULATOR",
          style:
              TextStyle(fontSize: 32, fontFamily: 'Chewy', color: Colors.white),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color.fromARGB(255, 247, 141, 176),
              Color.fromARGB(255, 255, 255, 255),
              Color.fromARGB(255, 247, 141, 176),
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.end, //which start  all buttons from down side
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  "$textToDisplay",
                  style: TextStyle(
                      fontSize: 85,
                      fontWeight: FontWeight.bold,
                      color: Colors.pink),
                ),
              ),
            ),
            Row(
              children: [
                Button("7", btnClicked, Colors.white, Colors.pink),
                Button("8", btnClicked, Colors.white, Colors.pink),
                Button("9", btnClicked, Colors.white, Colors.pink),
                Button("+", btnClicked, Colors.pink, Colors.white),
              ],
            ),
            Row(
              children: [
                Button("4", btnClicked, Colors.white, Colors.pink),
                Button("5", btnClicked, Colors.white, Colors.pink),
                Button("6", btnClicked, Colors.white, Colors.pink),
                Button("-", btnClicked, Colors.pink, Colors.white),
              ],
            ),
            Row(
              children: [
                Button("1", btnClicked, Colors.white, Colors.pink),
                Button("2", btnClicked, Colors.white, Colors.pink),
                Button("3", btnClicked, Colors.white, Colors.pink),
                Button("*", btnClicked, Colors.pink, Colors.white),
              ],
            ),
            Row(
              children: [
                Button("C", btnClicked, Colors.pink, Colors.white),
                Button("0", btnClicked, Colors.white, Colors.pink),
                Button("=", btnClicked, Colors.pink, Colors.white),
                Button("/", btnClicked, Colors.pink, Colors.white),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
