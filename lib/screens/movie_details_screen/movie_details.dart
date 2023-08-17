import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movies/model/SimilarResponseDM.dart';

import '../../model/homeDM.dart';
import 'movie_details_screen.dart';

class MovieDetails extends StatefulWidget {
  List<Result> listSimilarItem;
  List<String> listOfGenre;
  HomeDataModel args;

  MovieDetails(this.args, this.listSimilarItem, this.listOfGenre);

  @override
  State<MovieDetails> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff121312),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          widget.args.title,
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 3,
            child: Stack(
              alignment: Alignment.center,
              children: [
                CachedNetworkImage(
                  imageUrl:
                      "https://image.tmdb.org/t/p/w500/${widget.args.backdropPath}",
                  errorWidget: (context, url, error) =>
                      Image.asset("assets/not_found_icon.png"),
                  fit: BoxFit.fitWidth,
                  width: double.infinity,
                ),
                SvgPicture.asset("assets/play_button.svg"),
              ],
            ),
          ),
          Expanded(
            flex: 8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 12),
                  child: Text(
                    widget.args.title,
                    style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                    maxLines: 1,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    widget.args.releaseDate.split('-').first,
                    style:
                        const TextStyle(fontSize: 15, color: Color(0xffB5B4B4)),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 4,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child: CachedNetworkImage(
                                imageUrl:
                                    "https://image.tmdb.org/t/p/w500/${widget.args.posterPath}",
                                errorWidget: (context, url, error) =>
                                    const Image(
                                  image:
                                      AssetImage("assets/not_found_icon.png"),
                                  fit: BoxFit.fitHeight,
                                ),
                                fit: BoxFit.fill,
                                height:
                                    MediaQuery.of(context).size.height * 0.23,
                                width: MediaQuery.of(context).size.width * 0.32,
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
                    ),
                    Expanded(
                      flex: 6,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Row(
                            children: [
                              buildGenre(0),
                              const SizedBox(width: 10),
                              buildGenre(1),
                              const SizedBox(width: 10),
                              buildGenre(2)
                            ],
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              buildGenre(3),
                              const SizedBox(width: 10),
                              buildGenre(4),
                              const SizedBox(width: 10),
                              buildGenre(5)
                            ],
                          ),
                          const SizedBox(height: 5),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.09,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Text(
                                widget.args.overview,
                                style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xffCBCBCB)),
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.star,
                                color: Color(0xffFFBB3B),
                                size: 27,
                              ),
                              const SizedBox(width: 5),
                              Text(
                                "${widget.args.voteAverage == 0 ? "unknown" : widget.args.voteAverage?.toStringAsFixed(1)}",
                                style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xffffffff)),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    color: const Color(0xff282A28),
                    height: MediaQuery.of(context).size.height * 0.29,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 15.0, vertical: 8),
                          child: Text(
                            "More Like This",
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
                                itemCount: widget.listSimilarItem.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Container(
                                    decoration: BoxDecoration(
                                        color: const Color(0xff343534),
                                        borderRadius: BorderRadius.circular(4)),
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 7),
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.pushNamed(
                                            context, MovieDetailsScreen.routeName,
                                            arguments: HomeDataModel(
                                                title:
                                                    widget.listSimilarItem[index].title ??
                                                        '',
                                                posterPath: widget
                                                        .listSimilarItem[index]
                                                        .posterPath ??
                                                    '',
                                                releaseDate: widget
                                                        .listSimilarItem[index]
                                                        .releaseDate ??
                                                    '',
                                                voteAverage: widget
                                                        .listSimilarItem[index]
                                                        .voteAverage ??
                                                    0,
                                                backdropPath: widget
                                                        .listSimilarItem[index]
                                                        .backdropPath ??
                                                    '',
                                                id: widget.listSimilarItem[index].id ?? 0,
                                                overview: widget.listSimilarItem[index].overview ?? ''));
                                      },
                                      child: Column(
                                        children: [
                                          Stack(
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                child: CachedNetworkImage(
                                                  imageUrl:
                                                      "https://image.tmdb.org/t/p/w500/${widget.listSimilarItem[index].posterPath}",
                                                  errorWidget: (context, url,
                                                          error) =>
                                                      const Image(
                                                          image: AssetImage(
                                                              "assets/not_found_icon.png")),
                                                  fit: BoxFit.fill,
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.17,
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.29,
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
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const SizedBox(height: 1),
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  const Icon(
                                                    Icons.star,
                                                    color: Color(0xffFFBB3B),
                                                  ),
                                                  const SizedBox(width: 5),
                                                  Text(
                                                    "${widget.listSimilarItem[index].voteAverage == 0 ? "unknown" : widget.listSimilarItem[index].voteAverage?.toStringAsFixed(1)}",
                                                    style: const TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color:
                                                            Color(0xffffffff)),
                                                  )
                                                ],
                                              ),
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.29,
                                                child: Text(
                                                  widget.listSimilarItem[index]
                                                          .title ??
                                                      '',
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Color(0xffffffff)),
                                                  softWrap: false,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 1,
                                                ),
                                              ),
                                              Text(
                                                widget.listSimilarItem[index]
                                                    .releaseDate!
                                                    .split('-')
                                                    .first,
                                                style: const TextStyle(
                                                    color: Color(0xffB5B4B4)),
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
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  buildGenre(int index) {
    return Expanded(
      child: Visibility(
        visible: isGenreFound(index),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: const Color(0xff514F4F), width: 1)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              isGenreFound(index) ? widget.listOfGenre[index] : '',
              style: const TextStyle(
                  fontSize: 14,
                  color: Color(0xffCBCBCB),
                  overflow: TextOverflow.ellipsis),
            ),
          ),
        ),
      ),
    );
  }

  bool isGenreFound(int index) {
    return widget.listOfGenre.length > index;
  }
}
