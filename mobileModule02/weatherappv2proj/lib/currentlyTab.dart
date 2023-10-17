import 'package:flutter/material.dart';

class Currently extends StatefulWidget {
  const Currently({super.key});

  @override
  State<Currently> createState() => _CurrentlyState();
}

class _CurrentlyState extends State<Currently> {
  @override
  Widget build(BuildContext context) {
    return const Tab(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(child: Icon(Icons.watch_outlined)),
          Expanded (
            child: Text(
              'Currently',
              overflow: TextOverflow.clip,
              style: TextStyle(
                fontSize: 13,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CurrentlyView extends StatefulWidget {
  final String text;
  final bool locationPermission;
  const CurrentlyView(this.text, this.locationPermission, {super.key});

  @override
  State<CurrentlyView> createState() => _CurrentlyViewState();
}

class _CurrentlyViewState extends State<CurrentlyView> {

  String testLocation() {
    if (widget.locationPermission == false) {
      return 'Geolocation is not available';
    } else {
      return 'Currently ${widget.text}';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        testLocation(),
        style: const TextStyle(
          color: Color.fromARGB(255, 255, 255, 255),
          fontSize: 30,
        ),
      ),
    );
  }
}