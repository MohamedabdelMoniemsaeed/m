// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:movise/API/APIMangment.dart';
import 'package:movise/Theme/ColorsTheme.dart';
import 'package:movise/Widget/MoreLikeThis.dart';
import 'package:movise/model/popular/MoviesDM.dart';

class DetailsScreen extends StatefulWidget {
  static const String routeName = "DetailsScreen";
  final MoviesDM moviesDM;
  int movieid;

  DetailsScreen({super.key, required this.moviesDM, required this.movieid});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  late Future<List<MoviesDM>> detailsScreen;

  @override
  void initState() {
    super.initState();
    detailsScreen = ApiManager().getMoreLikeThis(widget.movieid);
  }

  @override
  Widget build(BuildContext context) {
    print(widget.moviesDM.id);

    return Scaffold(
      backgroundColor: ColorsTheme.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(widget.moviesDM.title!),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * .3,
            child: Image.network(
                filterQuality: FilterQuality.high,
                fit: BoxFit.cover,
                '${ApiManager.imagePath}${widget.moviesDM.backdropPath}'),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 13, bottom: 8),
            child: Text(
              widget.moviesDM.title!,
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, bottom: 8),
            child: Text(
              widget.moviesDM.releaseDate!,
              style: TextStyle(color: Colors.white, fontSize: 10),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    width: 130,
                    height: 200,
                    child: Image.network(
                        filterQuality: FilterQuality.high,
                        fit: BoxFit.fill,
                        '${ApiManager.imagePath}${widget.moviesDM.posterPath}'),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * .61,
                      child: Text(
                        widget.moviesDM.overview!,
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Row(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.star_sharp,
                          color: Color(0xffFFBB3B),
                        ),
                        SizedBox(width: 7),
                        Text(
                          "${widget.moviesDM.voteAverage!}",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 15),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "More Like This",
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
          ),
          const SizedBox(height: 15),
          SizedBox(
            child: FutureBuilder(
              future: detailsScreen,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text(snapshot.error.toString()),
                  );
                } else if (snapshot.hasData) {
                  return MoreLikeThis(snapshot: snapshot);
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
    );
  }
}
