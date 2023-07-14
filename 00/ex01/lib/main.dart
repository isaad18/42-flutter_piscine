import 'package:flutter/material.dart';

String text = 'Click';

void main() => runApp(MaterialApp( home: Home() ));

class Home extends StatefulWidget {
  @override
  _Home createState() => _Home();
}

class _Home extends State<Home> {

  void changeClick() {
    setState(() {
      text = text == 'Click' ? 'Clicked' : 'Click';
      print('Clicked me hehe');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 150.0, right: 30.0),
          child: Text(
              text,
              style: const TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 22, 17, 28),
                fontFamily: 'Roboto',
              )
            ),
        )
      ),
      floatingActionButton: Center(
        child: FloatingActionButton(
          onPressed: () {
            changeClick();
          },
          child: Text('Click'),
        ),
      )
    );
  }
}