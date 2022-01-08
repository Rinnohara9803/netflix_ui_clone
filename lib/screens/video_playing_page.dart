import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';

class VideoPlayingPage extends StatefulWidget {
  final Map movie;

  VideoPlayingPage(this.movie);

  static String pathName = '/videoPlayingPage';

  @override
  _VideoPlayingPageState createState() => _VideoPlayingPageState();
}

class _VideoPlayingPageState extends State<VideoPlayingPage> {
  late VideoPlayerController _videoPlayerController;

  @override
  void initState() {
    _videoPlayerController = VideoPlayerController.asset(
      'videos/onePieceMovie.mp4',
    )
      ..addListener(() => setState(() {}))
      ..setLooping(
        false,
      )
      ..initialize().then(
        (_) => _videoPlayerController.play(),
      );

    setLandscape();
    timerFunction();
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();

    super.dispose();
    setPortrait();
  }

  timerFunction1() {
    setState(() {
      _isVisible = true;
      Timer(
          const Duration(
            seconds: 5,
          ), () {
        setState(() {
          _isVisible = false;
        });
      });
    });
  }

  timerFunction() {
    Timer(
        const Duration(
          seconds: 5,
        ), () {
      setState(() {
        _isVisible = false;
      });
    });
  }

  Future setLandscape() async {
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }

  Future setPortrait() async {
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
  }

  playPauseFunction() {
    if (_videoPlayerController.value.isPlaying) {
      _videoPlayerController.pause();
    } else {
      _videoPlayerController.play();
    }
  }

  Future goToPosition(
    Duration Function(Duration? currentPosition) builder,
  ) async {
    final currentPosition = await _videoPlayerController.position;
    final newPosition = builder(currentPosition);

    await _videoPlayerController.seekTo(newPosition);
  }

  Future forward10Seconds() async => goToPosition(
        (currentPosition) =>
            currentPosition! +
            const Duration(
              seconds: 10,
            ),
      );
  Future rewind10Seconds() async => goToPosition(
        (currentPosition) =>
            currentPosition! -
            const Duration(
              seconds: 10,
            ),
      );

  bool _isVisible = true;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final isMuted = _videoPlayerController.value.volume == 0;
    final movieName = widget.movie['movieName'];
    final isLandscape = mediaQuery.orientation == Orientation.landscape;

    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: _isVisible
            ? AppBar(
                backgroundColor: Colors.black.withOpacity(0.3),
                leading: IconButton(
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    setPortrait();
                    Navigator.pop(context);
                  },
                ),
                title: Center(
                  child: Text(
                    movieName,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            : null,
        backgroundColor: Colors.black45,
        body: Stack(
          children: [
            _videoPlayerController.value.isInitialized
                ? Center(
                    child: InkWell(
                      onTap: () {
                        timerFunction1();
                      },
                      child: AspectRatio(
                        aspectRatio: _videoPlayerController.value.aspectRatio,
                        child: VideoPlayer(
                          _videoPlayerController,
                        ),
                      ),
                    ),
                  )
                : const Center(
                    child: CircularProgressIndicator(),
                  ),
            if (_isVisible)
              Positioned(
                bottom: 60,
                left: 0,
                right: 0,
                child: InkWell(
                  onTap: () {},
                  child: VideoProgressIndicator(
                    _videoPlayerController,
                    allowScrubbing: true,
                  ),
                ),
              ),
            if (_isVisible)
              Positioned(
                bottom: 10,
                left: 0,
                child: Row(
                  children: [
                    IconButton(
                      iconSize: 35,
                      color: Colors.white,
                      onPressed: () {
                        playPauseFunction();
                      },
                      icon: _videoPlayerController.value.isPlaying
                          ? const Icon(Icons.pause)
                          : const Icon(
                              Icons.play_arrow,
                            ),
                    ),
                    IconButton(
                      iconSize: 25,
                      icon: Icon(
                        isMuted ? Icons.volume_mute : Icons.volume_up,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        _videoPlayerController.setVolume(
                          isMuted ? 1 : 0,
                        );
                      },
                    ),
                  ],
                ),
              ),
            if (_isVisible)
              Positioned(
                bottom: 0,
                right: 0,
                child: Row(
                  children: [
                    IconButton(
                      iconSize: 28,
                      onPressed: () {
                        rewind10Seconds();
                      },
                      icon: const Icon(Icons.replay_10_outlined),
                      color: Colors.white,
                    ),
                    IconButton(
                      iconSize: 28,
                      onPressed: () {
                        forward10Seconds();
                      },
                      icon: const Icon(
                        Icons.forward_10_outlined,
                      ),
                      color: Colors.white,
                    ),
                    IconButton(
                      iconSize: 30,
                      icon: const Icon(
                        Icons.fullscreen,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        if (isLandscape) {
                          setPortrait();
                        } else {
                          setLandscape();
                        }
                      },
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
