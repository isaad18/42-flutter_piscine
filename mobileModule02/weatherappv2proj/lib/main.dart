import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'customSearch.dart';
import 'currentlyTab.dart';
import 'todayTab.dart';
import 'weeklyTab.dart';
import 'package:geolocator/geolocator.dart';

void main() => runApp(const Home());

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String currentSearch = '';
  bool locationPermission = false;

  @override
  void initState() {
    super.initState();
    checkLocationPermission();
  }

  void checkLocationPermission() async {
    PermissionStatus locationStatus = await Permission.location.status;
    if (locationStatus.isGranted) {
      setState(() {
        locationPermission = true;
      });
    }
  }

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
                      onPressed: ()async {
                        PermissionStatus microphoneStatus = await Permission.location.request();
                        if (microphoneStatus.isGranted) {
                          Position position = await Geolocator.getCurrentPosition(
                            desiredAccuracy: LocationAccuracy.high,
                          );
                          double latitude = position.latitude;
                          double longitude = position.longitude;

                          setState(() {
                            currentSearch = '$latitude $longitude';
                            locationPermission = true;
                          });
                        } else {
                          setState(() {
                            currentSearch = '';
                            locationPermission = false;
                          });
                        }
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
              CurrentlyView(currentSearch, locationPermission),
              TodayView(currentSearch, locationPermission),
              WeeklyView(currentSearch, locationPermission),
            ],
          ),
        ),
      ),
    );
  }
}
