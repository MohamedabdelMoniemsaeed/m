import 'package:flutter/material.dart';
import 'package:movise/API/APIMangment.dart';
import 'package:movise/Widget/New_Releases.dart';
import 'package:movise/Widget/Recomended.dart';
import 'package:movise/model/popular/MoviesDM.dart';

import '../../Widget/CarouselSlider.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  late Future<List<MoviesDM>> popular;
  late Future<List<MoviesDM>> newReleases;
  late Future<List<MoviesDM>> recomended;

  @override
  void initState() {
    super.initState();
    popular = ApiManager().getPopularMovies();
    newReleases = ApiManager().getNewReleases();
    recomended = ApiManager().getRecomended();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          child: FutureBuilder(
            future: popular,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Text(snapshot.error.toString()),
                );
              } else if (snapshot.hasData) {
                return CarouselSliderWidget(snapshot: snapshot);
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
        const SizedBox(height: 15),

        ///-----------------------
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            "New Releases ",
            style: TextStyle(color: Colors.white, fontSize: 15),
          ),
        ),
        const SizedBox(height: 15),
        SizedBox(
          child: FutureBuilder(
            future: newReleases,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Text(snapshot.error.toString()),
                );
              } else if (snapshot.hasData) {
                return NewReleases(snapshot: snapshot);
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),

        ///-----------------------
        const SizedBox(height: 15),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            "Recomended",
            style: TextStyle(color: Colors.white, fontSize: 15),
          ),
        ),
        const SizedBox(height: 15),
        SizedBox(
          child: FutureBuilder(
            future: recomended,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Text(snapshot.error.toString()),
                );
              } else if (snapshot.hasData) {
                return Recomended(snapshot: snapshot);
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
