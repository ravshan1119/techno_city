import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class AuthProvider with ChangeNotifier {
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

    try {
      isLoading = true;
      notifyListeners();
      // final credential =
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      isLoading = false;
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        debugPrint('The password provided is too weak.');
        manageMessage(context, e.code);
      } else if (e.code == 'email-already-in-use') {
        debugPrint('The account already exists for that email.');
        manageMessage(context, e.code);
      }

      manageMessage(context, e.code);
    } catch (err) {
      manageMessage(context, err.toString());
    }
  }

  Future<void> logInUser(BuildContext context) async {
    String password = passwordController.text;
    String email = emailController.text;

    try {
      isLoading = true;
      notifyListeners();
      // final credential =
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      isLoading = false;
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        debugPrint('The password provided is too weak.');
        manageMessage(context, e.code);
      } else if (e.code == 'email-already-in-use') {
        debugPrint('The account already exists for that email.');
        manageMessage(context, e.code);
      }

      manageMessage(context, e.code);
    } catch (err) {
      manageMessage(context, err.toString());
    }
  }

  Future<void> logOut(BuildContext context)async{
    try {
      isLoading = true;
      notifyListeners();
      // final credential =
      await FirebaseAuth.instance.signOut();
      isLoading = false;
      loginButtonPressed();
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      manageMessage(context, e.code);
      if (e.code == 'weak-password') {
        debugPrint('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        debugPrint('The account already exists for that email.');
      }
    } catch (error) {
      manageMessage(context, error.toString());
    }
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
