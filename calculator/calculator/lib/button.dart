import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Button extends StatelessWidget {
  String number;
  final Function btnHandler;
  Color mycolor;
  Color btntxt;
  Button(this.number, this.btnHandler, this.mycolor, this.btntxt);
  // const Button({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Expanded(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.all(35.0),
            primary: mycolor,
            textStyle: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            side: BorderSide(
              color: Colors.pinkAccent,
              width: 2,
            ),
            shape: StadiumBorder(),
          ),
          child: Text(
            number,
            style: TextStyle(color: btntxt, fontFamily: 'MarkoOne'),
          ),
          onPressed: () => btnHandler(number),
        ),
      ),
    );
  }
}
