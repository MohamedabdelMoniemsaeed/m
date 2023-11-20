
import 'package:flutter/material.dart';

class DataSearch extends SearchDelegate<String> {
  @override
  List<Widget>? buildActions(BuildContext context) {
    // Icon Actions
    return [
      IconButton(
        onPressed: () {},
        icon: Icon(Icons.cancel),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // Icon Seach
    return IconButton(
        onPressed: () {
          close(context, null!);
        },
        icon: Icon(Icons.search));
  }

  @override
  Widget buildResults(BuildContext context) {
    // Results
    return null!;
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Text
    return Text("Search...");
  }
}