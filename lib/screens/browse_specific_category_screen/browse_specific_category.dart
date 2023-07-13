import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../model/DiscoverResponseDM.dart';

class BrowseSpecificCategory extends StatefulWidget {
  String categoryName;
  List<Result> browseList;

  BrowseSpecificCategory(this.browseList,this.categoryName);

  @override
  State<BrowseSpecificCategory> createState() => _BrowseSpecificCategoryState();
}

class _BrowseSpecificCategoryState extends State<BrowseSpecificCategory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff121312),
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height*0.08,
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text(
          widget.categoryName,
          style: TextStyle(fontSize: 25,fontWeight: FontWeight.w800, color: Color(0xffFFBB3B),letterSpacing: 5),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: widget.browseList.length,
          itemBuilder: (context, index) {
            return buildMovie(index);
          }),
    );
  }

  Widget buildMovie(int index) {
    return Column(
      children: [
        SizedBox(height: MediaQuery.of(context).size.height * 0.02),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.32,
          width: MediaQuery.of(context).size.width,
          child: Stack(alignment: Alignment.topCenter, children: [
            CachedNetworkImage(
                imageUrl:
                    "https://image.tmdb.org/t/p/w500/${widget.browseList[index].backdropPath}",
                errorWidget: (context, url, error) => Image.asset(
                      "assets/not_found_icon.png",
                    ),
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
                      "https://image.tmdb.org/t/p/w500/${widget.browseList[index].posterPath}",
                  width: MediaQuery.of(context).size.width * 0.37,
                  height: MediaQuery.of(context).size.height * 0.22,
                ),
              ),
            ),
            Positioned(
                top: MediaQuery.of(context).size.height * 0.26,
                right: MediaQuery.of(context).size.width * 0.03,
                child: Text(
                  widget.browseList[index].title ?? "",
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
          ]),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.02),
      ],
    );
  }
}
