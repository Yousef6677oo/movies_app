import 'package:flutter/material.dart';
import 'package:movies/model/GenreResponseDM.dart';

import '../../../../model/browseDM.dart';
import '../../../browse_specific_category_screen/browse_specific_category_screen.dart';

class BrowseTab extends StatefulWidget {
  List<Genre> genreResponseList = [];

  BrowseTab(this.genreResponseList);

  @override
  State<BrowseTab> createState() => _BrowseTabState();
}

class _BrowseTabState extends State<BrowseTab> {
  List<String> browseImageUrl = [
    "assets/genres/action_genre.jpeg",
    "assets/genres/adventure_genre.jpg",
    "assets/genres/animation_genre.jpg",
    "assets/genres/comedy_genre.jpg",
    "assets/genres/crime_genre.jpg",
    "assets/genres/documentary_genre.jpg",
    "assets/genres/drama_genre.jpg",
    "assets/genres/family_genre.jpg",
    "assets/genres/fantasy_genre.jpg",
    "assets/genres/history_genre.jpg",
    "assets/genres/horror_genre.jpg",
    "assets/genres/music_genre.jpg",
    "assets/genres/mystery_genre.jpg",
    "assets/genres/romance_genre.jpg",
    "assets/genres/science_fiction_genre.jpg",
    "assets/genres/thriller_genre.jpg",
    "assets/genres/tv_movie_genre.jpg",
    "assets/genres/war_genre.jpg",
    "assets/genres/western_genre.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * 0.06,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              "Browse Category",
              style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w600,
                  color: Color(0xffffffff)),
              textAlign: TextAlign.left,
            ),
          ),
          const SizedBox(height: 15),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 3 / 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 15),
                  itemCount: browseImageUrl.length,
                  itemBuilder: (BuildContext context, index) {
                    return GestureDetector(
                      // onTap: () {
                      //   Navigator.pushNamed(
                      //       context, BrowseSpecificCategoryScreen.routeName,
                      //       arguments:
                      //           widget.genreResponseList[index].id.toString());
                      // },
                      onTap: () {
                        Navigator.pushNamed(
                            context, BrowseSpecificCategoryScreen.routeName,
                            arguments: BrowseDM(
                                widget.genreResponseList[index].name!,
                                widget.genreResponseList[index].id.toString()));
                      },
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Opacity(
                              opacity: 0.7,
                              child: Image.asset(
                                browseImageUrl[index],
                                height:
                                    MediaQuery.of(context).size.height * 0.15,
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                          ),
                          Text(
                            widget.genreResponseList[index].name!,
                            style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: Color(0xffffffff)),
                          ),
                        ],
                      ),
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
