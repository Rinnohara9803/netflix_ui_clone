import 'package:flutter/material.dart';
import 'package:netflix_ui_clone/const.dart';
import 'package:netflix_ui_clone/screens/profile_pin_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);
  static const String pathName = '/profilePage';

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

List<Map<String, Object>> profiles = [
  {'imagePath': 'images/profile1.jpg', 'name': 'Profile 1', 'pin': 9801},
  {'imagePath': 'images/profile2.png', 'name': 'Profile 2', 'pin': 9802},
  {'imagePath': 'images/profile3.png', 'name': 'Profile 3', 'pin': 9803},
  {'imagePath': 'images/profile4.jpg', 'name': 'Profile 4', 'pin': 9804},
];

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final theHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: netflixText,
          ),
          backgroundColor: Colors.black,
        ),
        backgroundColor: Colors.black,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: theHeight * 0.15,
            ),
            const Text(
              'Who\'s watching?',
              style: TextStyle(
                letterSpacing: 1,
                color: Colors.grey,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.symmetric(
                  horizontal: 80,
                ),
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 2 / 3,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 40,
                ),
                itemCount: profiles.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        ProfilePin.pathName,
                        arguments: {
                          'pin': profiles[index]['pin'] as int,
                          'imagePath': profiles[index]['imagePath'] as String,
                        },
                      );
                    },
                    child: Column(
                      children: [
                        Flexible(
                          child: Image(
                            width: double.infinity,
                            fit: BoxFit.cover,
                            image: AssetImage(
                              '${profiles[index]['imagePath']}',
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          '${profiles[index]['name']}',
                          style: const TextStyle(
                            color: Colors.white70,
                            letterSpacing: 1,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
