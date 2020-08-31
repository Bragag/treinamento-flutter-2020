import 'package:exercicio_6_calculadora/button.widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'color.utils.dart';
import 'display.widget.dart';

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String _displayValue = '0';
  String _operand = '';
  double _result = null;
  bool _makingOperation = false;

  makeOperation(firstValue, secondValue, operand) {
    switch (operand) {
      case '/':
        return firstValue / secondValue;
      case '*':
        return firstValue * secondValue;
      case '+':
        return firstValue + secondValue;
      case '-':
        return firstValue - secondValue;
      case '=':
        return secondValue;
    }
  }

  resetDisplayValue() {
    this.setState(() {
      _displayValue = '0';
      _makingOperation = false;
      _operand = '';
      _result = null;
    });
  }

  invertSignal() {
    this.setState(() {
      _displayValue = (double.parse(_displayValue) * -1).toString();
    });
  }

  onPressPercent() {
    if (_displayValue == '0') return;

    String replaceChar = _displayValue.replaceAll(RegExp(r"^-?\d*\.?"), '');
    double percent = double.parse(_displayValue) / 100;

    this.setState(() {
      _displayValue = percent.toStringAsFixed(replaceChar.length + 2);
    });
  }

  onPressComma() {
    if (!(RegExp(r"\.")).hasMatch(_displayValue)) {
      this.setState(() {
        _displayValue = _displayValue + '.';
        _makingOperation = false;
      });
    }
  }

  onPressNumber(String value) {
    if (!_makingOperation) {
      this.setState(() {
        _displayValue = _displayValue == '0' ? value : _displayValue + value;
      });
    } else {
      this.setState(() {
        _displayValue = value;
        _makingOperation = false;
      });
    }
  }

  onPressOperand(nextOperand) {
    double parseDisplayValue = double.parse(_displayValue.replaceAll(",", ""));

    if (_result == null) {
      this.setState(() {
        _result = parseDisplayValue;
      });
    } else if (_operand != '') {
      double currValue = _result ?? 0;
      double newResult = makeOperation(currValue, parseDisplayValue, _operand);

      this.setState(() {
        _result = newResult;
        _displayValue = newResult.toString();
      });
    }

    this.setState(() {
      _makingOperation = true;
      _operand = nextOperand;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                DisplayWidget(value: _displayValue),
                Container(
                  height: MediaQuery.of(context).size.height * 0.70,
                  child: Column(
                    children: [
                      Flexible(
                        child: Row(
                          children: [
                            ButtonWidget(
                              value: 'AC',
                              onPress: () => resetDisplayValue(),
                              bgColor: ColorUtils.lightGray,
                            ),
                            ButtonWidget(
                              value: '±',
                              onPress: () => this.invertSignal(),
                              bgColor: ColorUtils.lightGray,
                            ),
                            ButtonWidget(
                              value: '%',
                              onPress: () => this.onPressPercent(),
                              bgColor: ColorUtils.lightGray,
                            ),
                            ButtonWidget(
                              value: '÷',
                              onPress: () => this.onPressOperand('/'),
                              bgColor: ColorUtils.orange,
                            ),
                          ],
                        ),
                      ),
                      Flexible(
                        child: Row(
                          children: [
                            ButtonWidget(
                              value: '7',
                              onPress: () => onPressNumber('7'),
                              bgColor: ColorUtils.darkGray,
                            ),
                            ButtonWidget(
                              value: '8',
                              onPress: () => onPressNumber('8'),
                              bgColor: ColorUtils.darkGray,
                            ),
                            ButtonWidget(
                              value: '9',
                              onPress: () => onPressNumber('9'),
                              bgColor: ColorUtils.darkGray,
                            ),
                            ButtonWidget(
                              value: 'x',
                              onPress: () => this.onPressOperand('*'),
                              bgColor: ColorUtils.orange,
                            ),
                          ],
                        ),
                      ),
                      Flexible(
                        child: Row(
                          children: [
                            ButtonWidget(
                              value: '4',
                              onPress: () => onPressNumber('4'),
                              bgColor: ColorUtils.darkGray,
                            ),
                            ButtonWidget(
                              value: '5',
                              onPress: () => onPressNumber('5'),
                              bgColor: ColorUtils.darkGray,
                            ),
                            ButtonWidget(
                              value: '6',
                              onPress: () => onPressNumber('6'),
                              bgColor: ColorUtils.darkGray,
                            ),
                            ButtonWidget(
                              value: '-',
                              onPress: () => this.onPressOperand('-'),
                              bgColor: ColorUtils.orange,
                            ),
                          ],
                        ),
                      ),
                      Flexible(
                        child: Row(
                          children: [
                            ButtonWidget(
                              value: '1',
                              onPress: () => onPressNumber('1'),
                              bgColor: ColorUtils.darkGray,
                            ),
                            ButtonWidget(
                              value: '2',
                              onPress: () => onPressNumber('2'),
                              bgColor: ColorUtils.darkGray,
                            ),
                            ButtonWidget(
                              value: '3',
                              onPress: () => onPressNumber('3'),
                              bgColor: ColorUtils.darkGray,
                            ),
                            ButtonWidget(
                              value: '+',
                              onPress: () => this.onPressOperand('+'),
                              bgColor: ColorUtils.orange,
                            ),
                          ],
                        ),
                      ),
                      Flexible(
                        child: Row(
                          children: [
                            ButtonWidget(
                              value: '0',
                              onPress: () => onPressNumber('0'),
                              bgColor: ColorUtils.darkGray,
                            ),
                            ButtonWidget(
                              value: ',',
                              onPress: () => this.onPressComma(),
                              bgColor: ColorUtils.darkGray,
                            ),
                            ButtonWidget(
                              value: '=',
                              onPress: () => this.onPressOperand('='),
                              bgColor: ColorUtils.orange,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
