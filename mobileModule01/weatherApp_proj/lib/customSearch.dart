import 'package:flutter/material.dart';

typedef MyFunction = void Function(String);

class CustomSearchBar extends StatefulWidget {
  final MyFunction testFunction;

  const CustomSearchBar(MyFunction test, {super.key}): testFunction = test;

  @override
  State<CustomSearchBar> createState() => CustomSearchBarState(testFunction);
}

class CustomSearchBarState extends State<CustomSearchBar> {

  TextEditingController _searchController = TextEditingController();

  final MyFunction testFunction;
  CustomSearchBarState(MyFunction test): testFunction = test;

  void _onSearchSubmitted(String searchText) {
    testFunction(searchText);
    _searchController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 0, 55, 89),
        borderRadius: BorderRadius.zero,
      ),
      child: TextField(
        onSubmitted: _onSearchSubmitted,
        decoration: const InputDecoration(
          hintText: 'Search location...',
          hintStyle: TextStyle(
            fontSize: 13,
            color: Color.fromARGB(255, 141, 141, 141),
          ),
          border: InputBorder.none,
          prefixIcon: Icon(Icons.search, color: Color.fromARGB(255, 141, 141, 141),)
        ),
        controller: _searchController,
        style: const TextStyle(
          fontSize: 17,
          color: Color.fromARGB(255, 255, 255, 255),
        )
      ),
    );
  }
}