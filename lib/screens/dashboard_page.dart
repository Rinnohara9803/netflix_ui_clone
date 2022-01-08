import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:netflix_ui_clone/screens/favourites_page.dart';
import 'package:netflix_ui_clone/screens/help_page.dart';
import 'package:netflix_ui_clone/screens/home_page.dart';
import 'package:netflix_ui_clone/screens/sign_in_page.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  static String pathName = '/dashboard';

  @override
  _DashBoardState createState() => _DashBoardState();
}

Widget tabBuilder(IconData icon, String text) {
  return Tab(
    icon: Icon(
      icon,
      size: 23,
    ),
    text: text,
  );
}

Future setPortrait() async {
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
}

class _DashBoardState extends State<DashBoard> {
  @override
  void initState() {
    setPortrait();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theHeight = MediaQuery.of(context).size.height;
    return DefaultTabController(
      length: 2,
      child: SafeArea(
        child: Scaffold(
          bottomNavigationBar: Container(
            // height: theHeight * 0.07,
            color: Colors.grey[850],
            child: TabBar(
              labelStyle: const TextStyle(
                fontSize: 11,
              ),
              labelColor: Colors.white,
              unselectedLabelColor: Colors.grey,
              tabs: [
                tabBuilder(Icons.home, 'Home'),
                tabBuilder(Icons.star, 'Favourites'),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              HomePage(),
              Favourites(),
            ],
          ),
        ),
      ),
    );
  }
}
