import 'package:flutter/material.dart';


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

  @override
  Widget build(BuildContext context) => MaterialApp(
  home: Scaffold(
    appBar: AppBar(
      title: const Center(
        child: Text('Calculator'),
      ),
      backgroundColor: const Color.fromARGB(255, 10, 44, 56),
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
                    color: const Color.fromARGB(255, 22, 29, 36) == const Color.fromARGB(255, 255, 255, 255) ? Colors.black : Colors.white,
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
                    color: const Color.fromARGB(255, 22, 29, 36) == const Color.fromARGB(255, 255, 255, 255) ? Colors.black : Colors.white,
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
                child: const Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded( child: CustomButton('7') ),
                    Expanded( child: CustomButton('8') ),
                    Expanded( child: CustomButton('9') ),
                    Expanded( child: CustomButton('C') ),
                    Expanded( child: CustomButton('AC') ),
                  ],
                ),
              )
            ),
          ],
        ),
        const Row(
          children: [
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded( child: CustomButton('4') ),
                  Expanded( child: CustomButton('5') ),
                  Expanded( child: CustomButton('6') ),
                  Expanded( child: CustomButton('+') ),
                  Expanded( child: CustomButton('-') ),
                ],
              ),
            ),
          ],
        ),
        const Row(
          children: [
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded( child: CustomButton('1') ),
                  Expanded( child: CustomButton('2') ),
                  Expanded( child: CustomButton('3') ),
                  Expanded( child: CustomButton('x') ),
                  Expanded( child: CustomButton('/') ),
                ],
              ),
            ),
          ],
        ),
        const Row(
          children: [
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded( child: CustomButton('0') ),
                  Expanded( child: CustomButton('.') ),
                  Expanded( child: CustomButton('00') ),
                  Expanded( child: CustomButton('=') ),
                  Expanded( child: CustomButton('BG') ),
                ],
              ),
            ),
          ],
        ),
      ],
    ));}),
    backgroundColor: const Color.fromARGB(255, 22, 29, 36),
  ),
);


}

class CustomButton extends StatefulWidget {
  final String text;
  const CustomButton( this.text, {super.key} );

  @override
  // ignore: library_private_types_in_public_api, no_logic_in_create_state
  _CustomButton createState() => _CustomButton(text);
}

class _CustomButton extends State<CustomButton> {

  final String text;
  _CustomButton( this.text);

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
      backgroundColor: MaterialStateProperty.all<Color>(const Color.fromARGB(255, 10, 44, 56)),
    ),
    onPressed: () {print(text);},
    child: Text(
      text,
      style: const TextStyle(
        color: Colors.white,
      ),
    ),
  ));
  }
}