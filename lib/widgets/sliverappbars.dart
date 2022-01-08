import 'package:flutter/material.dart';

class TheSliverAppBar1 extends StatelessWidget {
  const TheSliverAppBar1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      elevation: 0,
      backgroundColor: Colors.white.withOpacity(0.3),
      pinned: true,
      leading: Container(),
      title: Row(
        children: const [
          Text(
            'More options',
            style: TextStyle(
              fontSize: 17,
              color: Colors.white,
              letterSpacing: 2,
            ),
          ),
          Icon(
            Icons.arrow_circle_down_rounded,
          ),
        ],
      ),
    );
  }
}

class TheSliverAppBar extends StatelessWidget {
  const TheSliverAppBar({
    Key? key,
    required this.profilePicPath,
  }) : super(key: key);

  final String profilePicPath;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      elevation: 0,
      backgroundColor: Colors.white.withOpacity(0.3),
      leading: const Image(
        image: AssetImage(
          'images/netflixLogo.png',
        ),
      ),
      actions: [
        const Icon(Icons.search),
        const SizedBox(
          width: 20,
        ),
        const Icon(Icons.filter_list_alt),
        const SizedBox(
          width: 20,
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(
            10,
          ),
          child: Image(
            height: 25,
            width: 25,
            fit: BoxFit.contain,
            image: NetworkImage(
              profilePicPath,
            ),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
      ],
    );
  }
}
