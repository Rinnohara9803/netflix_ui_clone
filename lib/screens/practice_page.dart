import 'package:flutter/material.dart';

class PracticePage extends StatefulWidget {
  const PracticePage({Key? key}) : super(key: key);

  @override
  _PracticePageState createState() => _PracticePageState();
}

class _PracticePageState extends State<PracticePage> {
  List<String> theStrings = [
    'Muna',
    'Tuna',
    'Runa',
    'Juna',
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: theStrings.map((name) {
          return Text(
            name,
          );
        }).toList(),
      ),
    );
  }
}
