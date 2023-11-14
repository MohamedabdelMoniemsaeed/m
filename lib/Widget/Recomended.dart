import 'package:flutter/material.dart';
import 'package:movise/API/APIMangment.dart';
import 'package:movise/Screen/DetailsScreen.dart';

class Recomended extends StatelessWidget {
  final AsyncSnapshot snapshot;

  const Recomended({super.key, required this.snapshot});

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
                        moviesDM: snapshot.data[index],
                      ),
                    ));
              },
              child: Column(
                children: [
                  ClipRRect(
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
                  SizedBox(height: 5),
                  // Row(
                  //   // crossAxisAlignment: CrossAxisAlignment.start,
                  //   children: [
                  //     Icon(
                  //       Icons.star_sharp,
                  //       color: Color(0xffFFBB3B),
                  //       size: 15,
                  //     ),
                  //     SizedBox(width: 2),
                  //     Text(
                  //       "${snapshot.data[index].voteAverage}",
                  //       style: TextStyle(color: Colors.white, fontSize: 12),
                  //     ),
                  //   ],
                  // ),
                ],
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
