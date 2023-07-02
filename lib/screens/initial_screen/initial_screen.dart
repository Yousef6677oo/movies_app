import 'package:flutter/material.dart';
import 'package:movies/screens/initial_screen/tabs/browse/browse_tab.dart';
import 'package:movies/screens/initial_screen/tabs/home/home_tab.dart';
import 'package:movies/screens/initial_screen/tabs/search/search_tab.dart';
import 'package:movies/screens/initial_screen/tabs/watchlist/watchlist_tab.dart';
import 'package:movies/utilities/app_colors.dart';

class InitialScreen extends StatefulWidget {
  static String routeName = "initial screen";

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  int currentIndex = 0;

  List<Widget> tabs = [HomeTab(), SearchTab(), BrowseTab(), WatchlistTab()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
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
        onTap: (index){
          currentIndex=index;
          setState(() {

          });
        },
        selectedItemColor: AppColors.selectedTabColor,
        unselectedItemColor: AppColors.unselectedTabColor,
        showUnselectedLabels: true,
        showSelectedLabels: true,
        //selectedFontSize: 15,
        //unselectedFontSize: 15,
        selectedLabelStyle: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold
        ),
        unselectedLabelStyle: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold
        ),
        //landscapeLayout: BottomNavigationBarLandscapeLayout.linear,
        items: [
          BottomNavigationBarItem(
              label: "HOME",
              icon: const ImageIcon(AssetImage("assets/home_icon.png"))),
          const BottomNavigationBarItem(
              label: "SEARCH",
              icon: ImageIcon(AssetImage("assets/search_icon.png"))),
          const BottomNavigationBarItem(
              label: "BROWSE",
              icon: ImageIcon(AssetImage("assets/browse_icon.png"))),
          const BottomNavigationBarItem(
              label: "WATCHLIST",
              icon: ImageIcon(AssetImage("assets/watchlist_icon.png")))
        ],
      ),
    );
  }
}
