import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:netflix_ui_clone/screens/dashboard_page.dart';
import 'package:netflix_ui_clone/screens/get_started_page.dart';
import 'package:netflix_ui_clone/screens/movie_preview_page.dart';
import 'package:netflix_ui_clone/screens/practice_page.dart';
import 'package:netflix_ui_clone/screens/profile_pin_page.dart';
import 'package:netflix_ui_clone/screens/profile_page.dart';
import 'package:netflix_ui_clone/screens/sign_in_page.dart';
import 'package:netflix_ui_clone/screens/splash_screen_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
    ],
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.redAccent[700],
        textTheme: const TextTheme(
          button: TextStyle(
            letterSpacing: 2,
            color: Colors.white,
            fontSize: 20,
          ),
          headline1: TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
          headline2: TextStyle(
            letterSpacing: 2,
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
          headline3: TextStyle(
            color: Colors.white24,
            fontSize: 15,
            letterSpacing: 1,
          ),
        ),
      ),
      home: const SplashScreen(),
      routes: {
        SignInPage.pathName: (context) => const SignInPage(),
        ProfilePage.pathName: (context) => const ProfilePage(),
        ProfilePin.pathName: (context) => const ProfilePin(),
        DashBoard.pathName: (context) => const DashBoard(),
      },
    );
  }
}
