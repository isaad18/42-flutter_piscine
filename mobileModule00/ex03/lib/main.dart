import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';


Color bgButtons = const Color.fromARGB(255, 10, 44, 56);
Color bgGeneral = const Color.fromARGB(255, 22, 29, 36);

String input = '0';
String output = '0.0';
typedef MyFunction = void Function(String);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  
  @override
  // ignore: library_private_types_in_public_api
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  void changeInput(String text) {
    setState(() {
      if (text == 'AC') {
        input = '0';
      } else if (text == 'C') {
        input = input.substring(0, input.length - 1);
        if (input == '') {
          input = '0';
        }
      } else if (text == '=') {
        output = input;
      } else if ((input == '0' || input == '00' || input == '0.0' || input == '0.') && text != '') {
        input = text;
      } else {
        input += text;
      }
      try {
        Parser parser = Parser();
        Expression expression = parser.parse(input.replaceAll('x', '*'));
        ContextModel contextModel = ContextModel();
        double result = expression.evaluate(EvaluationType.REAL, contextModel);
        output = result.toString();
        if (text == '=') {
          input = output;
          output = '0.0';
        }
      } catch (e) {
        if (kDebugMode) {
          print('err');
        }
      }

    });
    if (kDebugMode) {
      print(text);
    }
  }

  void changeColor(String text) {
    setState(() {
      if (bgGeneral == const Color.fromARGB(255, 255, 255, 255)) {
        bgButtons = const Color.fromARGB(255, 10, 44, 56);
        bgGeneral = const Color.fromARGB(255, 22, 29, 36);
      } else {
        bgButtons = const Color.fromARGB(255, 113, 118, 122);
        bgGeneral = const Color.fromARGB(255, 255, 255, 255);
      }
    });
    if (kDebugMode) {
      print(text);
    }
  }

  @override
  Widget build(BuildContext context) => MaterialApp(
  home: Scaffold(
    appBar: AppBar(
      title: const Center(
        child: Text('Calculator'),
      ),
      backgroundColor: bgButtons,
    ),
    body: LayoutBuilder(
  builder: (BuildContext context, BoxConstraints constraints) {
    return OverflowBox(
  maxWidth: constraints.maxWidth, // Ensures the button takes up the available width
  maxHeight: constraints.maxHeight, // Ensures the button takes up the available width
  minHeight: 267,
  minWidth: 100,
  child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                reverse: true,
                child: Text(
                  input,
                  maxLines: 1,
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: bgGeneral == const Color.fromARGB(255, 255, 255, 255) ? Colors.black : Colors.white,
                    fontSize: 40,
                  ),
                  overflow: TextOverflow.fade,
                ),
              ),
            ),
          ],
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                reverse: true,
                child: Text(
                  output,
                  maxLines: 1,
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: bgGeneral == const Color.fromARGB(255, 255, 255, 255) ? Colors.black : Colors.white,
                    fontSize: 25,
                  ),
                  overflow: TextOverflow.fade,
                ),
              ),
              ),
            ],
          ),
        ),
        Row(
          children: [
            Expanded(
              child: Container(
                margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded( child: CustomButton('7', changeInput) ),
                    Expanded( child: CustomButton('8', changeInput) ),
                    Expanded( child: CustomButton('9', changeInput) ),
                    Expanded( child: CustomButton('C', changeInput) ),
                    Expanded( child: CustomButton('AC', changeInput) ),
                  ],
                ),
              )
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded( child: CustomButton('4', changeInput) ),
                  Expanded( child: CustomButton('5', changeInput) ),
                  Expanded( child: CustomButton('6', changeInput) ),
                  Expanded( child: CustomButton('+', changeInput) ),
                  Expanded( child: CustomButton('-', changeInput) ),
                ],
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded( child: CustomButton('1', changeInput) ),
                  Expanded( child: CustomButton('2', changeInput) ),
                  Expanded( child: CustomButton('3', changeInput) ),
                  Expanded( child: CustomButton('x', changeInput) ),
                  Expanded( child: CustomButton('/', changeInput) ),
                ],
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded( child: CustomButton('0', changeInput) ),
                  Expanded( child: CustomButton('.', changeInput) ),
                  Expanded( child: CustomButton('00', changeInput) ),
                  Expanded( child: CustomButton('=', changeInput) ),
                  Expanded( child: CustomButton('BG', changeColor) ),
                ],
              ),
            ),
          ],
        ),
      ],
    ));}),
    backgroundColor: bgGeneral,
  ),
);


}

class CustomButton extends StatefulWidget {
  final String text;
  final MyFunction test;
  const CustomButton( this.text, this.test, {super.key} );

  @override
  // ignore: library_private_types_in_public_api, no_logic_in_create_state
  _CustomButton createState() => _CustomButton(text, test);
}

class _CustomButton extends State<CustomButton> {

  final String text;
  final MyFunction changeInput;
  _CustomButton( this.text, MyFunction test ): changeInput = test;

  @override
  Widget build(BuildContext context){

      final screenSize = MediaQuery.of(context).size;
      final isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

      return SizedBox(
      height: isPortrait ? screenSize.width * 0.08 : screenSize.width * 0.07,
      child: ElevatedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.0)),
        ),
        backgroundColor: MaterialStateProperty.all<Color>(bgButtons),
      ),
      onPressed: () {changeInput(text);},
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
    ));
  }
}