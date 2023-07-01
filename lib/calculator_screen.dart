import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

import 'components/my_button.dart';

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  var userInput = '';
  var answer = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            Expanded(
              flex: 1,
              child: Align(
                alignment: Alignment.bottomRight,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      userInput.toString(),
                      style: const TextStyle(fontSize: 40, color: Colors.white),
                    ),
                    Text(
                      answer.toString(),
                      style: const TextStyle(fontSize: 40, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Row(
                      children: [
                        MyButton(
                          title: 'AC',
                          onPressed: () {
                            userInput = '';
                            answer = '';
                            setState(() {});
                          },
                        ),
                        MyButton(
                            title: '+/-',
                            onPressed: () {
                              userInput += '+/-';
                              setState(() {});
                            }),
                        MyButton(
                            title: '%',
                            onPressed: () {
                              userInput += '%';
                              setState(() {});
                            }),
                        MyButton(
                            title: '/',
                            colors: const Color(0xffffa00a),
                            onPressed: () {
                              userInput += '/';
                              setState(() {});
                            }),
                      ],
                    ),
                    Row(
                      children: [
                        MyButton(
                          title: '7',
                          colors: Colors.grey.shade800,
                          onPressed: () {
                            userInput += '7';
                            setState(() {});
                          },
                        ),
                        MyButton(
                            title: '8',
                            colors: Colors.grey.shade800,
                            onPressed: () {
                              userInput += '8';
                              setState(() {});
                            }),
                        MyButton(
                            title: '9',
                            colors: Colors.grey.shade800,
                            onPressed: () {
                              userInput += '9';
                              setState(() {});
                            }),
                        MyButton(
                            title: 'x',
                            colors: const Color(0xffffa00a),
                            onPressed: () {
                              userInput += 'x';
                              setState(() {});
                            }),
                      ],
                    ),
                    Row(
                      children: [
                        MyButton(
                          title: '4',
                          colors: Colors.grey.shade800,
                          onPressed: () {
                            userInput += '4';
                            setState(() {});
                          },
                        ),
                        MyButton(
                            title: '5',
                            colors: Colors.grey.shade800,
                            onPressed: () {
                              userInput += '5';
                              setState(() {});
                            }),
                        MyButton(
                            title: '6',
                            colors: Colors.grey.shade800,
                            onPressed: () {
                              userInput += '6';
                              setState(() {});
                            }),
                        MyButton(
                            title: '-',
                            colors: const Color(0xffffa00a),
                            onPressed: () {
                              userInput += '-';
                              setState(() {});
                            }),
                      ],
                    ),
                    Row(
                      children: [
                        MyButton(
                          title: '1',
                          colors: Colors.grey.shade800,
                          onPressed: () {
                            userInput += '1';
                            setState(() {});
                          },
                        ),
                        MyButton(
                            title: '2',
                            colors: Colors.grey.shade800,
                            onPressed: () {
                              userInput += '2';
                              setState(() {});
                            }),
                        MyButton(
                            title: '3',
                            colors: Colors.grey.shade800,
                            onPressed: () {
                              userInput += '3';
                              setState(() {});
                            }),
                        MyButton(
                            title: '+',
                            colors: const Color(0xffffa00a),
                            onPressed: () {
                              userInput += '+';
                              setState(() {});
                            }),
                      ],
                    ),
                    Row(
                      children: [
                        MyButton(
                          title: '0',
                          colors: Colors.grey.shade800,
                          onPressed: () {
                            userInput += '0';
                            setState(() {});
                          },
                        ),
                        MyButton(
                            title: '.',
                            colors: Colors.grey.shade800,
                            onPressed: () {
                              userInput += '.';
                              setState(() {});
                            }),
                        MyButton(
                            title: 'DEL',
                            colors: Colors.grey.shade800,
                            onPressed: () {
                              userInput =
                                  userInput.substring(0, userInput.length - 1);
                              setState(() {});
                            }),
                        MyButton(
                            title: '=',
                            colors: const Color(0xffffa00a),
                            onPressed: () {
                              equalFunction();
                              setState(() {});
                            }),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void equalFunction() {
    String finalUser = userInput.replaceAll(
      'x',
      '*',
    );
    Parser parser = Parser();
    Expression expression = parser.parse(finalUser);
    ContextModel contextModel = ContextModel();

    double eval = expression.evaluate(EvaluationType.REAL, contextModel);
    answer = eval.toString();
    if (answer.endsWith('.0')) {
      answer = answer.substring(0, answer.length - 2);
    }
  }
}
