import 'package:flutter/material.dart';
import 'package:movise/API/APIMangment.dart';
import 'package:movise/model/MoviesDM.dart';

class SearchTab extends StatefulWidget {
  String? name;
  @override
  State<SearchTab> createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  late Future<List<MoviesDM>> datasearch;

  @override
  void initState() {
    super.initState();
    // datasearch = ApiManager().getDataSearch(widget.name);
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          showSearch(context: context, delegate: DataSearch());
        },
        icon: Icon(Icons.search));
  }
}

///---------------------------------------
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
          close(context, query);
        },
        icon: Icon(Icons.arrow_back));
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
