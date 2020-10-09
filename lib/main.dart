import 'package:flutter/material.dart';
import 'package:time_tracker_flutter_course/app/landing_page.dart';
import 'package:time_tracker_flutter_course/services/auth.dart';
// import 'package:time_tracker_flutter_course/services/auth_provider.dart';
import 'package:provider/provider.dart';
// import 'package:time_tracker_flutter_course/app/sign_in/sign_in_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return AuthProvider(
    //   auth: Auth(),
    //   child: MaterialApp(
    //     title: 'Time Tracker',
    //     debugShowCheckedModeBanner: false,
    //     theme: ThemeData(primaryColor: Colors.pinkAccent.shade400),
    //     home: LandingPage(
    //       // auth: Auth(),
    //     ),
    //   ),
    // );
    return Provider<AuthBase>(
      // auth: Auth(),
      create: (context) => Auth(),
      child: MaterialApp(
        title: 'Time Tracker',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primaryColor: Colors.pinkAccent.shade400),
        home: LandingPage(
          // auth: Auth(),
        ),
      ),
    );
  }
}
