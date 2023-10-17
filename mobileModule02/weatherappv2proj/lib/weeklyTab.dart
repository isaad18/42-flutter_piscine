import 'package:flutter/material.dart';

class Weekly extends StatefulWidget {
  const Weekly({super.key});

  @override
  State<Weekly> createState() => _WeeklyState();
}

class _WeeklyState extends State<Weekly> {
  @override
  Widget build(BuildContext context) {
    return const Tab(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(child: Icon(Icons.calendar_view_day)),
          Expanded (
            child: Text(
              'Weekly',
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

class WeeklyView extends StatefulWidget {
  final String text;
  final bool locationPermission;
  const WeeklyView(this.text, this.locationPermission, {super.key});

  @override
  State<WeeklyView> createState() => _WeeklyViewState();
}

class _WeeklyViewState extends State<WeeklyView> {
  String testLocation() {
    if (widget.locationPermission == false) {
      return 'Geolocation is not available';
    } else {
      return 'Weekly ${widget.text}';
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