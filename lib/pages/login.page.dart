import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_wheelchair/pages/latest_occurence.page.dart';
import 'package:smart_wheelchair/utils/auth.dart';

const users = const {
  'dribbble@gmail.com': '12345',
  'hunter@gmail.com': 'hunter',
  'haroldochapp@yopmail': 'haroldo'
};

class LoginScreenPage extends StatelessWidget {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  SharedPreferences sp;

  BaseAuth auth = new Auth();

  String uid;

  Duration get loginTime => Duration(milliseconds: 2250);

  Future<String> _createUser(LoginData data) async {
    String uid = await this
        .auth
        .createUserWithEmailAndPassword(data.name, data.password);
    if (this.sp == null) this.sp = await SharedPreferences.getInstance();
    this.sp.setString('user', uid);
    this.uid = uid;
    return null;
  }

  Future<String> _loginUser(LoginData data) async {
    String uid =
        await this.auth.signInWithEmailAndPassword(data.name, data.password);
    if (this.sp == null) this.sp = await SharedPreferences.getInstance();
    this.sp.setString('user', uid);
    this.uid = uid;
    return null;
  }

  //remove me!
  Future<String> _recoverPassword(String name) {
    print('Name: $name');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(name)) {
        return 'Username doesnt exist';
      }
      return null;
    });
  }

  @override
  Widget build(BuildContext context) {
    checkIfLogged(context);
    return FlutterLogin(
      title: 'Smart Wheelchair',
      logo: 'assets/images/wheelchair.png',
      onLogin: _loginUser,
      onSignup: _createUser,
      onSubmitAnimationCompleted: () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => LatestOccurencePage(),
        ));
      },
      onRecoverPassword: _recoverPassword,
    );
  }

  void checkIfLogged(BuildContext context) async {
    if (this.sp == null) this.sp = await SharedPreferences.getInstance();
    if (this.sp.getString('user') != null)
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => LatestOccurencePage()));
  }
}
