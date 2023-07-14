import 'package:flutter/material.dart';
import 'package:movies/screens/initial_screen/tabs/browse/browse_tab_screen.dart';
import 'package:movies/screens/initial_screen/tabs/home/home_tab_screen.dart';
import 'package:movies/screens/initial_screen/tabs/search/search_tab_screen.dart';
import 'package:movies/screens/initial_screen/tabs/watchlist/watchlist_tab.dart';
import 'package:movies/utilities/app_colors.dart';
import 'package:provider/provider.dart';

import '../../provider/search_provider.dart';

class InitialScreen extends StatefulWidget {
  static String routeName = "initial screen";

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  static String searchQuery = "";

  int currentIndex = 0;

  // List<Widget> tabs = [
  //   HomeTabScreen(),
  //   SearchTabScreen(searchQuery),
  //   BrowseTabScreen(),
  //   WatchlistTab(),
  // ];

  @override
  Widget build(BuildContext context) {
    SearchProvider provider = Provider.of(context);
    searchQuery = provider.query;
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(child: changeTap()),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.bottomNavigationBarItemColor,
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: (index) {
          currentIndex = index;
          setState(() {});
        },
        selectedItemColor: AppColors.selectedTabColor,
        unselectedItemColor: AppColors.unselectedTabColor,
        showUnselectedLabels: true,
        showSelectedLabels: true,
        selectedLabelStyle:
            const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        unselectedLabelStyle:
            const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        items: const [
          BottomNavigationBarItem(
              label: "HOME",
              icon: ImageIcon(AssetImage("assets/home_icon.png"))),
          BottomNavigationBarItem(
              label: "SEARCH",
              icon: ImageIcon(AssetImage("assets/search_icon.png"))),
          BottomNavigationBarItem(
              label: "BROWSE",
              icon: ImageIcon(AssetImage("assets/browse_icon.png"))),
          BottomNavigationBarItem(
              label: "WATCHLIST",
              icon: ImageIcon(AssetImage("assets/watchlist_icon.png")))
        ],
      ),
    );
  }

  Widget changeTap() {
    if (currentIndex == 0) {
      return HomeTabScreen();
    } else if (currentIndex == 1) {
      return SearchTabScreen(searchQuery);
    } else if (currentIndex == 2) {
      return BrowseTabScreen();
    } else {
      return WatchlistTab();
    }
  }
}
