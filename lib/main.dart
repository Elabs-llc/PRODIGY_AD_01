import 'package:calcus/widgets/calcus_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const ElabsCalCus());
}

class ElabsCalCus extends StatefulWidget {
  const ElabsCalCus({super.key});

  @override
  State<ElabsCalCus> createState() => _ElabsCalCus();
}

class _ElabsCalCus extends State<ElabsCalCus> {
  double firstNum = 0;
  double secondNum = 0;
  String history = '';
  String txtToDisplay = '';
  String res = ''; //this is used to store intermediate result
  String operation = '';

  void onButtonClicked(String value) {
    //print(value);
    // when dot is clicke
    // if (value == '.') {
    //   if (!txtToDisplay.contains('.')) {
    //     if (txtToDisplay.isEmpty) {
    //       txtToDisplay = '0.';
    //     } else {
    //       txtToDisplay += '.';
    //     }
    //   }
    // }
    // Handle number button clicks
    // else if (value != 'C' &&
    //     value != 'AC' &&
    //     value != '=' &&
    //     value != '+' &&
    //     value != '-' &&
    //     value != 'x' &&
    //     value != '÷' &&
    //     value != '%') {
    //   if (txtToDisplay.contains('.')) {
    //     txtToDisplay += value;
    //   } else {
    //     txtToDisplay = int.parse(txtToDisplay + value).toString();
    //   }
    // }
    // performing basic operations
    if (value == '+' ||
        value == '-' ||
        value == 'x' ||
        value == '÷' ||
        value == '%') {
      firstNum = double.parse(txtToDisplay);
      res = '';
      operation = value;
      history = txtToDisplay;
    }

    // Check if C - Clear is clicked, clear the last number
    else if (value == 'C') {
      res = txtToDisplay.substring(0, txtToDisplay.length - 1);
    }
    // else if value == 'AC - All Clear is clicked
    else if (value == 'AC') {
      txtToDisplay = '';
      firstNum = 0;
      secondNum = 0;
      res = '';
      history = '';
    }

    // when = sign is clicked
    else if (value == '=') {
      secondNum = double.parse(txtToDisplay);
      history = txtToDisplay; // show history to user while typing

      if (operation == '+') {
        res = (firstNum + secondNum).toString();
        history =
            firstNum.toString() + operation.toString() + secondNum.toString();
      }
      if (operation == '-') {
        res = (firstNum - secondNum).toString();
        history =
            firstNum.toString() + operation.toString() + secondNum.toString();
      }
      if (operation == 'x') {
        res = (firstNum * secondNum).toString();
        history =
            firstNum.toString() + operation.toString() + secondNum.toString();
      }
      if (operation == '÷') {
        if (secondNum != 0) {
          res = (firstNum / secondNum).toString();
          history =
              firstNum.toString() + operation.toString() + secondNum.toString();
        } else {
          res = 'Can\'t divide by 0';
          history =
              firstNum.toString() + operation.toString() + secondNum.toString();
        }
      }
      if (operation == '%') {
        res = (firstNum % secondNum).toString();
        history =
            firstNum.toString() + operation.toString() + secondNum.toString();
      }
    }

    // when the +/= is clicked
    else if (value == 'neg') {
      if (txtToDisplay[0] != '-') {
        res = '-$txtToDisplay';
      } else {
        res = txtToDisplay.substring(1);
      }
    } else {
      // when user hasn't clicked on any operator and has clicked on the numbers
      res = int.parse(txtToDisplay + value).toString();
    }

    setState(() {
      txtToDisplay = res;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "eCalcus",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Elabs Calculator"),
        ),
        backgroundColor: const Color.fromARGB(240, 1, 10, 19),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(29, 68, 137, 255),
                  borderRadius: BorderRadius.circular(5),
                ),
                margin: EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // history result Containaer
                    Container(
                      alignment: const Alignment(1.0, 1.0),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          history,
                          style: GoogleFonts.rubik(
                            textStyle: const TextStyle(
                              fontSize: 34.0,
                              fontWeight: FontWeight.bold,
                              color: Color(0x66FFFFFF),
                            ),
                          ),
                        ),
                      ),
                    ),
                    // end history result Container

                    // Result Containaer
                    Container(
                      alignment: const Alignment(1.0, 1.0),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          txtToDisplay,
                          style: GoogleFonts.oswald(
                            textStyle: const TextStyle(
                              fontSize: 60.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    // end Result Container
                  ],
                ),
              ),

              // numbers ro pressed
              Container(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CalcusButton(
                          buttonNumber: 'AC',
                          textColor: 0xFF000000,
                          fillColor: 0xFF92c831,
                          callback: () => onButtonClicked('AC'),
                          textSize: 20,
                        ),
                        CalcusButton(
                          buttonNumber: '+/-',
                          textColor: 0xFF000000,
                          fillColor: 0xFFf4d160,
                          callback: () => onButtonClicked('neg'),
                          textSize: 20,
                        ),
                        CalcusButton(
                          buttonNumber: '%',
                          textColor: 0xFF000000,
                          fillColor: 0xFFf4d160,
                          callback: () => onButtonClicked('%'),
                          textSize: 20,
                        ),
                        CalcusButton(
                          buttonNumber: '÷',
                          textColor: 0xFF000000,
                          fillColor: 0xFFf4d160,
                          callback: () => onButtonClicked('÷'),
                          textSize: 20,
                        )
                      ],
                    ),

                    // second row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CalcusButton(
                          buttonNumber: '9',
                          textColor: 0xFF000000,
                          fillColor: 0xFF8ac4d0,
                          callback: () => onButtonClicked('9'),
                          textSize: 20,
                        ),
                        CalcusButton(
                          buttonNumber: '8',
                          textColor: 0xFF000000,
                          fillColor: 0xFF8ac4d0,
                          callback: () => onButtonClicked('8'),
                          textSize: 20,
                        ),
                        CalcusButton(
                          buttonNumber: '7',
                          textColor: 0xFF000000,
                          fillColor: 0xFF8ac4d0,
                          callback: () => onButtonClicked('7'),
                          textSize: 20,
                        ),
                        CalcusButton(
                          buttonNumber: 'x',
                          textColor: 0xFF000000,
                          fillColor: 0xFFf4d160,
                          callback: () => onButtonClicked('x'),
                          textSize: 20,
                        )
                      ],
                    ),
                    // end second row

                    // third row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CalcusButton(
                          buttonNumber: '6',
                          textColor: 0xFF000000,
                          fillColor: 0xFF8ac4d0,
                          callback: () => onButtonClicked('6'),
                          textSize: 20,
                        ),
                        CalcusButton(
                          buttonNumber: '5',
                          textColor: 0xFF000000,
                          fillColor: 0xFF8ac4d0,
                          callback: () => onButtonClicked('5'),
                          textSize: 20,
                        ),
                        CalcusButton(
                          buttonNumber: '4',
                          textColor: 0xFF000000,
                          fillColor: 0xFF8ac4d0,
                          callback: () => onButtonClicked('4'),
                          textSize: 20,
                        ),
                        CalcusButton(
                          buttonNumber: '-',
                          textColor: 0xFF000000,
                          fillColor: 0xFFf4d160,
                          callback: () => onButtonClicked('-'),
                          textSize: 20,
                        )
                      ],
                    ),
                    // end third row

                    //fourth row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CalcusButton(
                          buttonNumber: '3',
                          textColor: 0xFF000000,
                          fillColor: 0xFF8ac4d0,
                          callback: () => onButtonClicked('3'),
                          textSize: 20,
                        ),
                        CalcusButton(
                          buttonNumber: '2',
                          textColor: 0xFF000000,
                          fillColor: 0xFF8ac4d0,
                          callback: () => onButtonClicked('2'),
                          textSize: 20,
                        ),
                        CalcusButton(
                          buttonNumber: '1',
                          textColor: 0xFF000000,
                          fillColor: 0xFF8ac4d0,
                          callback: () => onButtonClicked('1'),
                          textSize: 20,
                        ),
                        CalcusButton(
                          buttonNumber: '+',
                          textColor: 0xFF000000,
                          fillColor: 0xFFf4d160,
                          callback: () => onButtonClicked('+'),
                          textSize: 20,
                        )
                      ],
                    ),
                    // end fourth row

                    // last row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CalcusButton(
                          buttonNumber: '0',
                          textColor: 0xFF000000,
                          fillColor: 0xFF8ac4d0,
                          callback: () => onButtonClicked('0'),
                          textSize: 20,
                        ),
                        CalcusButton(
                          buttonNumber: '.',
                          textColor: 0xFF000000,
                          fillColor: 0xFF8ac4d0,
                          callback: () => onButtonClicked('.'),
                          textSize: 20,
                        ),
                        CalcusButton(
                          buttonNumber: 'C',
                          textColor: 0xFF000000,
                          fillColor: 0xFFFFB266,
                          callback: () => onButtonClicked('C'),
                          textSize: 20,
                        ),
                        CalcusButton(
                          buttonNumber: '=',
                          textColor: 0xFF000000,
                          fillColor: 0xFFf4d160,
                          callback: () => onButtonClicked('='),
                          textSize: 20,
                        )
                      ],
                    ),
                    // last row
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
