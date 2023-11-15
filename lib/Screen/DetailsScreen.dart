// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:movise/API/APIMangment.dart';
import 'package:movise/Theme/ColorsTheme.dart';
import 'package:movise/Widget/MoreLikeThis.dart';
import 'package:movise/model/MoviesDM.dart';

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
    return Scaffold(
      backgroundColor: ColorsTheme.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(widget.moviesDM.title!),
        centerTitle: true,
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * .3,
                    child: Image.network(
                        filterQuality: FilterQuality.high,
                        fit: BoxFit.cover,
                        '${ApiManager.imagePath}${widget.moviesDM.backdropPath}'),
                  ),
                  const Icon(
                    Icons.play_circle_fill_sharp,
                    color: Colors.white,
                    size: 60,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 13, bottom: 8),
                child: Text(
                  widget.moviesDM.title!,
                  style: const TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, bottom: 8),
                child: Text(
                  widget.moviesDM.releaseDate!,
                  style: const TextStyle(color: Colors.white, fontSize: 10),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: SizedBox(
                            width: 130,
                            height: 200,
                            child: Image.network(
                                filterQuality: FilterQuality.high,
                                fit: BoxFit.fill,
                                '${ApiManager.imagePath}${widget.moviesDM.posterPath}'),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 10, top: 5),
                        child: Icon(
                          Icons.bookmark_add_outlined,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    ],
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
                            style: const TextStyle(
                                color: Colors.white, fontSize: 12),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Row(
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(
                              Icons.star_sharp,
                              color: Color(0xffFFBB3B),
                            ),
                            const SizedBox(width: 7),
                            Text(
                              "${widget.moviesDM.voteAverage!}",
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
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
        ],
      ),
    );
  }
}
