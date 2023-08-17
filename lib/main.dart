import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:movies/provider/search_provider.dart';
import 'package:movies/screens/browse_specific_category_screen/browse_specific_category_screen.dart';
import 'package:movies/screens/initial_screen/initial_screen.dart';
import 'package:movies/screens/movie_details_screen/movie_details_screen.dart';
import 'package:movies/screens/sign_in_screen/sign_in_screen.dart';
import 'package:movies/screens/sign_up_screen/sign_up_screen.dart';
import 'package:provider/provider.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ChangeNotifierProvider(
      create: (_) => SearchProvider(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SignInScreen.routeName,
      routes: {
        InitialScreen.routeName: (_) => InitialScreen(),
        SignInScreen.routeName: (_) => SignInScreen(),
        SignUpScreen.routeName: (_) => SignUpScreen(),
        BrowseSpecificCategoryScreen.routeName: (_) => BrowseSpecificCategoryScreen(),
        MovieDetailsScreen.routeName: (_) => MovieDetailsScreen()
      },
    );
  }
}
