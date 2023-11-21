import 'package:flutter/material.dart';
import 'package:movise/API/api_Mangment.dart';
import 'package:movise/Screen/DetailsScreen.dart';

class NewReleases extends StatelessWidget {
  final AsyncSnapshot snapshot;

  const NewReleases({super.key, required this.snapshot});

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
              "New Releases ",
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
          ),
          SizedBox(
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
                    child: Stack(
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
