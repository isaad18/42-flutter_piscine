import 'package:flutter/material.dart';

String text = 'A simple text';

void main() => runApp(const MaterialApp( home: Home() ));

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _Home createState() => _Home();
}

class _Home extends State<Home> {

  void changeClick() {
    setState(() {
      text = text == 'A simple text' ? 'Hello World!' : 'A simple text';
      print('Clicked me hehe');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
              Text(
                text,
                style: const TextStyle(
                  fontSize: 30,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.bold,
                  backgroundColor: Colors.deepPurple,
                  color: Color.fromARGB(255, 22, 17, 28),
                )
              ),
              FloatingActionButton(
                onPressed: () { changeClick(); },
                child: const Text('Click'),
              ),
            ]
        )
      ),
    );
  }
}