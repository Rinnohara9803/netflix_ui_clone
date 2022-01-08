// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';
import 'package:netflix_ui_clone/widgets/helpbar.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const TextStyle textStyle = const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
    );
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
            color: Colors.black,
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
            ),
          ),
          title: Container(
            margin: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.210,
            ),
            child: const Text(
              'Netflix',
              style: TextStyle(
                color: Colors.red,
                fontSize: 30,
                letterSpacing: 2,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.10,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'Find Help Online',
                        style: textStyle,
                      ),
                    ],
                  ),
                ),
                HelpBars(
                  Icons.help_center_outlined,
                  'Help Center',
                  () {},
                ),
                HelpBars(
                  Icons.card_membership,
                  'Update payment method',
                  () {},
                ),
                HelpBars(
                  Icons.request_page_outlined,
                  'Request a title',
                  () {},
                ),
                HelpBars(
                  Icons.lock,
                  'Update Password',
                  () {},
                ),
                HelpBars(
                  Icons.not_interested,
                  'Cancel Account',
                  () {},
                ),
                HelpBars(
                  Icons.settings_input_hdmi_outlined,
                  'Fix a connection issue',
                  () {},
                ),
                HelpBars(
                  Icons.privacy_tip,
                  'Privacy',
                  () {},
                ),
                HelpBars(
                  Icons.note_add_rounded,
                  'Terms of use',
                  () {},
                ),
                Flexible(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'Contact',
                        style: textStyle,
                      ),
                    ],
                  ),
                ),
                Flexible(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'Netflix Customer Service',
                        style: textStyle,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Flexible(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      FittedBox(
                        child: Text(
                          'We\'ll connect the call for free using your internet connection',
                          style: TextStyle(
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 50,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(
                      5,
                    ),
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        const Spacer(
                          flex: 2,
                        ),
                        Icon(
                          Icons.message,
                          color: Colors.white,
                        ),
                        const Spacer(),
                        Text(
                          'CHAT',
                          style: TextStyle(
                            color: Colors.white,
                            letterSpacing: 1,
                          ),
                        ),
                        const Spacer(
                          flex: 2,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 50,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(
                      5,
                    ),
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        const Spacer(
                          flex: 2,
                        ),
                        Icon(
                          Icons.phone,
                          color: Colors.white,
                        ),
                        const Spacer(),
                        Text(
                          'CALL',
                          style: TextStyle(
                            color: Colors.white,
                            letterSpacing: 1,
                          ),
                        ),
                        const Spacer(
                          flex: 2,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
