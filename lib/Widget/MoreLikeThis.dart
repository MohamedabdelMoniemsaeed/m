import 'package:flutter/material.dart';
import 'package:movise/API/APIMangment.dart';
import 'package:movise/Screen/DetailsScreen.dart';

class MoreLikeThis extends StatelessWidget {
  final AsyncSnapshot snapshot;

  const MoreLikeThis({super.key, required this.snapshot});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff514F4F),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 20, top: 10),
            child: Text(
              "More Like This",
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
          ),
          const SizedBox(height: 15),
          SizedBox(
            width: double.infinity,
            height: 200,
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: SizedBox(
                                width: 96.87,
                                height: 128,
                                child: Image.network(
                                    filterQuality: FilterQuality.high,
                                    fit: BoxFit.cover,
                                    '${ApiManager.imagePath}${snapshot.data![index].posterPath}'),
                              ),
                            ),
                            const Icon(
                              Icons.bookmark_add_outlined,
                              color: Colors.white,
                              size: 30,
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 5),
                              child: Icon(
                                Icons.star_sharp,
                                color: Color(0xffFFBB3B),
                                size: 15,
                              ),
                            ),
                            const SizedBox(width: 2),
                            Text(
                              "${snapshot.data[index].voteAverage}",
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 12),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 96.87,
                          child: Text(
                            snapshot.data![index].title,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 10),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data!.length,
              physics: const BouncingScrollPhysics(),
            ),
          ),
        ],
      ),
    );
  }
}
