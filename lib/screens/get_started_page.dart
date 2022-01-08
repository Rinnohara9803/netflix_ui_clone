import 'package:flutter/material.dart';
import 'package:netflix_ui_clone/screens/help_page.dart';
import 'package:netflix_ui_clone/screens/sign_in_page.dart';
import 'package:netflix_ui_clone/utils/faqs.dart';
import 'package:netflix_ui_clone/widgets/appbar.dart';

class GetStartedPage extends StatefulWidget {
  const GetStartedPage({Key? key}) : super(key: key);

  @override
  _GetStartedPageState createState() => _GetStartedPageState();
}

class _GetStartedPageState extends State<GetStartedPage>
    with WidgetsBindingObserver {
  final PageController _pageController = PageController(
    initialPage: 0,
  );

  String text = 'Tata';

  void changeGetStartedPage(int pageNumber) {
    _pageController.animateToPage(
      pageNumber,
      duration: const Duration(microseconds: 1),
      curve: Curves.bounceIn,
    );
  }

  bool showAnswer = false;

  void showAnswerWidget(bool showAnswer) {
    setState(() {
      showAnswer = !showAnswer;
    });
    print(showAnswer);
  }

  void openSignInPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return const SignInPage();
        },
      ),
    );
  }

  void _launchHelpPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return const HelpPage();
        },
      ),
    );
  }

  void _launchFAQs(BuildContext theContext) {
    showModalBottomSheet(
      enableDrag: false,
      isDismissible: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(
            20,
          ),
          topRight: Radius.circular(
            20,
          ),
        ),
      ),
      context: theContext,
      builder: (BuildContext context) {
        return Container(
          child: TheFAQs(
            showAnswerWidget,
            showAnswer,
          ),
        );
      },
    );
  }

  Color firstDotColor = Colors.white;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addObserver(this);
    _pageController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: (mediaQuery.size.height * 0.90) -
                    mediaQuery.padding.top -
                    mediaQuery.padding.bottom,
                child: Stack(
                  children: [
                    PageView(
                      controller: _pageController,
                      pageSnapping: true,
                      children: const [
                        TheFirstGetStartedScreen(),
                        TheSecondGetStartedScreen(),
                        TheThirdGetStartedScreen(),
                        TheFourthGetStartedScreen()
                      ],
                    ),
                    TheAppBar(
                      openSignInPage,
                      _launchFAQs,
                      _launchHelpPage,
                    ),
                    Positioned(
                      bottom: 20,
                      right: 0,
                      left: 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TheDot1(
                            pageController: _pageController,
                            changePage: changeGetStartedPage,
                            pageNumber: 0,
                            theColor: Colors.white,
                          ),
                          TheDot1(
                            pageController: _pageController,
                            changePage: changeGetStartedPage,
                            pageNumber: 1,
                            theColor: Colors.grey,
                          ),
                          TheDot1(
                            pageController: _pageController,
                            changePage: changeGetStartedPage,
                            pageNumber: 2,
                            theColor: Colors.grey,
                          ),
                          TheDot1(
                            pageController: _pageController,
                            changePage: changeGetStartedPage,
                            pageNumber: 3,
                            theColor: Colors.grey,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              GetStartedButton(mediaQuery: mediaQuery),
            ],
          ),
        ),
      ),
    );
  }
}

class TheDot1 extends StatefulWidget {
  const TheDot1({
    Key? key,
    required this.pageController,
    required this.changePage,
    required this.pageNumber,
    required this.theColor,
  }) : super(key: key);

  final PageController pageController;
  final Function changePage;
  final int pageNumber;
  final Color theColor;

  @override
  _TheDot1State createState() => _TheDot1State();
}

class _TheDot1State extends State<TheDot1> {
  @override
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 20,
      ),
      child: InkWell(
        onTap: () {
          widget.changePage(
            widget.pageNumber,
          );
        },
        child: Container(
          height: 10,
          width: 10,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: widget.pageController.page == widget.pageNumber
                ? Colors.white
                : widget.theColor == Colors.white
                    ? Colors.grey
                    : widget.theColor,
          ),
        ),
      ),
    );
  }
}

class TheDot extends StatelessWidget {
  // const TheDot({ Key? key }) : super(key: key);
  final PageController pageController;
  final Function changePage;
  final int pageNumber;
  final Color theColor;

  TheDot(
    this.pageController,
    this.changePage,
    this.pageNumber,
    this.theColor,
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 20,
      ),
      child: InkWell(
        onTap: () {
          changePage(
            pageNumber,
          );
        },
        child: Container(
          height: 10,
          width: 10,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: pageController.page == 0 ? theColor : Colors.grey,
          ),
        ),
      ),
    );
  }
}

class GetStartedButton extends StatelessWidget {
  const GetStartedButton({
    Key? key,
    required this.mediaQuery,
  }) : super(key: key);

  final MediaQueryData mediaQuery;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 20,
        right: 10,
        left: 10,
      ),
      height: (mediaQuery.size.height * 0.10) -
          mediaQuery.padding.top -
          mediaQuery.padding.bottom,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          3,
        ),
        color: Colors.lightBlue,
      ),
      child: Center(
        child: Text(
          'Get Started',
          style: Theme.of(context).textTheme.button,
        ),
      ),
    );
  }
}

class TheSecondGetStartedScreen extends StatelessWidget {
  const TheSecondGetStartedScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Spacer(
              flex: 8,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(
                10,
              ),
              child: Container(
                height: constraints.maxHeight * 0.30,
                width: constraints.maxWidth * 0.80,
                child: const Image(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    'images/robin2.jpg',
                  ),
                ),
              ),
            ),
            const Spacer(
              flex: 5,
            ),
            Text(
              'Download and',
              style: Theme.of(context).textTheme.headline2,
            ),
            const Spacer(),
            Text(
              'watch offline',
              style: Theme.of(context).textTheme.headline2,
            ),
            Text(
              '',
              style: Theme.of(context).textTheme.headline2,
            ),
            const Spacer(
              flex: 1,
            ),
            FittedBox(
              child: Text(
                'Watch anywhere. Cancel anytime.',
                style: Theme.of(context).textTheme.headline3,
              ),
            ),
            const Spacer(
              flex: 5,
            ),
          ],
        );
      },
    );
  }
}

class TheFirstGetStartedScreen extends StatelessWidget {
  const TheFirstGetStartedScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Spacer(
              flex: 8,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(
                10,
              ),
              child: Container(
                height: constraints.maxHeight * 0.30,
                width: constraints.maxWidth * 0.80,
                child: const Image(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    'images/robin1.jpg',
                  ),
                ),
              ),
            ),
            const Spacer(
              flex: 5,
            ),
            Text(
              'Unlimited',
              style: Theme.of(context).textTheme.headline2,
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              'movies, TV',
              style: Theme.of(context).textTheme.headline2,
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              'shows & more',
              style: Theme.of(context).textTheme.headline2,
            ),
            const Spacer(
              flex: 1,
            ),
            FittedBox(
              child: Text(
                'Watch anywhere. Cancel anytime.',
                style: Theme.of(context).textTheme.headline3,
              ),
            ),
            const Spacer(
              flex: 5,
            ),
          ],
        );
      },
    );
  }
}

class TheThirdGetStartedScreen extends StatelessWidget {
  const TheThirdGetStartedScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Spacer(
              flex: 8,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(
                10,
              ),
              child: Container(
                height: constraints.maxHeight * 0.30,
                width: constraints.maxWidth * 0.80,
                child: const Image(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    'images/robin3.jpg',
                  ),
                ),
              ),
            ),
            const Spacer(
              flex: 5,
            ),
            Text(
              'No Pesky',
              style: Theme.of(context).textTheme.headline2,
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              'Contracts',
              style: Theme.of(context).textTheme.headline2,
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              '',
              style: Theme.of(context).textTheme.headline2,
            ),
            const Spacer(
              flex: 1,
            ),
            FittedBox(
              child: Text(
                'Watch anywhere. Cancel anytime.',
                style: Theme.of(context).textTheme.headline3,
              ),
            ),
            const Spacer(
              flex: 5,
            ),
          ],
        );
      },
    );
  }
}

class TheFourthGetStartedScreen extends StatelessWidget {
  const TheFourthGetStartedScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Spacer(
              flex: 8,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(
                10,
              ),
              child: Container(
                height: constraints.maxHeight * 0.30,
                width: constraints.maxWidth * 0.80,
                child: const Image(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    'images/robin5.jpg',
                  ),
                ),
              ),
            ),
            const Spacer(
              flex: 5,
            ),
            Text(
              'Watch',
              style: Theme.of(context).textTheme.headline2,
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              'Everywhere',
              style: Theme.of(context).textTheme.headline2,
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              '',
              style: Theme.of(context).textTheme.headline2,
            ),
            const Spacer(
              flex: 1,
            ),
            FittedBox(
              child: Text(
                'Watch anywhere. Cancel anytime.',
                style: Theme.of(context).textTheme.headline3,
              ),
            ),
            const Spacer(
              flex: 5,
            ),
          ],
        );
      },
    );
  }
}
