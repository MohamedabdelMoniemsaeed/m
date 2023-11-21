import 'package:flutter/material.dart';
import 'package:movise/API/api_Mangment.dart';
import 'package:movise/model/MoviesDM.dart';

class Search extends StatefulWidget {
  String name = "block";
  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  late Future<List<MoviesDM>> datasearch;

  @override
  void initState() {
    super.initState();
    datasearch = ApiManager().getDataSearch();
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          showSearch(context: context, delegate: DataSearch());
        },
        icon: const Icon(Icons.search));
  }
}

///---------------------------------------
class DataSearch extends SearchDelegate<String> {
  // List<dynamic> list;
  // DataSearch({required this.list});
  @override
  List<Widget>? buildActions(BuildContext context) {
    // Icon Actions
    return [
      IconButton(
        onPressed: () {},
        icon: const Icon(Icons.cancel),
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
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    // Results
    return null!;
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Text
    return const Text("Search...");
  }
}
