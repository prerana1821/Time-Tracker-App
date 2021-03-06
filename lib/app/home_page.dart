import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_tracker_flutter_course/common_widgets/platform_alert_dialog.dart';
import 'package:time_tracker_flutter_course/services/auth.dart';
// import 'package:time_tracker_flutter_course/services/auth.dart';
// import 'package:time_tracker_flutter_course/services/auth_provider.dart';

class HomePage extends StatelessWidget {
  // final VoidCallback onSignOut;
  // final AuthBase auth;

  // HomePage({@required this.auth});

  Future<void> _signOut(BuildContext context) async {
    try {
    // final auth = AuthProvider.of(context);
    final auth = Provider.of<AuthBase>(context, listen: false);

      await auth.signOut();
      // await FirebaseAuth.instance.signOut();
      // onSignOut();
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> _confirmSignOut(BuildContext context) async {
    final didRequestSignOut = await PlatformAlertDialog(
      title: 'Logout',
      content: 'Are you sure that you want to Logout?',
      cancelActionText: 'Cancel',
      defaultActionText: 'Logout',
    ).show(context);
    if (didRequestSignOut == true) {
      _signOut(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomePage'),
        actions: [
          FlatButton(
            onPressed: () => _confirmSignOut(context),
            child: Text(
              'Logout',
              style: TextStyle(fontSize: 18.0, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
