import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class HomeTab extends StatefulWidget {
  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
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
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        children: [
          popularBuild(),
          newReleasesBuild(),
          SizedBox(height: MediaQuery.of(context).size.height * 0.01),
          recommendedBuild(),
        ],
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
      children: [
        Stack(alignment: Alignment.topCenter, children: [
          //todo: change image asset to url and get data from api
          Image.asset("assets/home_test_image.png",
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.25),
          Image.asset("assets/play_button.png",
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.24),
          Align(
            alignment: AlignmentDirectional.bottomStart,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              //todo: change image asset to url and get data from api
              child: Image.asset(
                "assets/poster_test_image.png",
                width: MediaQuery.of(context).size.width * 0.37,
                height: MediaQuery.of(context).size.height * 0.22,
              ),
            ),
          ),
          Positioned(
              top: MediaQuery.of(context).size.height * 0.26,
              right: MediaQuery.of(context).size.width * 0.03,
              child: const Text(
                "Dora and the lost city of gold",
                style: TextStyle(
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
        ])
      ],
    );
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
                            child: Image.asset("assets/not_added_icon.png"),
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
                      margin: const EdgeInsets.symmetric(
                          vertical: 2, horizontal: 7),
                      color: const Color(0xff343534),
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              //todo: change image asset to url and get data from api
                              Image.asset(
                                recommendedImages[index],
                                fit: BoxFit.fill,
                                height:
                                    MediaQuery.of(context).size.height * 0.17,
                                width: MediaQuery.of(context).size.width * 0.29,
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Image.asset("assets/not_added_icon.png"),
                              )
                            ],
                          ),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 1),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Color(0xffFFBB3B),
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    "7.7",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xffffffff)),
                                  )
                                ],
                              ),
                              Text(
                                "Deadpool 2",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xffffffff)),
                              ),
                              Text(
                                "2018 R 1h 59m",
                                style: TextStyle(color: Color(0xffB5B4B4)),
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
}
