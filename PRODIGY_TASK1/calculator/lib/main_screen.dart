import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

const operatorColor = Color(0xff272727);
const buttonColor = Color(0xff191919);
const orangeColor = Color(0xffD9802E);

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  double firstNum = 0.0;
  double secondNum = 0.0;
  var input = '';
  var output = '';
  var operation = '';
  var hideInput = false;
  var outputSize = 34.0;

  onButtonClick(value) {
    //if value is AC
    if (value == 'AC') {
      input = '';
      output = '';
    } else if (value == 'DEL') {
      if (input.isNotEmpty) {
        input = input.substring(0, input.length - 1);
      }
    } else if (value == '=') {
      if (input.isNotEmpty) {
        var userInput = input;
        userInput = input.replaceAll('X', '*');
        Parser p = Parser();
        Expression expression = p.parse(userInput);
        ContextModel cm = ContextModel();
        var finalValue = expression.evaluate(EvaluationType.REAL, cm);
        output = finalValue.toString();
        if (output.endsWith(".0")) {
          output = output.substring(0, output.length - 2);
        }
        input = output;
        hideInput = true;
        outputSize = 52.0;
      }
    } else {
      input = input + value;
      hideInput = false;
      outputSize = 34.0;
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          //Input and output area
          Expanded(
            flex: 1,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    hideInput ? '' : input,
                    style: const TextStyle(
                      fontSize: 48,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    output,
                    style: TextStyle(
                      fontSize: outputSize,
                      color: Colors.white.withOpacity(0.7),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Row(
                  children: [
                    button(
                        text: 'AC',
                        buttonBgColor: operatorColor,
                        tColor: orangeColor),
                    button(
                        text: 'DEL',
                        buttonBgColor: operatorColor,
                        tColor: orangeColor),
                    button(
                        text: '%',
                        buttonBgColor: operatorColor,
                        tColor: orangeColor),
                    button(
                        text: '/',
                        buttonBgColor: operatorColor,
                        tColor: orangeColor),
                  ],
                ),
                Row(
                  children: [
                    button(text: '7'),
                    button(text: '8'),
                    button(text: '9'),
                    button(
                        text: 'X',
                        tColor: orangeColor,
                        buttonBgColor: operatorColor),
                  ],
                ),
                Row(
                  children: [
                    button(text: '4'),
                    button(text: '5'),
                    button(text: '6'),
                    button(
                        text: '-',
                        tColor: orangeColor,
                        buttonBgColor: operatorColor),
                  ],
                ),
                Row(
                  children: [
                    button(text: '1'),
                    button(text: '2'),
                    button(text: '3'),
                    button(
                        text: '+',
                        tColor: orangeColor,
                        buttonBgColor: operatorColor),
                  ],
                ),
                Row(
                  children: [
                    button(
                        text: '%',
                        tColor: orangeColor,
                        buttonBgColor: operatorColor),
                    button(text: '0'),
                    button(text: '.'),
                    button(text: '=', buttonBgColor: orangeColor),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget button({text, tColor = Colors.white, buttonBgColor = buttonColor}) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(8),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
            padding: const EdgeInsets.all(22),
            backgroundColor: buttonBgColor,
          ),
          onPressed: () => onButtonClick(text),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 18,
              color: tColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
