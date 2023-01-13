import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:login_package/service/auth_login_service.dart';


class UserDetail extends StatelessWidget{

  UserDetail({super.key, required this.user, required this.type});

  User user;
  Buttons type;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User detail'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                user.email ?? '',
              ),
              const SizedBox(height: 16,),
              Text(
                user.displayName ?? '',
              ),
              const SizedBox(height: 16,),
              Text(
                user.uid ?? '',
              ),
              const SizedBox(height: 16,),
              InkWell(
                onTap: (){
                  switch(type){
                    case Buttons.Email:
                      AuthService().emailLogout();
                      break;
                    case Buttons.Google:
                      AuthService().googleLogout();
                      break;
                    case Buttons.GoogleDark:
                      // TODO: Handle this case.
                      break;
                    case Buttons.Facebook:
                      // TODO: Handle this case.
                      break;
                    case Buttons.FacebookNew:
                      // TODO: Handle this case.
                      break;
                    case Buttons.GitHub:
                      // TODO: Handle this case.
                      break;
                    case Buttons.Apple:
                      // TODO: Handle this case.
                      break;
                    case Buttons.AppleDark:
                      // TODO: Handle this case.
                      break;
                    case Buttons.LinkedIn:
                      // TODO: Handle this case.
                      break;
                    case Buttons.Pinterest:
                      // TODO: Handle this case.
                      break;
                    case Buttons.Tumblr:
                      // TODO: Handle this case.
                      break;
                    case Buttons.Twitter:
                      // TODO: Handle this case.
                      break;
                    case Buttons.Reddit:
                      // TODO: Handle this case.
                      break;
                    case Buttons.Quora:
                      // TODO: Handle this case.
                      break;
                    case Buttons.Yahoo:
                      // TODO: Handle this case.
                      break;
                    case Buttons.Hotmail:
                      // TODO: Handle this case.
                      break;
                    case Buttons.Xbox:
                      // TODO: Handle this case.
                      break;
                    case Buttons.Microsoft:
                      // TODO: Handle this case.
                      break;
                  }
                },
                child: Container(
                  color: Colors.blue,
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(16),
                  child: const Text('Login', style: TextStyle(color: Colors.white),),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
