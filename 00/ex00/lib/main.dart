import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: const Center(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 150.0, right: 30.0),
          child: Text(
              'text',
              style: TextStyle(
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
          onPressed: () { print('Clicked me hehe'); },
          child: const Text('Click'),
        ),
      )
    )
  ));
}
