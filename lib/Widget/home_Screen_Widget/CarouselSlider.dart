import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movise/API/APIMangment.dart';
import 'package:movise/Screen/DetailsScreen.dart';

class CarouselSliderWidget extends StatelessWidget {
  const CarouselSliderWidget({super.key, required this.snapshot});

  final AsyncSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CarouselSlider.builder(
          itemCount: snapshot.data!.length,
          itemBuilder: (context, itemIndex, realIndex) {
            return InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailsScreen(
                        movieid: snapshot.data![itemIndex].id,
                        moviesDM: snapshot.data![itemIndex],
                      ),
                    ));
              },
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width,
                          child: Image.network(
                              filterQuality: FilterQuality.high,
                              fit: BoxFit.fill,
                              '${ApiManager.imagePath}${snapshot.data[itemIndex].backdropPath}'),
                        ),
                      ),
                      const Icon(
                        Icons.play_circle_fill_sharp,
                        color: Colors.white,
                        size: 60,
                      ),
                    ],
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 80,
                    color: const Color(0xff1E1E1E),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: SizedBox(
                                height: 200,
                                width: 130,
                                child: Image.network(
                                    filterQuality: FilterQuality.high,
                                    fit: BoxFit.fill,
                                    '${ApiManager.imagePath}${snapshot.data[itemIndex].posterPath}'),
                              ),
                            ),
                            const Icon(
                              Icons.bookmark_add_outlined,
                              color: Colors.white,
                              size: 30,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .6,
                        height: 80,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(left: 10, top: 10),
                              child: Text(
                                snapshot.data[itemIndex].title,
                                style: const TextStyle(
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 10, bottom: 5),
                              child: Text(
                                snapshot.data[itemIndex].releaseDate,
                                style: const TextStyle(
                                    fontSize: 10, color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
          options: CarouselOptions(
            height: 300,
            autoPlay: true,
            viewportFraction: 1,
            enlargeCenterPage: true,
            pageSnapping: true,
            autoPlayCurve: Curves.fastOutSlowIn,
            autoPlayAnimationDuration: const Duration(seconds: 1),
          )),
    );
  }
}
