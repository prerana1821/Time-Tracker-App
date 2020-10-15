import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:time_tracker_flutter_course/app/sign_in/screens/email_sign_in_page.dart';
import 'package:time_tracker_flutter_course/app/bloc/sign_in_manager.dart';
import 'package:time_tracker_flutter_course/app/sign_in/widgets/sign_in_button.dart';
import 'package:time_tracker_flutter_course/app/sign_in/widgets/social_sign_in_button.dart';
import 'package:time_tracker_flutter_course/common_widgets/platform_exception_alert_dialog.dart';
import 'package:time_tracker_flutter_course/services/auth.dart';
// import 'package:time_tracker_flutter_course/services/auth.dart';
// import 'package:time_tracker_flutter_course/services/auth_provider.dart';
// import 'package:time_tracker_flutter_course/common_widgets/custom_raised_button.dart';

class SignInPage extends StatelessWidget {
  // final Function(User) onSignIn;
  // final AuthBase auth;

  // SignInPage({@required this.auth});

  final SignInManager manager;
  final bool isLoading;

  const SignInPage({
    Key key,
    @required this.manager,
    @required this.isLoading,
  }) : super(key: key);

  static Widget create(BuildContext context) {
    final auth = Provider.of<AuthBase>(context);
    return ChangeNotifierProvider<ValueNotifier<bool>>(
      create: (_) => ValueNotifier<bool>(false),
      child: Consumer<ValueNotifier<bool>>(
        builder: (_, isLoading, __) => Provider<SignInManager>(
          create: (_) => SignInManager(auth: auth, isLoading: isLoading),
          // dispose: (context, bloc) => bloc.dispose(),
          child: Consumer<SignInManager>(
            builder: (context, manager, _) => SignInPage(
              manager: manager,
              isLoading: isLoading.value,
            ),
          ),
        ),
      ),
    );
  }

//   @override
//   _SignInPageState createState() => _SignInPageState();
// }

// class _SignInPageState extends State<SignInPage> {
  // bool _isLoading = false;

  void _showSignInError(BuildContext context, PlatformException exception) {
    PlatformExceptionAlertDialog(title: 'Sign In Failed', exception: exception)
        .show(context);
  }

  Future<void> _signInAnonymously(BuildContext context) async {
    // final bloc = Provider.of<SignInBloc>(context);
    try {
      // bloc.setIsLoading(true);
      // setState(() {
      //   _isLoading = true;
      // });
      // final auth = AuthProvider.of(context);
      // final auth = Provider.of<AuthBase>(context, listen: false);

      // await auth.signInAnonymously();
      await manager.signInAnonymously();

      // print('${authResult.user.uid}');
      // onSignIn(user);
    } on PlatformException catch (e) {
      // print(e.toString());
      _showSignInError(context, e);
    }
    // finally {
    // bloc.setIsLoading(false);
    // setState(() {
    //   _isLoading = false;
    // });
    // }
  }

  Future<void> _signInWithGoogle(BuildContext context) async {
    // final bloc = Provider.of<SignInBloc>(context);
    try {
      // bloc.setIsLoading(true);
      // setState(() {
      //   _isLoading = true;
      // });
      // final auth = AuthProvider.of(context);
      // final auth = Provider.of<AuthBase>(context, listen: false);
      // await auth.signInWithGoogle();
      await manager.signInWithGoogle();
    } on PlatformException catch (e) {
      // print(e.toString());
      if (e.code != 'ERROR_ABORTED_BY_USER') {
        _showSignInError(context, e);
      }
    }
    // finally {
    // bloc.setIsLoading(false);
    // setState(() {
    //   _isLoading = false;
    // });
    // }
  }

  Future<void> _signInWithFacebook(BuildContext context) async {
    // final bloc = Provider.of<SignInBloc>(context);
    try {
      // bloc.setIsLoading(true);
      // setState(() {
      //   _isLoading = true;
      // });
      // final auth = AuthProvider.of(context);
      // final auth = Provider.of<AuthBase>(context, listen: false);

      // await auth.signInWithFacebook();
      await manager.signInWithFacebook();
    } on PlatformException catch (e) {
      // print(e.toString());
      if (e.code != 'ERROR_ABORTED_BY_USER') {
        _showSignInError(context, e);
      }
    }
    // finally {
    // bloc.setIsLoading(true);
    // setState(() {
    //   _isLoading = false;
    // });
    // }
  }

  void _signinWithEmail(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        fullscreenDialog: true,
        builder: (context) => EmailSignInPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // final bloc = Provider.of<SignInBloc>(context);
    // final isLoading = Provider.of<ValueNotifier<bool>>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Time Tracker'),
        elevation: 10.0,
      ),
      // body: _buildContent(context, isLoading.value),
      body: _buildContent(context),
      // StreamBuilder<bool>(
      //     stream: bloc.isLoadingStream,
      //     initialData: false,
      //     builder: (context, snapshot) {
      //       return _buildContent(context, snapshot.data);
      //     }),
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
          // Text(
          //   'Sign In',
          //   textAlign: TextAlign.center,
          //   style: TextStyle(
          //     fontSize: 32.0,
          //     fontWeight: FontWeight.w600,
          //   ),
          // ),
          SizedBox(
            height: 50.0,
            child: _buildHeader(),
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
            onPressed: isLoading ? null : () => _signInWithGoogle(context),
          ),
          SizedBox(
            height: 8.0,
          ),
          SocialSignInButton(
            assetName: 'images/facebook-logo.png',
            text: 'Sign In with Facebook',
            color: Color(0xFF334D92),
            textColor: Colors.black87,
            onPressed: isLoading ? null : () => _signInWithFacebook(context),
          ),
          SizedBox(
            height: 8.0,
          ),
          SignInButton(
            text: 'Sign In with Email',
            color: Colors.teal[700],
            textColor: Colors.black87,
            onPressed: isLoading ? null : () => _signinWithEmail(context),
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
            onPressed: () => _signInAnonymously(context),
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

  Widget _buildHeader() {
    if (isLoading) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    return Text(
      'Sign In',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 32.0,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
