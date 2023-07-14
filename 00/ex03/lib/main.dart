import 'package:flutter/material.dart';

String input = '0';
String output = '0';
typedef MyFunction = void Function(String);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  
  @override
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
      } else if (input == '0' || input == '00') {
        input = text;
      } else {
        input += text;
      }
    });
    print(text);
  }

  @override
  Widget build(BuildContext context) => MaterialApp(
  home: Scaffold(
    appBar: AppBar(
      title: const Center(
        child: Text('Calculator'),
      ),
      backgroundColor: const Color.fromARGB(255, 10, 44, 56),
    ),
    body: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                input,
                textAlign: TextAlign.right,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 50,
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
                child: Text(
                  output,
                  textAlign: TextAlign.right,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                  ),
                ),
              ),
            ],
          ),
        ),
        Row(
          children: [
            Expanded(
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
                  Expanded( child: CustomButton('', changeInput) ),
                ],
              ),
            ),
          ],
        ),
      ],
    ),
    backgroundColor: Color.fromARGB(255, 22, 29, 36),
  ),
);


}

class CustomButton extends StatefulWidget {
  final String text;
  final MyFunction test;
  CustomButton( String text, MyFunction test ): this.text = text, this.test = test;

  @override
  _CustomButton createState() => _CustomButton(this.text, this.test);
}

class _CustomButton extends State<CustomButton> {

  final String text;
  final MyFunction changeInput;
  _CustomButton( String text, MyFunction test ): this.text = text, changeInput = test;

  @override
  Widget build(BuildContext context) => ElevatedButton(
    style: ButtonStyle(
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.0)),
      ),
      backgroundColor: MaterialStateProperty.all<Color>(const Color.fromARGB(255, 10, 44, 56)),
    ),
    onPressed: () {changeInput(text);},
    child: Text(text),
  );
}