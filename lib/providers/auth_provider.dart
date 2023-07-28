import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:techno_city/data/firebase/auth_service.dart';
import 'package:techno_city/data/model/universal_data.dart';

class AuthProvider with ChangeNotifier {
  AuthProvider({required this.authService});

  final AuthService authService;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isLoading = false;
  String errorText = "";

  loginButtonPressed() {
    passwordController.clear();
    emailController.clear();
  }

  signupButtonPressed() {
    passwordController.clear();
    emailController.clear();
  }

  Stream<User?> listenAuthState() => FirebaseAuth.instance.authStateChanges();

  Future<void> signUpUser(BuildContext context) async {
    String password = passwordController.text;
    String email = emailController.text;
    notify(true);
    UniversalData universalData =
        await authService.signUpUser(email: email, password: password);
    notify(false);

    if (universalData.error.isEmpty) {
      if (context.mounted) {
        manageMessage(context, "User signed Up");
      }
    } else {
      if (context.mounted) {
        manageMessage(context, universalData.error);
      }
    }
  }

  Future<void> loginUser(BuildContext context) async {
    String password = passwordController.text;
    String email = emailController.text;
    notify(true);
    UniversalData universalData =
        await authService.loginUser(email: email, password: password);
    notify(false);

    if (universalData.error.isEmpty) {
      if (context.mounted) {
        manageMessage(context, "User logged in");
      }
    } else {
      if (context.mounted) {
        manageMessage(context, universalData.error);
      }
    }
  }

  Future<void> logOutUser(BuildContext context) async {
    notify(true);
    UniversalData universalData = await authService.logOutUser();
    notify(false);

    if (universalData.error.isEmpty) {
      if (context.mounted) {
        manageMessage(context, "User logged in");
      }
    } else {
      if (context.mounted) {
        manageMessage(context, universalData.error);
      }
    }
  }

  Future<void> signInWithGoogle(BuildContext context) async {
    notify(true);
    UniversalData universalData = await authService.signInWithGoogle();
    notify(false);

    if (universalData.error.isEmpty) {
      if (context.mounted) {
        manageMessage(context, "User Signed Up with Google.");
      }
    } else {
      if (context.mounted) {
        manageMessage(context, universalData.error);
      }
    }
  }

  notify(bool value) {
    isLoading = value;
    notifyListeners();
  }

  manageMessage(BuildContext context, String error) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(error.toString())));

    isLoading = false;
    notifyListeners();
  }
}

// _checkAuthState() {
//   FirebaseAuth.instance.authStateChanges().listen((User? user) {
//     if (user == null) {
//       print('User is currently signed out!');
//     } else {
//       print('User is signed in!');
//     }
//   });
// }
