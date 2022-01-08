import 'package:flutter/material.dart';
import 'package:netflix_ui_clone/screens/dashboard_page.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class ProfilePin extends StatefulWidget {
  const ProfilePin({Key? key}) : super(key: key);

  static String pathName = '/ProfilePin';

  @override
  State<ProfilePin> createState() => _ProfilePinState();
}

bool showErrorText = false;
TextEditingController pinController = TextEditingController();

void getToMainDashBoard(BuildContext context, String profilePic) {
  Navigator.pushNamed(context, DashBoard.pathName, arguments: {
    'imagePath': profilePic,
  });
}

class _ProfilePinState extends State<ProfilePin> {
  @override
  Widget build(BuildContext context) {
    final theHeight = MediaQuery.of(context).size.height;
    final theWidth = MediaQuery.of(context).size.width;
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, Object>;
    final profilePin = routeArgs['pin'] as int;
    final profilePic = routeArgs['imagePath'] as String;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const FittedBox(
              child: Text(
                'Profile Lock is currently on',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const FittedBox(
              child: Text(
                'Enter your PIN to access this profile.',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            PinCodeTextField(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              controller: pinController,
              appContext: context,
              length: 4,
              onChanged: (value) {},
              pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  fieldHeight: 60,
                  fieldWidth: 60,
                  activeColor: Colors.white,
                  inactiveColor: Colors.grey,
                  selectedColor: Colors.white30),
              textStyle: const TextStyle(
                color: Colors.white,
                fontSize: 25,
              ),
              keyboardType: TextInputType.number,
              obscureText: true,
              obscuringCharacter: '*',
              autoFocus: true,
              onCompleted: (value) {
                if (pinController.text == profilePin.toString()) {
                  getToMainDashBoard(context, profilePic);
                } else {
                  setState(() {
                    showErrorText = true;
                  });
                }
              },
              onSubmitted: (value) {
                setState(() {
                  showErrorText = false;
                });
                if (pinController.text == profilePin.toString()) {
                  getToMainDashBoard(context, profilePic);
                } else {
                  setState(() {
                    showErrorText = true;
                  });
                }
              },
            ),
            if (showErrorText == true)
              const Text(
                'Wrong Pin',
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
            SizedBox(
              height: theHeight * 0.08,
            ),
            const Text(
              'Forgot PIN?',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
