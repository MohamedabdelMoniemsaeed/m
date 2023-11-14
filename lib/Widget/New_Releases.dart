import 'package:flutter/material.dart';
import 'package:movise/API/APIMangment.dart';
import 'package:movise/Screen/DetailsScreen.dart';

class NewReleases extends StatelessWidget {
  final AsyncSnapshot snapshot;

  const NewReleases({super.key, required this.snapshot});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 150,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailsScreen(
                        movieid: snapshot.data![index].id,
                        moviesDM: snapshot.data![index],
                      ),
                    ));
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  width: 96.87,
                  height: 128,
                  child: Image.network(
                      filterQuality: FilterQuality.high,
                      fit: BoxFit.cover,
                      '${ApiManager.imagePath}${snapshot.data![index].posterPath}'),
                ),
              ),
            ),
          );
        },
        scrollDirection: Axis.horizontal,
        itemCount: snapshot.data!.length,
        physics: BouncingScrollPhysics(),
      ),
    );
  }
}
