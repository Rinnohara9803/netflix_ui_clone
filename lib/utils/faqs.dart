import 'package:flutter/material.dart';

class TheFAQs extends StatefulWidget {
  final Function onPressedAdd;
  final bool showAnswer;

  TheFAQs(this.onPressedAdd, this.showAnswer);

  @override
  State<TheFAQs> createState() => _TheFAQsState();
}

class _TheFAQsState extends State<TheFAQs> {
  @override
  Widget build(BuildContext context) {
    return FaqWidget(
      onPressedAddButton: widget.onPressedAdd,
      showAnswer: widget.showAnswer,
    );
  }
}

class FaqWidget extends StatelessWidget {
  const FaqWidget({
    Key? key,
    required this.onPressedAddButton,
    required this.showAnswer,
  }) : super(key: key);
  final bool showAnswer;
  final Function onPressedAddButton;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(
            left: 10,
            right: 10,
            top: 10,
          ),
          padding: const EdgeInsets.all(
            8,
          ),
          decoration: const BoxDecoration(
            color: Colors.grey,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Tata',
              ),
              IconButton(
                onPressed: () {
                  onPressedAddButton(showAnswer);
                },
                icon: showAnswer == false
                    ? const Icon(Icons.add)
                    : const Icon(Icons.crop),
              ),
            ],
          ),
        ),
        if (showAnswer == true)
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            padding: const EdgeInsets.all(
              8,
            ),
            decoration: const BoxDecoration(
              color: Colors.blueGrey,
            ),
            child: const Text(
              'Tata',
            ),
          ),
      ],
    );
  }
}
