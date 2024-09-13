import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CalcusButton extends StatelessWidget {
  final String buttonNumber;
  final int fillColor;
  final int textColor;
  final double textSize;
  final Function callback;
  const CalcusButton(
      {super.key,
      required this.buttonNumber,
      required this.fillColor,
      required this.textColor,
      required this.textSize,
      required this.callback});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      child: SizedBox(
        width: 70,
        height: 70,
        child: TextButton(
          onPressed: () => callback(),
          style: TextButton.styleFrom(
            backgroundColor: Color(fillColor),
          ),
          child: Text(
            buttonNumber,
            style: GoogleFonts.rubik(
              textStyle: const TextStyle(fontSize: 24),
              color: Color(textColor),
            ),
          ),
        ),
      ),
    );
  }
}
