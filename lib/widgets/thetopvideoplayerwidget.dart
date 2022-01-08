import 'dart:math';

import 'package:flutter/material.dart';
import 'package:netflix_ui_clone/screens/video_playing_page.dart';
import 'package:netflix_ui_clone/widgets/bottommodalsheet.dart';

class TheTopVideoPlayerSliverWidget extends StatefulWidget {
  const TheTopVideoPlayerSliverWidget({
    Key? key,
    required this.theHeight,
    required this.theWidth,
    required this.theVideos,
  }) : super(key: key);

  final double theHeight;
  final double theWidth;
  final List theVideos;

  static void showBottomSheet(BuildContext theContext, Map theVideo) {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      backgroundColor: Colors.grey[900],
      context: theContext,
      builder: (context) {
        return TheBottomModalSheet(
          theVideo: theVideo,
        );
      },
    );
  }

  @override
  State<TheTopVideoPlayerSliverWidget> createState() =>
      _TheTopVideoPlayerSliverWidgetState();
}

class _TheTopVideoPlayerSliverWidgetState
    extends State<TheTopVideoPlayerSliverWidget> {
  var random = Random();

  @override
  Widget build(BuildContext context) {
    int randomNumber = random.nextInt(4);
    final theTransparentContainer = Container(
      height: widget.theHeight * 0.7,
      decoration: BoxDecoration(
        color: Colors.white,
        gradient: LinearGradient(
          begin: FractionalOffset.topCenter,
          end: FractionalOffset.bottomCenter,
          colors: [
            Colors.grey.withOpacity(0.0),
            Colors.black,
          ],
          stops: const [0.0, 1.0],
        ),
      ),
    );

    final theVideoImage = Image(
      fit: BoxFit.cover,
      image: NetworkImage(
        widget.theVideos[randomNumber]['moviePicture'],
      ),
    );

    return SliverToBoxAdapter(
      child: Container(
        color: Colors.white,
        height: widget.theHeight * 0.7,
        width: double.infinity,
        child: Stack(
          fit: StackFit.expand,
          children: [
            theVideoImage,
            theTransparentContainer,
            Positioned(
              bottom: 10,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Flexible(
                    flex: 1,
                    child: Column(
                      children: const [
                        Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 30,
                        ),
                        Text(
                          'Add to Favourites',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 11,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return VideoPlayingPage(
                                widget.theVideos[randomNumber],
                              );
                            },
                          ),
                        );
                      },
                      child: Center(
                        child: Container(
                          height: 40,
                          width: 90,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(
                              5,
                            ),
                          ),
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
                  Flexible(
                    flex: 1,
                    child: InkWell(
                      onTap: () {
                        TheTopVideoPlayerSliverWidget.showBottomSheet(
                            context, widget.theVideos[randomNumber]);
                      },
                      child: Column(
                        children: const [
                          Icon(
                            Icons.info,
                            color: Colors.white,
                            size: 30,
                          ),
                          Text(
                            'Info',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 11,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 80,
              child: Container(
                padding: const EdgeInsets.all(
                  8,
                ),
                child: Row(
                  children: widget.theVideos[randomNumber]['movieGenres']
                      .map<Widget>((movieGenre) {
                    if (widget.theVideos[randomNumber]['movieGenres']
                            .indexOf(movieGenre) ==
                        0) {
                      return Padding(
                        padding: const EdgeInsets.only(
                          right: 5,
                        ),
                        child: Text(
                          movieGenre,
                          style: const TextStyle(
                            color: Colors.white,
                            letterSpacing: 1,
                            fontSize: 10,
                          ),
                        ),
                      );
                    } else {
                      return Padding(
                        padding: const EdgeInsets.only(
                          right: 5,
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.circle,
                              color: Colors.white,
                              size: 4,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              movieGenre,
                              style: const TextStyle(
                                color: Colors.white,
                                letterSpacing: 1,
                                fontSize: 10,
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
