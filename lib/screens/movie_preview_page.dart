import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_ui_clone/const.dart';

class MoviePreviewPage extends StatefulWidget {
  const MoviePreviewPage({
    Key? key,
    // required this.theMovie,
  }) : super(key: key);

  // final Map theMovie;

  @override
  _MoviePreviewPageState createState() => _MoviePreviewPageState();
}

class _MoviePreviewPageState extends State<MoviePreviewPage> {
  List<Map> theMovie = [
    {
      'movieName': 'Samurai Champloo',
      'type': 'series',
      'noOfSeasons': 2,
      'episodeList': 24,
      'releaseDate': '2021',
      'ratedFor': '18+',
      'seasons': [
        {
          'seasonName': 'Season 1',
          'episodes': [
            {
              'episodeName': 'Episode 1',
              'episodeTitle': 'The First Episode',
              'episodeDescription': 'The episode 1 continues',
              'episodeDuration': '23 mins',
              'episodePath': 'videos/onePieceMovie.mp4',
            },
            {
              'episodeName': 'Episode 2',
              'episodeTitle': 'The Second Episode',
              'episodeDescription': 'The episode 2 continues',
              'episodeDuration': '24 mins',
              'episodePath': 'videos/onePieceMovie.mp4',
            },
            {
              'episodeName': 'Episode 3',
              'episodeTitle': 'The Third Episode',
              'episodeDescription': 'The episode 3 continues',
              'episodeDuration': '20 mins',
              'episodePath': 'videos/onePieceMovie.mp4',
            },
            {
              'episodeName': 'Episode 4',
              'episodeTitle': 'The Fourth Episode',
              'episodeDescription': 'The episode  4continues',
              'episodeDuration': '22 mins',
              'episodePath': 'videos/onePieceMovie.mp4',
            },
            {
              'episodeName': 'Episode 5',
              'episodeTitle': 'The Fifth Episode',
              'episodeDescription': 'The episode 5 continues',
              'episodeDuration': '20 mins',
              'episodePath': 'videos/onePieceMovie.mp4',
            },
            {
              'episodeName': 'Episode 6',
              'episodeTitle': 'The Sixth Episode',
              'episodeDescription': 'The episode 6 continues',
              'episodeDuration': '23 mins',
              'episodePath': 'videos/onePieceMovie.mp4',
            },
          ]
        },
        {
          'seasonName': 'Season 2',
          'episodes': [
            {
              'episodeName': 'Episode 1',
              'episodeTitle': 'The First Episode',
              'episodeDescription': 'The episode 1 continues',
              'episodeDuration': '23 mins',
              'episodePath': 'videos/onePieceMovie.mp4',
            },
            {
              'episodeName': 'Episode 2',
              'episodeTitle': 'The Second Episode',
              'episodeDescription': 'The episode 2 continues',
              'episodeDuration': '24 mins',
              'episodePath': 'videos/onePieceMovie.mp4',
            },
            {
              'episodeName': 'Episode 3',
              'episodeTitle': 'The Third Episode',
              'episodeDescription': 'The episode 3 continues',
              'episodeDuration': '20 mins',
              'episodePath': 'videos/onePieceMovie.mp4',
            },
            {
              'episodeName': 'Episode 4',
              'episodeTitle': 'The Fourth Episode',
              'episodeDescription': 'The episode  4continues',
              'episodeDuration': '22 mins',
              'episodePath': 'videos/onePieceMovie.mp4',
            },
            {
              'episodeName': 'Episode 5',
              'episodeTitle': 'The Fifth Episode',
              'episodeDescription': 'The episode 5 continues',
              'episodeDuration': '20 mins',
              'episodePath': 'videos/onePieceMovie.mp4',
            },
            {
              'episodeName': 'Episode 6',
              'episodeTitle': 'The Sixth Episode',
              'episodeDescription': 'The episode 6 continues',
              'episodeDuration': '23 mins',
              'episodePath': 'videos/onePieceMovie.mp4',
            },
          ]
        }
      ],
      'moviePicture':
          'https://m.media-amazon.com/images/M/MV5BOWNhMDMyMDYtNzJlOS00YzhhLWFiMjktYWY1MzMzZGZhOGRjXkEyXkFqcGdeQXVyNDYzNTI2ODc@._V1_.jpg',
      'movieGenres': [
        'Adventure Fiction',
        'Fantasy',
        'Pirates',
      ],
      'moviePicture1':
          'https://m.media-amazon.com/images/M/MV5BOWNhMDMyMDYtNzJlOS00YzhhLWFiMjktYWY1MzMzZGZhOGRjXkEyXkFqcGdeQXVyNDYzNTI2ODc@._V1_.jpg',
      'movieDescription':
          'Set in Gran Tesoro, an independent country chartered by the World Government, home of the world\'s greatest entertainment city where well-known pirates, Marines, and millionaires throughout the world gather in an "absolute sanctuary" that even the World Government cannot touch.',
    },
  ];

  String selectedEpisode = 'Season 1';
  List<DropdownMenuItem<String>> episodes = const [
    DropdownMenuItem(
      child: Text('Season 1'),
      value: 'Season 1',
    ),
    DropdownMenuItem(
      child: Text('Season 2'),
      value: 'Season 2',
    ),
    DropdownMenuItem(
      child: Text('Season 3'),
      value: 'Season 3',
    ),
    DropdownMenuItem(
      child: Text('The Bloody Arc'),
      value: 'The Bloody Arc',
    ),
  ];

  Widget textWidget(String text) {
    return Text(
      text,
      style: const TextStyle(
        color: Colors.white54,
      ),
    );
  }

  Widget theFlexWidget1(String theText, IconData iconData) {
    return Flexible(
      child: Center(
        child: Column(
          children: [
            Icon(
              iconData,
              color: Colors.white,
              size: 30,
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              theText,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 11,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return DefaultTabController(
      length: 2,
      child: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              Container(
                height: mediaQuery.size.height * 0.35,
                width: double.infinity,
                color: Colors.green,
              ),
              Container(
                padding: const EdgeInsets.only(
                  top: 5,
                  right: 8,
                  left: 8,
                ),
                height: mediaQuery.size.height * 0.65 - mediaQuery.padding.top,
                width: double.infinity,
                color: Colors.black,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        theMovie[0]['movieName'] as String,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      sizedBox10,
                      Row(
                        children: [
                          textWidget(
                            theMovie[0]['releaseDate'] as String,
                          ),
                          sizedBox5R,
                          Container(
                            height: 18,
                            width: 35,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(
                                2,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                theMovie[0]['ratedFor'] as String,
                                style: const TextStyle(
                                  color: Colors.white54,
                                ),
                              ),
                            ),
                          ),
                          sizedBox5R,
                          textWidget(
                            '${theMovie[0]['noOfSeasons']} Seasons',
                          ),
                        ],
                      ),
                      sizedBox10,
                      Container(
                        height: 40,
                        width: double.infinity,
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
                      sizedBox10,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            theMovie[0]['movieDescription'] as String,
                            style: const TextStyle(
                              color: Colors.white54,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          theFlexWidget1(
                            'My Favourites',
                            Icons.add,
                          ),
                          theFlexWidget1(
                            'Rate',
                            Icons.thumb_up_alt_outlined,
                          ),
                          theFlexWidget1(
                            'Share',
                            Icons.share,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Divider(
                        color: Colors.grey,
                      ),
                      Column(
                        children: [
                          Container(
                            child: const TabBar(
                              indicatorColor: Colors.red,
                              indicatorSize: TabBarIndicatorSize.tab,
                              indicatorWeight: 4,
                              labelStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                              labelColor: Colors.white,
                              unselectedLabelColor: Colors.grey,
                              tabs: [
                                Tab(
                                  text: 'EPISODES',
                                ),
                                Tab(
                                  text: 'MORE LIKE THIS',
                                ),
                              ],
                            ),
                          ),
                          sizedBox10,
                        ],
                      ),
                      Container(
                        width: selectedEpisode.length.toDouble() * 20,
                        decoration: BoxDecoration(
                          color: Colors.white12,
                          borderRadius: BorderRadius.circular(
                            5,
                          ),
                        ),
                        padding: const EdgeInsets.only(
                          left: 10,
                          right: 10,
                        ),
                        child: DropdownButtonFormField(
                          isDense: true,
                          isExpanded: false,
                          dropdownColor: Colors.grey,
                          value: selectedEpisode,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                          items: episodes,
                          onChanged: (value) {
                            setState(
                              () {
                                selectedEpisode = value as String;
                              },
                            );
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Column(
                        children: {theMovie[0]['seasons'][0]['episodes']}.map(
                          (episode) {
                            return Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Flexible(
                                        flex: 1,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(
                                              5,
                                            ),
                                          ),
                                          height: 80,
                                        ),
                                      ),
                                      sizedBox5R,
                                      Flexible(
                                        flex: 2,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              episode['episodeTitle'] as String,
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            sizedBox5,
                                            const Text(
                                              '46 mins',
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.grey,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    'This Episode is freaking lit. Hashira and Dashira fight and dung dung dung dis happening.',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ).toList(),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
