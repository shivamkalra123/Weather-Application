import 'package:flutter/material.dart';

import 'package:flutter/widgets.dart';

class Calculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CalculatorState(),
    );
  }
}

class CalculatorState extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<CalculatorState> {
  final TextEditingController firstNumberController = TextEditingController();
  final TextEditingController secondNumberController = TextEditingController();
  final TextEditingController operatorController = TextEditingController();
  String displayedText = '';

  void calculate() {
    double num1 = double.tryParse(firstNumberController.text) ?? 0;
    double num2 = double.tryParse(secondNumberController.text) ?? 0;
    String operator = operatorController.text;

    switch (operator) {
      case '+':
        setState(() {
          displayedText = (num1 + num2).toString();
        });
        break;
      case '-':
        setState(() {
          displayedText = (num1 - num2).toString();
        });
        break;
      case '*':
        setState(() {
          displayedText = (num1 * num2).toString();
        });
        break;
      case '/':
        if (num2 == 0) {
          setState(() {
            displayedText = 'Error: Division by zero';
          });
        } else {
          setState(() {
            displayedText = (num1 / num2).toString();
          });
        }
        break;
      default:
        setState(() {
          displayedText = 'Invalid Operator';
        });
    }
  }

  void clear() {
    setState(() {
      firstNumberController.text = '';
      secondNumberController.text = '';
      operatorController.text = '';
      displayedText = 'Your Answer will be displayed here';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 59, 144, 111),
        title: const Center(
          child: Text('Simple Calculator'),
        ),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 100,
                child: TextField(
                  controller: firstNumberController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: '1st Number',
                  ),
                ),
              ),
              Container(
                width: 50,
                child: TextField(
                  controller: operatorController,
                  decoration: InputDecoration(
                    labelText: '(+, -, *, /)',
                  ),
                ),
              ),
              Container(
                width: 100,
                child: TextField(
                  controller: secondNumberController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: '2nd Number',
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 200,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Container(
              padding: EdgeInsets.all(16.0),
              alignment: Alignment.centerRight,
              child: Text(
                displayedText,
                style: TextStyle(fontSize: 20.0),
              ),
            ),
          ]),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 59, 144, 111),
                ),
                onPressed: calculate,
                child: Text(
                  'CALCULATE',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 59, 144, 111),
                ),
                onPressed: clear,
                child: Text(
                  'CLEAR',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
