import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileProvider with ChangeNotifier {



  ProfileProvider() {
    currentUser = FirebaseAuth.instance.currentUser;
    notifyListeners();
    listenUserChanges();
  }

  TextEditingController displayNameController = TextEditingController();

  bool isLoading = false;

  User? currentUser;

  listenUserChanges() {
    FirebaseAuth.instance.userChanges().listen((User? user) {
      currentUser = user;
      notifyListeners();
    });
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


  Future<void> updateUserDisplayName(BuildContext context)async{
    if(displayNameController.text.isNotEmpty){
      notify(true);
       await FirebaseAuth.instance.currentUser?.updateDisplayName(displayNameController.text);
      notify(false);
    }else{
      manageMessage(context, "display name empty");
    }
  }

}
