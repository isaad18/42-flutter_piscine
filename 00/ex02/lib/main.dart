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
      input = text;
    });
    print(text);
  }

  @override
  Widget build(BuildContext context) => MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: const Center (
              child: Text('Calculator'),
            ),
            backgroundColor: const Color.fromARGB(255, 10, 44, 56),
          ),
          body: Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CustomButton('7', changeInput),
                    CustomButton('4', changeInput),
                    CustomButton('1', changeInput),
                    CustomButton('0', changeInput),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CustomButton('8', changeInput),
                    CustomButton('5', changeInput),
                    CustomButton('2', changeInput),
                    CustomButton('.', changeInput),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CustomButton('9', changeInput),
                    CustomButton('6', changeInput),
                    CustomButton('3', changeInput),
                    CustomButton('00', changeInput),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CustomButton('C', changeInput),
                    CustomButton('+', changeInput),
                    CustomButton('x', changeInput),
                    CustomButton('=', changeInput),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: Column (
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Flexible(
                            child: Text(
                              input,
                              textAlign: TextAlign.right,
                              style: const TextStyle(
                                fontSize: 50,
                                color: Colors.white,
                              ),
                              overflow: TextOverflow.visible,
                            ),
                          ),
                          Text(
                            output,
                            textAlign: TextAlign.right,
                            style: const TextStyle(
                              fontSize: 50,
                              color: Colors.white,
                            ),
                          ),
                        ]
                      ),
                    ),
                    CustomButton('AC', changeInput),
                    CustomButton('-', changeInput),
                    CustomButton('/', changeInput),
                    CustomButton('', changeInput),
                  ],
                ),
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
  Widget build(BuildContext context) => Container(
    height: 50,
    child: ElevatedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.0)),
        ),
        backgroundColor: MaterialStateProperty.all<Color>(const Color.fromARGB(255, 10, 44, 56)),
      ),
      onPressed: () {changeInput(text);},
      child: Text(text),
    )
  );
}