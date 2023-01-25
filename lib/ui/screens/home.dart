import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:login_package/service/auth_login_service.dart';
import 'package:social_login/ui/screens/email.dart';
import 'package:social_login/ui/screens/user_detail.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key, required this.title});

  String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SignInButton(Buttons.Email, onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext context) {
                return EmailSignIn();
              }));
            }),
            SignInButton(Buttons.Google, onPressed: () {
              AuthService().signInWithGoogle(context).then((value) {
                if(value != null){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                        return UserDetail(user: value, type:Buttons.Google);
                      }));
                }
              });
            }),
            SignInButton(Buttons.Apple, onPressed: () {
              AuthService().signInWithApple(context).then((value) {
                if(value != null){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                        return UserDetail(user: value, type:Buttons.Apple);
                      }));
                }
              });
            }),
            SignInButton(Buttons.Facebook, onPressed: () {
              AuthService().signInWithFacebook(context).then((value) {
                if(value != null){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                        return UserDetail(user: value, type:Buttons.Facebook);
                      }));
                }
              });
            }),
          ],
        ),
      ),
    );
  }
}
