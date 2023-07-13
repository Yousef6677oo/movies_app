import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../model/SearchResponseDM.dart';
import '../../../../provider/search_provider.dart';

class SearchTab extends StatefulWidget {
  static String routeName = "searchScreen";
  List<Result> searchResultList;

  SearchTab(this.searchResultList);

  @override
  State<SearchTab> createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  TextEditingController searchController = TextEditingController();
  late SearchProvider provider;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of(context);
    print("SearchTab: ${widget.searchResultList.isEmpty}");
    return Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          toolbarHeight: MediaQuery.of(context).size.height * 0.12,
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: SizedBox(
            width: double.infinity,
            child: Center(
              child: buildSearchTextField(),
            ),
          ),
          automaticallyImplyLeading: false,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(50),
              )),
        ),
        body: widget.searchResultList.isEmpty
            ? buildNotFoundNews()
            : ListView.builder(
                itemCount: widget.searchResultList.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Row(
                        children: [
                          const Spacer(
                            flex: 1,
                          ),
                          Expanded(
                              flex: 8,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: CachedNetworkImage(
                                  errorWidget: (context, url, error) =>
                                      Image.asset(
                                    "assets/not_found_icon.png",
                                    width: 300,
                                    height: 100,
                                  ),
                                  imageUrl:
                                      "https://image.tmdb.org/t/p/w500/${widget.searchResultList[index].backdropPath}",
                                  width: 300,
                                  height: 100,
                                ),
                              )),
                          const Spacer(
                            flex: 1,
                          ),
                          Expanded(
                            flex: 6,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Text(
                                    widget.searchResultList[index]
                                            .originalTitle ??
                                        '',
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white),
                                  ),
                                ),
                                Text(
                                    widget.searchResultList[index]
                                            .releaseDate ??
                                        '',
                                    style: const TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white)),
                              ],
                            ),
                          ),
                          const Spacer(
                            flex: 1,
                          ),
                        ],
                      ),
                      const Divider(
                        indent: 20,
                        endIndent: 20,
                        thickness: 2,
                        color: Color(0xff707070),
                      )
                    ],
                  );
                }));
  }

  Widget buildSearchTextField() {
    return TextField(
      onSubmitted: (value) {
        provider.search(searchController.text);
      },
      cursorColor: const Color(0xffFFBB3B),
      controller: searchController,
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xff514F4F),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(width: 1, color: Color(0xffB5B4B4)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(width: 1, color: Color(0xffB5B4B4)),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        prefixIcon: GestureDetector(
            onTap: () {
              provider.search(searchController.text);
            },
            child: Image.asset("assets/search.png")),
        prefixIconColor: const Color(0xffffffff),
        hintText: 'Search',
        hintStyle: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Color(0xff707070)),
      ),
    );
  }

  Widget buildNotFoundNews() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          "assets/not_found_icon.png",
          height: MediaQuery.of(context).size.height * 0.15,
        ),
        const Text("No movies found",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Color(0xff707070)),
            textAlign: TextAlign.center),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.05,
        )
      ],
    );
  }
}
