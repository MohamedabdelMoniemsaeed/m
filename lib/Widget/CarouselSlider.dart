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
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: SizedBox(
                  height: 200,
                  width: 500,
                  child: Image.network(
                      filterQuality: FilterQuality.high,
                      fit: BoxFit.fill,
                      '${ApiManager.imagePath}${snapshot.data[itemIndex].backdropPath}'),
                ),
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
