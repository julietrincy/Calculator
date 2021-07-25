
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CalculatorButton extends StatelessWidget {
  final String text;
  final Function callback;
  const CalculatorButton({required this.text, required this.callback});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15.0),
      child: SizedBox(
        width: 70,
        height: 50,
        child: TextButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.deepOrange),
          ),
          onPressed: () =>callback(text),
          child: Text(text,style: GoogleFonts.timmana(textStyle:TextStyle(fontSize: 30,color: Colors.white),)),
        ),
      ),
    );
  }
}
