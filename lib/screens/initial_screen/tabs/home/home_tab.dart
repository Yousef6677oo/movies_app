import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies/model/LatestResponseDM.dart';
import 'package:movies/model/recommendedDM.dart';

import '../../../../model/PopularResponseDM.dart';
import '../../../../model/popularDM.dart';

class HomeTab extends StatefulWidget {
  List<Result> popularListResult;
  LatestDM releaseResult;
  List<Result> recommendedListResult;

  HomeTab(
      this.popularListResult, this.releaseResult, this.recommendedListResult);

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  List<PopularDataModel> popularData = [];
  List<Stack> popularStack = [];
  List<RecommendedDataModel> recommendedData = [];
  List<String> releasesImages = [
    "assets/releases_1_test.png",
    "assets/releases_2_test.png",
    "assets/releases_3_test.png",
    "assets/releases_4_test.png"
  ];
  List<String> recommendedImages = [
    "assets/releases_2_test.png",
    "assets/releases_2_test.png",
    "assets/releases_2_test.png",
    "assets/releases_2_test.png"
  ];

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
            newReleasesBuild(),
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

  Widget newReleasesBuild() {
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
              "New Releases",
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
                  itemCount: releasesImages.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6),
                      child: Stack(
                        children: [
                          //todo: change image asset to url and get data from api
                          Image.asset(
                            releasesImages[index],
                            fit: BoxFit.fill,
                            height: MediaQuery.of(context).size.height * 0.18,
                            width: MediaQuery.of(context).size.width * 0.29,
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: SvgPicture.asset("assets/bookmark_icon.svg"),
                          )
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
                  itemCount: recommendedImages.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
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
                                  height:
                                      MediaQuery.of(context).size.height * 0.17,
                                  width:
                                      MediaQuery.of(context).size.width * 0.29,
                                ),
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: SvgPicture.asset(
                                    "assets/bookmark_icon.svg"),
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
                                width: MediaQuery.of(context).size.width * 0.29,
                                child: Text(
                                  recommendedData[index].title,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xffffffff)),
                                  softWrap: false,
                                  overflow: TextOverflow.clip,
                                  maxLines: 1,
                                ),
                              ),
                              Text(
                                recommendedData[index].releaseDate,
                                style:
                                    const TextStyle(color: Color(0xffB5B4B4)),
                              )
                            ],
                          )
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

  mapRecommended() {
    recommendedData = widget.recommendedListResult
        .map((e) => RecommendedDataModel(
              title: e.title ?? '',
              posterPath: e.posterPath ?? '',
              releaseDate: e.releaseDate ?? '',
              voteAverage: e.voteAverage ?? 0,
            ))
        .toList();
  }

  mapPopular() {
    popularData = widget.popularListResult
        .map((e) => PopularDataModel(
              backdropPath: e.backdropPath ?? "",
              posterPath: e.posterPath ?? "",
              title: e.title ?? "",
            ))
        .toList();
    popularStack = popularData
        .map((e) => Stack(alignment: Alignment.topCenter, children: [
              CachedNetworkImage(
                  imageUrl: "https://image.tmdb.org/t/p/w500/${e.backdropPath}",
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
                    imageUrl: "https://image.tmdb.org/t/p/w500/${e.posterPath}",
                    width: MediaQuery.of(context).size.width * 0.37,
                    height: MediaQuery.of(context).size.height * 0.22,
                  ),
                ),
              ),
              Positioned(
                  top: MediaQuery.of(context).size.height * 0.26,
                  right: MediaQuery.of(context).size.width * 0.03,
                  child: Text(
                    e.title,
                    style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Color(0xffFFFFFF)),
                  )),
              Positioned(
                  top: MediaQuery.of(context).size.height * 0.29,
                  right: MediaQuery.of(context).size.width * 0.37,
                  child: const Text(
                    "2019  PG-13",
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: Color(0xffB5B4B4)),
                  ))
            ]))
        .toList();
  }
}
