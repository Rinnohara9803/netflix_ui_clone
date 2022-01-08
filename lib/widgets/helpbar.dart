import 'package:flutter/material.dart';

class HelpBars extends StatelessWidget {
  // const HelpBars({Key? key}) : super(key: key);

  final IconData theIcon;
  final String text;
  final Function onPressed;

  HelpBars(this.theIcon, this.text, this.onPressed);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                width: 20,
              ),
              Icon(
                theIcon,
                color: Colors.blue[400],
              ),
              const SizedBox(
                width: 25,
              ),
              FittedBox(
                child: Text(
                  text,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.blue[400],
                    letterSpacing: 1,
                  ),
                ),
              ),
              const Spacer(
                flex: 12,
              ),
            ],
          ),
          const Divider(
            thickness: 1,
            indent: 10,
            endIndent: 10,
          ),
        ],
      ),
    );
  }
}
