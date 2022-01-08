import 'package:flutter/material.dart';
import 'package:netflix_ui_clone/screens/movie_preview_page.dart';
import 'package:netflix_ui_clone/screens/video_playing_page.dart';

class TheBottomModalSheet extends StatelessWidget {
  const TheBottomModalSheet({
    Key? key,
    required this.theVideo,
  }) : super(key: key);

  final Map theVideo;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.34,
      child: ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(
              10,
            ),
            height: 200,
            width: double.infinity,
            child: Row(
              children: [
                Flexible(
                  flex: 1,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(
                      5,
                    ),
                    child: Image(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        theVideo['moviePicture'],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Flexible(
                  flex: 3,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            theVideo['movieName'],
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const CircleAvatar(
                              radius: 40,
                              backgroundColor: Colors.grey,
                              child: Center(
                                child: Icon(
                                  Icons.close,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            color: Colors.white,
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            '${theVideo['movieReleaseDate']}    ${theVideo['movieAgeType']}    ${theVideo['movieTime']}',
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 8,
                        ),
                        child: Container(
                          child: Text(
                            theVideo['movieDescription'],
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
            ),
            child: Row(
              children: [
                Flexible(
                  flex: 1,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return VideoPlayingPage(theVideo);
                          },
                        ),
                      );
                    },
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MoviePreviewPage(),
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            5,
                          ),
                          color: Colors.white,
                        ),
                        height: 40,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.play_arrow,
                              color: Colors.black,
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                right: 5,
                              ),
                              child: Text(
                                'Play',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                if (theVideo['type'] == 'series')
                  Flexible(
                    flex: 1,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MoviePreviewPage(),
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            5,
                          ),
                          color: Colors.white,
                        ),
                        height: 40,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.info_outlined,
                              color: Colors.black,
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                right: 5,
                              ),
                              child: Text(
                                'Episodes and Info',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                if (theVideo['type'] == 'movie')
                  Flexible(
                    flex: 1,
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            5,
                          ),
                          color: Colors.white,
                        ),
                        height: 40,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.info_outlined,
                              color: Colors.black,
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                right: 5,
                              ),
                              child: Text(
                                'Info',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
