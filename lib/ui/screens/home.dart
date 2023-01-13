import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:social_login/ui/screens/email.dart';
import 'package:social_login/ui/screens/google_signin.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key, required this.title});

  String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        children: [
          SignInButton(Buttons.Email, onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (BuildContext context) {
              return const EmailMenu();
            }));
          }),
          SignInButton(Buttons.Google, onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (BuildContext context) {
                  return const GoogleSignIn();
                }));
          }),
        ],
      ),
    );
  }
}
