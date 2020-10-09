// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:time_tracker_flutter_course/app/sign_in/email_sign_in_page.dart';

import 'package:time_tracker_flutter_course/app/sign_in/sign_in_button.dart';
import 'package:time_tracker_flutter_course/app/sign_in/social_sign_in_button.dart';
import 'package:time_tracker_flutter_course/services/auth.dart';
// import 'package:time_tracker_flutter_course/common_widgets/custom_raised_button.dart';

class SignInPage extends StatelessWidget {
  // final Function(User) onSignIn;
  final AuthBase auth;

  SignInPage({@required this.auth});

  Future<void> _signInAnonymously() async {
    try {
      await auth.signInAnonymously();
      // print('${authResult.user.uid}');
      // onSignIn(user);
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> _signInWithGoogle() async {
    try {
      await auth.signInWithGoogle();
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> _signInWithFacebook() async {
    try {
      await auth.signInWithFacebook();
    } catch (e) {
      print(e.toString());
    }
  }

  void _signinWithEmail(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        fullscreenDialog: true,
        builder: (context) => EmailSignInPage(auth: auth),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Time Tracker'),
        elevation: 10.0,
      ),
      body: _buildContent(context),
      backgroundColor: Colors.grey[200],
    );
  }

  Widget _buildContent(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Container(
          //   color: Colors.orange,
          //   child: SizedBox(
          //     width: 100.0,
          //     height: 100.0,
          //   ),
          // ),
          Text(
            'Sign In',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 32.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: 48.0,
          ),
          // CustomRaisedButton(
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       Image.asset('images/google-logo.png'),
          //       Text('Sign In with Google'),
          //       Opacity(
          //           opacity: 0.0, child: Image.asset('images/google-logo.png')),
          //     ],
          //   ),
          //   color: Colors.white,
          //   onPressed: () {},
          // ),
          // SizedBox(
          //   height: 8.0,
          // ),
          SocialSignInButton(
            assetName: 'images/google-logo.png',
            text: 'Sign In with Google',
            color: Colors.white,
            textColor: Colors.black87,
            onPressed: _signInWithGoogle,
          ),
          SizedBox(
            height: 8.0,
          ),
          SocialSignInButton(
            assetName: 'images/facebook-logo.png',
            text: 'Sign In with Facebook',
            color: Color(0xFF334D92),
            textColor: Colors.black87,
            onPressed: _signInWithFacebook,
          ),
          SizedBox(
            height: 8.0,
          ),
          SignInButton(
            text: 'Sign In with Email',
            color: Colors.teal[700],
            textColor: Colors.black87,
            onPressed: () => _signinWithEmail(context),
          ),
          SizedBox(
            height: 8.0,
          ),
          Text(
            'or',
            style: TextStyle(
              fontSize: 14.0,
              color: Colors.black87,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 8.0,
          ),
          SignInButton(
            text: 'Go Anonymous',
            color: Colors.lime[300],
            textColor: Colors.black87,
            onPressed: _signInAnonymously,
          ),
          // CustomRaisedButton(
          //   child: Text(
          //     'Sign In with Facebook',
          //     style: TextStyle(
          //       color: Colors.black87,
          //     ),
          //   ),
          //   color: Colors.white,
          //   borderRadius: 16.0,
          //   onPressed: () {},
          // ),
          // CustomRaisedButton(
          //   child: Text(
          //     'Sign In with Email',
          //     style: TextStyle(
          //       color: Colors.black87,
          //     ),
          //   ),
          //   color: Colors.white,
          //   borderRadius: 16.0,
          //   onPressed: () {},
          // ),
        ],
      ),
    );
  }
}
