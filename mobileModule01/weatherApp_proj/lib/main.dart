import 'package:flutter/material.dart';
import 'customSearch.dart';
import 'currentlyTab.dart';
import 'todayTab.dart';
import 'weeklyTab.dart';

void main() => runApp(const Home());

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String currentSearch = '';

  void changeSearch(String newSearch) {
    setState(() {
      currentSearch = newSearch;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

    return DefaultTabController(
      length: 3,
      child: MaterialApp(
        home: Scaffold(
          backgroundColor: const Color.fromARGB(255, 0, 20, 36),
          appBar: AppBar(
            toolbarHeight: 42,
            title: const Text('WeatherApp'),
            centerTitle: true,
            backgroundColor: const Color.fromARGB(255, 0, 55, 89),
            actions: [
              Row(
                children: [
                  SizedBox(
                    width: isPortrait ? screenSize.width * 0.8 : screenSize.width * 0.7,
                    child: CustomSearchBar(changeSearch),
                  ),
                  SizedBox(
                    width: isPortrait ? screenSize.width * 0.02 : screenSize.width * 0.02,
                    child: const VerticalDivider(
                      thickness: 1,
                      indent: 10,
                      endIndent: 10,
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                  SizedBox(
                    width: isPortrait ? screenSize.width * 0.18 : screenSize.width * 0.28,
                    child: IconButton(
                      icon: const Icon(Icons.my_location_outlined),
                      color: const Color.fromARGB(255, 255, 255, 255),
                      onPressed: () {
                        setState(() {
                          currentSearch = '';
                        });
                      },
                    ),
                  )
                ]
              ),
            ],
          ),
          bottomNavigationBar: const BottomAppBar(
            height: 62,
            color: Color.fromARGB(255, 0, 55, 89),
            child: TabBar(
              tabs: [
                Currently(),
                Today(),
                Weekly(),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              CurrentlyView(currentSearch),
              TodayView(currentSearch),
              WeeklyView(currentSearch),
            ],
          ),
        ),
      ),
    );
  }
}
