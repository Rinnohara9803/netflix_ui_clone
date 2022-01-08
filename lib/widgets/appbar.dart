import 'package:flutter/material.dart';
import 'package:netflix_ui_clone/utils/menu_items.dart';
import 'package:netflix_ui_clone/models/menu_item.dart';

class TheAppBar extends StatefulWidget {
  final VoidCallback openSignInPage;
  final Function openFAQ;
  final VoidCallback openHelp;

  TheAppBar(
    this.openSignInPage,
    this.openFAQ,
    this.openHelp,
  );

  @override
  State<TheAppBar> createState() => _TheAppBarState();
}

class _TheAppBarState extends State<TheAppBar> {
  @override
  Widget build(BuildContext context) {
    PopupMenuItem<MenuItem> buildItem(MenuItem item) {
      return PopupMenuItem<MenuItem>(
        value: item,
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.30,
              child: Text(
                item.menuItemName,
              ),
            ),
          ],
        ),
      );
    }

    void onPressed(BuildContext context, MenuItem item) {
      if (item == MenuItems.firstMenuItem) {
        return widget.openFAQ(context);
      } else if (item == MenuItems.secondMenuItem) {
        return widget.openHelp();
      }
    }

    return Padding(
      padding: const EdgeInsets.only(
        top: 20,
        right: 10,
        left: 10,
      ),
      child: Row(
        children: [
          Container(
            height: 50,
            child: const Image(
              image: AssetImage(
                'images/netflixLogo.png',
              ),
            ),
          ),
          const Spacer(),
          Text(
            'Privacy',
            style: Theme.of(context).textTheme.headline1,
          ),
          const SizedBox(
            width: 15,
          ),
          InkWell(
            onTap: () {
              widget.openSignInPage();
            },
            child: Text(
              'Sign In',
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          PopupMenuButton<MenuItem>(
            onSelected: (item) => onPressed(context, item),
            color: Colors.white,
            icon: const Icon(
              Icons.menu,
              color: Colors.white,
            ),
            itemBuilder: (context) => [
              ...MenuItems.theItems.map(buildItem).toList(),
            ],
          ),
        ],
      ),
    );
  }
}
