import 'package:flutter/material.dart';

import 'package:time_tracker_flutter_course/app/home_page.dart';
import 'package:time_tracker_flutter_course/app/sign_in/sign_in_page.dart';
import 'package:time_tracker_flutter_course/services/auth.dart';

class LandingPage extends StatelessWidget {
  final AuthBase auth;
  LandingPage({this.auth});
  // User _user;
  //
  // @override
  // void initState() {
  //   super.initState();
  //   _checkCurrentUser();
  //   widget.auth.onAuthStateChanged.listen((user) {
  //     print('User: ${user?.uid}');
  //   });
  // }
  //
  // Future<void> _checkCurrentUser() async {
  //   User user = await widget.auth.currentUser();
  //   _updateUser(user);
  // }
  //
  // void _updateUser(User user) {
  //   // print('User Id: ${user.uid}');
  //   setState(() {
  //     _user = user;
  //   });
  // }
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User>(
      stream: auth.onAuthStateChanged,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          User user = snapshot.data;
          if (user == null) {
            return SignInPage(
              auth: auth,
              // onSignIn: _updateUser,
            );
          }
          return HomePage(
            auth: auth,
            // onSignOut: () => _updateUser(null),
          );
        } else {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}