import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'A simple text',
              style: TextStyle(
                fontSize: 30,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.bold,
                backgroundColor: Colors.deepPurple,
                color: Color.fromARGB(255, 22, 17, 28),
              ),
            ),
            FloatingActionButton(
              onPressed: () {
                if (kDebugMode) {
                  print('Clicked me hehe');
                }
              },
              backgroundColor: Colors.orangeAccent,
              child: const Text('click me'),
            ),
          ],
        ),
      ),
    ),
  ));
}
