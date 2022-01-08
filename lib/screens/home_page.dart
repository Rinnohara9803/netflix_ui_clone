import 'package:flutter/material.dart';
import 'package:netflix_ui_clone/widgets/thetopvideoplayerwidget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

List theVideos = [
  {
    'movieName': 'One Piece Film',
    'type': 'movie',
    'moviePicture':
        'https://static.wikia.nocookie.net/onepiece/images/a/a6/One_Piece_Film_Gold.png/revision/latest?cb=20160301033339',
    'movieGenres': [
      'Adventure Fiction',
      'Fantasy',
      'Pirates',
    ],
    'moviePath': 'videos/onePieceMovie.mp4',
    'moviePicture1':
        'https://static.wikia.nocookie.net/onepiece/images/a/a6/One_Piece_Film_Gold.png/revision/latest?cb=20160301033339',
    'movieReleaseDate': 2017,
    'movieAgeType': '18+',
    'movieTime': '2h 23mins',
    'movieDescription':
        'Set in Gran Tesoro, an independent country chartered by the World Government, home of the world\'s greatest entertainment city where well-known pirates, Marines, and millionaires throughout the world gather in an "absolute sanctuary" that even the World Government cannot touch.',
  },
  {
    'movieName': 'Samurai Champloo',
    'type': 'series',
    'seasons': 1,
    'episode List': 24,
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
    'movieReleaseDate': 2017,
    'movieAgeType': '18+',
    'movieTime': '2h 23mins',
    'movieDescription':
        'Set in Gran Tesoro, an independent country chartered by the World Government, home of the world\'s greatest entertainment city where well-known pirates, Marines, and millionaires throughout the world gather in an "absolute sanctuary" that even the World Government cannot touch.',
  },
  {
    'movieName': 'Naruto The Last',
    'type': 'movie',
    'moviePicture':
        'https://m.media-amazon.com/images/M/MV5BZmQ5NGFiNWEtMmMyMC00MDdiLTg4YjktOGY5Yzc2MDUxMTE1XkEyXkFqcGdeQXVyNTA4NzY1MzY@._V1_.jpg',
    'movieGenres': [
      'Adventure Fiction',
      'Fantasy',
      'Pirates',
    ],
    'moviePath': 'videos/onePieceMovie.mp4',
    'moviePicture1':
        'https://m.media-amazon.com/images/M/MV5BZmQ5NGFiNWEtMmMyMC00MDdiLTg4YjktOGY5Yzc2MDUxMTE1XkEyXkFqcGdeQXVyNTA4NzY1MzY@._V1_.jpg',
    'movieReleaseDate': 2017,
    'movieAgeType': '18+',
    'movieTime': '2h 23mins',
    'movieDescription':
        'Set in Gran Tesoro, an independent country chartered by the World Government, home of the world\'s greatest entertainment city where well-known pirates, Marines, and millionaires throughout the world gather in an "absolute sanctuary" that even the World Government cannot touch.',
  },
  {
    'movieName': 'Hunter X Hunter',
    'type': 'movie',
    'moviePicture':
        'https://m.media-amazon.com/images/M/MV5BZjNmZDhkN2QtNDYyZC00YzJmLTg0ODUtN2FjNjhhMzE3ZmUxXkEyXkFqcGdeQXVyNjc2NjA5MTU@._V1_FMjpg_UX1000_.jpg',
    'movieGenres': [
      'Adventure Fiction',
      'Fantasy',
      'Pirates',
    ],
    'moviePath': 'videos/onePieceMovie.mp4',
    'moviePicture1':
        'https://m.media-amazon.com/images/M/MV5BZjNmZDhkN2QtNDYyZC00YzJmLTg0ODUtN2FjNjhhMzE3ZmUxXkEyXkFqcGdeQXVyNjc2NjA5MTU@._V1_FMjpg_UX1000_.jpg',
    'movieReleaseDate': 2017,
    'movieAgeType': '18+',
    'movieTime': '2h 23mins',
    'movieDescription':
        'Set in Gran Tesoro, an independent country chartered by the World Government, home of the world\'s greatest entertainment city where well-known pirates, Marines, and millionaires throughout the world gather in an "absolute sanctuary" that even the World Government cannot touch.',
  },
];

Future<void> refresh() async {
  return Future.delayed(
    const Duration(seconds: 2),
  );
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final theHeight = MediaQuery.of(context).size.height;
    final theWidth = MediaQuery.of(context).size.width;
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, Object>;
    final profilePicPath = routeArgs['imagePath'] as String;
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.black.withOpacity(0.4),
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
                image: AssetImage(
                  profilePicPath,
                ),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
          ],
        ),
        backgroundColor: Colors.black,
        body: CustomScrollView(
          slivers: [
            // TheSliverAppBar(
            //   profilePicPath: profilePicPath,
            // ),
            // const TheSliverAppBar1(),
            TheTopVideoPlayerSliverWidget(
              theHeight: theHeight,
              theWidth: theWidth,
              theVideos: theVideos,
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Container(
                    margin: const EdgeInsets.only(
                      left: 8,
                      top: 8,
                      bottom: 8,
                    ),
                    height: 185,
                    width: double.infinity,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: theVideos.length,
                      itemBuilder: (context, index) {
                        return Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                5,
                              ),
                            ),
                            width: 125,
                            margin: const EdgeInsets.only(
                              right: 8,
                            ),
                            child: InkWell(
                              onTap: () {
                                TheTopVideoPlayerSliverWidget.showBottomSheet(
                                    context, theVideos[index]);
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(
                                  5,
                                ),
                                child: Image(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                    theVideos[index]['moviePicture'],
                                  ),
                                ),
                              ),
                            ));
                      },
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    height: 400,
                    width: double.infinity,
                    child: const Image(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        'images/robin1.jpg',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
