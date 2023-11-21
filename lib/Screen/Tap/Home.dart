import 'package:flutter/material.dart';
import 'package:movise/API/api_Mangment.dart';
import 'package:movise/Widget/home_Screen_Widget/CarouselSlider.dart';
import 'package:movise/Widget/home_Screen_Widget/New_Releases.dart';
import 'package:movise/Widget/home_Screen_Widget/Recomended.dart';
import 'package:movise/model/MoviesDM.dart';

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
    return ListView(
      scrollDirection: Axis.vertical,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///----------------------
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

            ///-----------------------

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
        ),
      ],
    );
  }
}
