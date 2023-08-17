import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies/model/homeDM.dart';

import '../../../../model/PopularResponseDM.dart';
import '../../../movie_details_screen/movie_details_screen.dart';

class HomeTab extends StatefulWidget {
  List<Result> popularListResult;
  List<Result> recommendedListResult;
  List<Result> upcomingResponseList;

  HomeTab(this.popularListResult, this.recommendedListResult,
      this.upcomingResponseList);

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  List<HomeDataModel> popularData = [];
  List<Widget> popularStack = [];
  List<HomeDataModel> recommendedData = [];

  @override
  Widget build(BuildContext context) {
    mapPopular();
    mapRecommended();
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Column(
          children: [
            popularBuild(),
            upcomingBuild(),
            SizedBox(height: MediaQuery.of(context).size.height * 0.015),
            recommendedBuild(),
          ],
        ),
      ),
    );
  }

  Widget popularBuild() {
    return ImageSlideshow(
        height: MediaQuery.of(context).size.height * 0.32,
        width: MediaQuery.of(context).size.width,
        initialPage: 0,
        indicatorColor: Colors.transparent,
        indicatorBackgroundColor: Colors.transparent,
        autoPlayInterval: 5000,
        isLoop: true,
        children: popularStack);
  }

  Widget upcomingBuild() {
    return Container(
      color: const Color(0xff282A28),
      height: MediaQuery.of(context).size.height * 0.25,
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: Text(
              "Upcoming",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xffFFFFFF)),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.upcomingResponseList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6),
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                              context, MovieDetailsScreen.routeName,
                              arguments: HomeDataModel(
                                  title: widget.upcomingResponseList[index].title ??
                                      '',
                                  posterPath: widget.upcomingResponseList[index]
                                          .posterPath ??
                                      '',
                                  releaseDate: widget
                                          .upcomingResponseList[index]
                                          .releaseDate ??
                                      '',
                                  voteAverage: widget
                                          .upcomingResponseList[index]
                                          .voteAverage ??
                                      0,
                                  backdropPath: widget
                                          .upcomingResponseList[index]
                                          .backdropPath ??
                                      '',
                                  id: widget.upcomingResponseList[index].id ?? 0,
                                  overview: widget.upcomingResponseList[index].overview ?? ''));
                        },
                        child: Stack(
                          alignment: Alignment.topLeft,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child: CachedNetworkImage(
                                imageUrl:
                                    "https://image.tmdb.org/t/p/w500/${widget.upcomingResponseList[index].posterPath}",
                                fit: BoxFit.fill,
                                height:
                                    MediaQuery.of(context).size.height * 0.18,
                                width: MediaQuery.of(context).size.width * 0.29,
                              ),
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child:
                                  SvgPicture.asset("assets/bookmark_icon.svg"),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }

  Widget recommendedBuild() {
    return Container(
      color: const Color(0xff282A28),
      height: MediaQuery.of(context).size.height * 0.30,
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: Text(
              "Recommended",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xffFFFFFF)),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: recommendedData.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                            context, MovieDetailsScreen.routeName,
                            arguments: recommendedData[index]);
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 7),
                        color: const Color(0xff343534),
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: CachedNetworkImage(
                                    imageUrl:
                                        "https://image.tmdb.org/t/p/w500/${recommendedData[index].posterPath}",
                                    fit: BoxFit.fill,
                                    height: MediaQuery.of(context).size.height *
                                        0.17,
                                    width: MediaQuery.of(context).size.width *
                                        0.29,
                                  ),
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: SvgPicture.asset(
                                        "assets/bookmark_icon.svg"),
                                  ),
                                )
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 1),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      Icons.star,
                                      color: Color(0xffFFBB3B),
                                    ),
                                    const SizedBox(width: 5),
                                    Text(
                                      "${recommendedData[index].voteAverage}",
                                      style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xffffffff)),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.29,
                                  child: Text(
                                    recommendedData[index].title,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xffffffff)),
                                    softWrap: false,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  ),
                                ),
                                Text(
                                  recommendedData[index]
                                      .releaseDate
                                      .split('-')
                                      .first,
                                  style:
                                      const TextStyle(color: Color(0xffB5B4B4)),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }

  mapRecommended() {
    recommendedData = widget.recommendedListResult
        .map((e) => HomeDataModel(
            title: e.title ?? '',
            posterPath: e.posterPath ?? '',
            releaseDate: e.releaseDate ?? '',
            voteAverage: e.voteAverage ?? 0,
            backdropPath: e.backdropPath ?? '',
            overview: e.overview ?? '',
            id: e.id ?? 0))
        .toList();
  }

  mapPopular() {
    popularData = widget.popularListResult
        .map((e) => HomeDataModel(
              backdropPath: e.backdropPath ?? "",
              posterPath: e.posterPath ?? "",
              title: e.title ?? "",
              id: e.id ?? 0,
              voteAverage: e.voteAverage ?? 0,
              overview: e.overview ?? '',
              releaseDate: e.releaseDate ?? '',
            ))
        .toList();
    popularStack = popularData
        .map((e) => InkWell(
              onTap: () {
                Navigator.pushNamed(context, MovieDetailsScreen.routeName,
                    arguments: e);
              },
              child: Stack(alignment: Alignment.topCenter, children: [
                CachedNetworkImage(
                    imageUrl:
                        "https://image.tmdb.org/t/p/w500/${e.backdropPath}",
                    fit: BoxFit.fill,
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.25),
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.1,
                  child: SvgPicture.asset("assets/play_button.svg",
                      height: MediaQuery.of(context).size.height * 0.07),
                ),
                Align(
                  alignment: AlignmentDirectional.bottomStart,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: CachedNetworkImage(
                      imageUrl:
                          "https://image.tmdb.org/t/p/w500/${e.posterPath}",
                      width: MediaQuery.of(context).size.width * 0.37,
                      height: MediaQuery.of(context).size.height * 0.22,
                    ),
                  ),
                ),
                Positioned(
                    top: MediaQuery.of(context).size.height * 0.26,
                    right: MediaQuery.of(context).size.width * 0.03,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: Text(
                        e.title,
                        style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Color(0xffFFFFFF),
                            overflow: TextOverflow.visible),
                      ),
                    )),
                Positioned(
                    top: MediaQuery.of(context).size.height * 0.29,
                    right: MediaQuery.of(context).size.width * 0.1,
                    child: Text(
                      e.releaseDate.split('-').first,
                      style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: Color(0xffB5B4B4)),
                    ))
              ]),
            ))
        .toList();
  }
}
