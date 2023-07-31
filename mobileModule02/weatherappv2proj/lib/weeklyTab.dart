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
  const WeeklyView(this.text, {super.key});

  @override
  State<WeeklyView> createState() => _WeeklyViewState();
}

class _WeeklyViewState extends State<WeeklyView> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Weekly ${widget.text}',
        style: const TextStyle(
          color: Color.fromARGB(255, 255, 255, 255),
          fontSize: 30,
        ),
      ),
    );
  }
}