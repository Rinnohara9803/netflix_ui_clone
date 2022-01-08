import 'package:flutter/material.dart';
import 'package:netflix_ui_clone/const.dart';
import 'package:netflix_ui_clone/screens/profile_page.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);
  static const String pathName = '/signInPage';

  @override
  State<SignInPage> createState() => _SignInPageState();
}

const Color noClickColor = Colors.grey;
final TextEditingController emailPhoneController = TextEditingController();
final TextEditingController passwordController = TextEditingController();

final _formKey = GlobalKey<FormState>();

void validateForm(BuildContext context) {
  if (_formKey.currentState!.validate()) {
    getToProfilePage(context);
  } else {}
}

void getToProfilePage(BuildContext context) {
  Navigator.of(context).pushNamed(ProfilePage.pathName);
}

var theShowHideText = 'SHOW';
bool isPasswordVisible = false;

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
            ),
          ),
          title: netflixText,
        ),
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.20,
            ),
            child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFormField(
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                        controller: emailPhoneController,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              5,
                            ),
                            borderSide: const BorderSide(
                              color: Colors.grey,
                            ),
                          ),
                          filled: true,
                          fillColor: Colors.grey[700],
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              5,
                            ),
                          ),
                          labelText: 'Email or Phone Number',
                          labelStyle: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        validator: (value) {
                          if (value != 'ajay' || value == null) {
                            return 'Invalid email address';
                          } else {
                            return null;
                          }
                        },
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                        controller: passwordController,
                        obscureText: !isPasswordVisible,
                        decoration: InputDecoration(
                          isDense: false,
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              5,
                            ),
                            borderSide: const BorderSide(
                              color: Colors.grey,
                            ),
                          ),
                          suffixIcon: !isPasswordVisible
                              ? InkWell(
                                  onTap: () {
                                    setState(() {
                                      isPasswordVisible = !isPasswordVisible;
                                    });
                                  },
                                  child: const Padding(
                                    padding: EdgeInsets.only(
                                      top: 16,
                                      right: 10,
                                    ),
                                    child: Text(
                                      'SHOW',
                                      style: TextStyle(
                                        letterSpacing: 1,
                                      ),
                                    ),
                                  ),
                                )
                              : InkWell(
                                  onTap: () {
                                    setState(
                                      () {
                                        isPasswordVisible = !isPasswordVisible;
                                      },
                                    );
                                  },
                                  child: const Padding(
                                    padding: EdgeInsets.only(
                                      top: 16,
                                      right: 10,
                                    ),
                                    child: Text(
                                      'HIDE',
                                      style: TextStyle(
                                        letterSpacing: 1,
                                      ),
                                    ),
                                  ),
                                ),
                          filled: true,
                          fillColor: Colors.grey[700],
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              5,
                            ),
                          ),
                          labelText: 'Password',
                          labelStyle: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        validator: (value) {
                          if (value != 'ajay' || value == null) {
                            return 'Invalid password';
                          } else {
                            return null;
                          }
                        },
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      InkWell(
                        onTap: () {
                          validateForm(context);
                        },
                        child: Container(
                          height: 55,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                5,
                              ),
                              border: Border.all(
                                color: Colors.white,
                              )),
                          child: Center(
                            child: Text(
                              'Sign In',
                              style: Theme.of(context).textTheme.button,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const Text(
                        'Need Help',
                        style: TextStyle(
                          color: Colors.white60,
                          fontSize: 15,
                          letterSpacing: 1,
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const Text(
                        'New to Netflix? Sign Up now.',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          letterSpacing: 1,
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const Text(
                        'Sign In is protected by Google reCAPTCHA to ensure you are not a bot. ',
                        style: TextStyle(
                          color: Colors.blueGrey,
                          fontSize: 11,
                          letterSpacing: 1,
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: const Text(
                          'Learn More. ',
                          style: TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
