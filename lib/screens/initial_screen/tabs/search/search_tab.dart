import 'package:flutter/material.dart';

class SearchTab extends StatefulWidget {
  static String routeName = "searchScreen";

  @override
  State<SearchTab> createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  TextEditingController searchController = TextEditingController();
  List<String> testList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          toolbarHeight: MediaQuery.of(context).size.height * 0.12,
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: SizedBox(
            width: double.infinity,
            height: 80,
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
        body: testList.isEmpty
            ? buildNotFoundNews()
            : ListView.builder(
                itemCount: testList.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: 200,
                    height: 200,
                    color: Colors.lightGreenAccent,
                    child: Text(testList[index]),
                  );
                }));
  }

  Widget buildSearchTextField() {
    return TextField(
      onSubmitted: (value) {
        setState(() {

        });
      },
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
              setState(() {});
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
    return searchController.text == ""
        ? Container()
        : Column(
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
