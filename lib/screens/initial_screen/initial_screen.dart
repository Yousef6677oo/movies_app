import 'package:flutter/material.dart';
import 'package:movies/screens/initial_screen/tabs/browse/browse_specific_category_tab_screen.dart';
import 'package:movies/screens/initial_screen/tabs/browse/browse_tab_screen.dart';
import 'package:movies/screens/initial_screen/tabs/home/home_tab_screen.dart';
import 'package:movies/screens/initial_screen/tabs/search/search_tab_screen.dart';
import 'package:movies/screens/initial_screen/tabs/watchlist/watchlist_tab.dart';
import 'package:movies/utilities/app_colors.dart';

class InitialScreen extends StatefulWidget {
  static String routeName = "initial screen";

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  int currentIndex = 0;

  List<Widget> tabs = [
    HomeTabScreen(),
    SearchTabScreen(),
    BrowseTabScreen(),
    WatchlistTab(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        child: tabs[currentIndex],
      ),
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
}
