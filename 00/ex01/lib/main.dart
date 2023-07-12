import 'package:flutter/material.dart';

String text = 'Click';

void main() => runApp(MaterialApp( home: Home() ));

class _Text extends StatefulWidget {
  @override
  _TextState createState() => _TextState();
}

class _TextState extends State<_Text> {
  @override
  Widget build(BuildContext context) {
    return Text(
              text,
              style: const TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 22, 17, 28),
                fontFamily: 'Roboto',
              )
            );
  }
}

class Home extends StatefulWidget {

  const Home({Key? key}) : super(key: key);

  @override
  _Home createState() => _Home();
}

class _Home extends State<Home> {

  void changeClick() {
    setState(() {
      text = text == 'Click' ? 'Clicked' : 'Click';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 150.0, right: 30.0),
          child: _Text(),
        )
      ),
      floatingActionButton: Center(
        child: FloatingActionButton(
          onPressed: () {
            changeClick();
          },
          child: const Text('Click'),
        ),
      )
    );
  }
}

