import 'package:flutter/material.dart';

class Today extends StatefulWidget {
  const Today({super.key});

  @override
  State<Today> createState() => _TodayState();
}

class _TodayState extends State<Today> {
  @override
  Widget build(BuildContext context) {
    return const Tab(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(child: Icon(Icons.today)),
          Expanded (
            child: Text(
              'Today',
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

class TodayView extends StatefulWidget {
  final String text;
  final bool locationPermission;
  const TodayView(this.text, this.locationPermission, {super.key});

  @override
  State<TodayView> createState() => _TodayViewState();
}

class _TodayViewState extends State<TodayView> {
  String testLocation() {
    if (widget.locationPermission == false) {
      return 'Geolocation is not available';
    } else {
      return 'Today ${widget.text}';
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