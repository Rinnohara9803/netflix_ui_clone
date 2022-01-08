import 'dart:async';

import 'package:flutter/material.dart';
import 'package:netflix_ui_clone/screens/get_started_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(
        const Duration(
          seconds: 2,
        ), () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return const GetStartedPage();
          },
        ),
      );
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Netflix',
                style: TextStyle(
                  color: Colors.red[900],
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const CircularProgressIndicator(
                color: Colors.red,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
