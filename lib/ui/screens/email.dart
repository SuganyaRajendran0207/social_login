import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:login_package/service/auth_login_service.dart';
import 'package:social_login/ui/screens/user_detail.dart';

class EmailSignIn extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  ValueNotifier isShow = ValueNotifier(true);

  EmailSignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Email Login'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: emailController,
                decoration: const InputDecoration(hintText: 'Enter email', border: OutlineInputBorder() ),
                style: Theme.of(context).textTheme.bodyText1,
              ),
              const SizedBox(
                height: 16,
              ),
              ValueListenableBuilder(valueListenable: isShow, builder: (BuildContext context, value, _){
                return TextField(
                  controller: passwordController,
                  obscureText: value,
                  decoration: InputDecoration(hintText: 'Enter password', border: OutlineInputBorder(), suffixIcon: InkWell(onTap: (){
                    isShow.value = !isShow.value;
                    print(isShow.value);
                  }, child: Icon(value ? Icons.visibility: Icons.visibility_off))),
                  style: Theme.of(context).textTheme.bodyText1,
                );
              }),
              const SizedBox(
                height: 16,
              ),
              InkWell(
                onTap: () {
                  AuthService()
                      .signInWithEmail(context, emailController.text,
                          passwordController.text)
                      .then((value) {
                        if(value !=null) {
                          Navigator.pop(context);
                          Navigator.push(context,
                              MaterialPageRoute(builder: (
                                  BuildContext context) {
                                return UserDetail(
                                  user: value,
                                  type: Buttons.Email,
                                );
                              }));
                        }
                  });
                },
                child: Container(
                  color: Colors.blue,
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(16),
                  child: const Text(
                    'Login',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                        return EmailSignUp();
                      }));
                },
                child: const Text(
                  'Create Account',
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class EmailSignUp extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  EmailSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Email SignUp'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Create a new account',
              ),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(hintText: 'Enter email'),
                style: Theme.of(context).textTheme.bodyText1,
              ),
              const SizedBox(
                height: 16,
              ),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(hintText: 'Enter password'),
                style: Theme.of(context).textTheme.bodyText1,
              ),
              const SizedBox(
                height: 16,
              ),
              InkWell(
                onTap: () {
                  AuthService()
                      .signUpWithEmail(context, emailController.text,
                      passwordController.text)
                      .then((value) {
                    if(value !=null) {
                      Navigator.pop(context);
                      Navigator.push(context,
                          MaterialPageRoute(builder: (
                              BuildContext context) {
                            return UserDetail(
                              user: value,
                              type: Buttons.Email,
                            );
                          }));
                    }
                  });
                },
                child: Container(
                  color: Colors.blue,
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(16),
                  child: const Text(
                    'Login',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
