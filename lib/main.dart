import 'package:flutter/material.dart';
import 'package:movies/provider/search_provider.dart';
import 'package:movies/screens/browse_specific_category_screen/browse_specific_category_screen.dart';
import 'package:movies/screens/initial_screen/initial_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (_) => SearchProvider(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SearchProvider provider = Provider.of(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        InitialScreen.routeName: (_) => InitialScreen(),
        BrowseSpecificCategoryScreen.routeName: (_) =>
            BrowseSpecificCategoryScreen()
      },
      initialRoute: InitialScreen.routeName,
    );
  }
}
