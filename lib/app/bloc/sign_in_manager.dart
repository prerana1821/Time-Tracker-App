import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:time_tracker_flutter_course/services/auth.dart';

class SignInManager {
  final AuthBase auth;
  final ValueNotifier<bool> isLoading;
  SignInManager({@required this.auth, @required this.isLoading});

  // final StreamController<bool> _isLoadingController = StreamController<bool>();
  // Stream<bool> get isLoadingStream => _isLoadingController.stream;
  // void dispose() {
  //   _isLoadingController.close();
  // }
  // void _setIsLoading(bool isLoading) => _isLoadingController.add(isLoading);

  Future<User> _signIn(Future<User> Function() signInMethod) async {
    try {
      // _setIsLoading(true);
      isLoading.value = true;
      return await signInMethod();
    } catch (e) {
      // _setIsLoading(false);
      isLoading.value = false;
      rethrow;
    } 
    // finally {
    //   // _setIsLoading(false);
    // }
  }

  Future<User> signInAnonymously() async => _signIn(auth.signInAnonymously);
  Future<User> signInWithGoogle() async => _signIn(auth.signInWithGoogle);
  Future<User> signInWithFacebook() async => _signIn(auth.signInWithFacebook);
}
