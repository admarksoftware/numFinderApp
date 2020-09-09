import 'dart:math';

import 'package:flutter/material.dart';


class DemoColor extends StatefulWidget {
  @override
  _DemoColorState createState() => _DemoColorState();
}

class _DemoColorState extends State<DemoColor> {

  int _number = 0;
  void GenerateRandomNumber(){
    final _random = new Random();
    int next(int min, int max) => min+_random.nextInt( max - min);
    setState(() {
      _number = next(1, 100);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        Text(
          '$_number',
        ),

        RaisedButton.icon(
            onPressed: GenerateRandomNumber,
            icon: Icon(Icons.casino),
            color: Colors.deepOrangeAccent,
            label: Text("RANDOM")
        ),
      ],
    );
  }
}


