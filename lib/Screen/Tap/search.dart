// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:movise/Widget/search_Tab/search_Tab.dart';

class SearchTab extends StatelessWidget {
  const SearchTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: IconButton(
            onPressed: () {
              showSearch(context: context, delegate: DataSearch());
            },
            icon: Icon(Icons.search)),
      ),
    ));
  }
}
