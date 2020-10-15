import 'package:flutter/material.dart';
import 'package:time_tracker_flutter_course/app/sign_in/emalil_sign_in_form_bloc_based.dart';
// import 'package:time_tracker_flutter_course/services/auth.dart';

class EmailSignInPage extends StatelessWidget {
  // final AuthBase auth;
  // EmailSignInPage({@required this.auth});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In'),
        elevation: 2.0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            child: EmailSignInFormBlocBased.create(context),
            // EmailSignInFormStateful(
                // auth: auth,
                // ),
          ),
        ),
      ),
      backgroundColor: Colors.grey[200],
    );
  }
}
