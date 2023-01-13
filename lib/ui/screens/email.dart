import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_package/service/auth_login_service.dart';

class EmailMenu extends StatelessWidget{
  const EmailMenu({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Email'),),
      body: Column(
        children: [
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
                return EmailSignIn();
              }));
            },
            child: Container(
              color: Colors.blue,
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.center,
              padding: const EdgeInsets.all(16),
              child: const Text('Login', style: TextStyle(color: Colors.white),),
            ),
          ),
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
                return EmailSignUp();
              }));
            },
            child: Container(
              color: Colors.blue,
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.center,
              padding: const EdgeInsets.all(16),
              child: const Text('Create Account', style: TextStyle(color: Colors.white),),
            ),
          )
        ],
      ),
    );
  }
}

class EmailSignIn extends StatelessWidget{

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
              const Text(
                'Already have account, sign in here',
              ),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                    hintText: 'Enter email'
                ),
                style: Theme.of(context).textTheme.bodyText1,
              ),
              const SizedBox(height: 16,),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                    hintText: 'Enter password'
                ),
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          AuthService().signInWithEmail(context, emailController.text, passwordController.text).then((value){
            Navigator.pop(context);
            Navigator.push(context,
                MaterialPageRoute(builder: (BuildContext context) {
                  return EmailUserDetail(user: value!);
                }));
          });
        },
        tooltip: 'login',
        child: const Icon(Icons.email),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}


class EmailSignUp extends StatelessWidget{

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
                decoration: const InputDecoration(
                    hintText: 'Enter email'
                ),
                style: Theme.of(context).textTheme.bodyText1,
              ),
              const SizedBox(height: 16,),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                    hintText: 'Enter password'
                ),
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          AuthService().signUpWithEmail(context, emailController.text, passwordController.text).then((value){
            if(value?.uid !=null){
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext context) {
                    return EmailUserDetail(user: value!);
                  }));
            }
          });

        },
        tooltip: 'sign up',
        child: const Icon(Icons.attach_email_sharp),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}


class EmailUserDetail extends StatelessWidget{

  EmailUserDetail({super.key, required this.user});

  User user;

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
                    AuthService().emailLogout();
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
