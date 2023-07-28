import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:techno_city/data/firebase/profile_service.dart';
import 'package:techno_city/data/model/universal_data.dart';

class ProfileProvider with ChangeNotifier {
  ProfileProvider({required this.profileService}) {
    currentUser = FirebaseAuth.instance.currentUser;
    notifyListeners();
    listenUserChanges();
  }

  final ProfileService profileService;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

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

  showMessage(BuildContext context, String error) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(error.toString())));

    isLoading = false;
    notifyListeners();


  }

  updateUserDisplayName(BuildContext context){
    String name = nameController.text;
    if(name.isNotEmpty){
      FirebaseAuth.instance.currentUser?.updateDisplayName(name);
    }else{
      showMessage(context, "Username empty");
    }
  }

  updateUserImage(BuildContext context){
    String photoUrl="nameController.text";
    if(photoUrl.isNotEmpty){
      FirebaseAuth.instance.currentUser?.updatePhotoURL(photoUrl);
    }else{
      showMessage(context,"User image empty");
    }
  }

  Future<void> updateEmail(BuildContext context)async{
    String email=emailController.text;

    if(email.isNotEmpty){
      notify(true);
      UniversalData universalData=await profileService.updateUserEmail(email: email);
      notify(false);
      if(universalData.error.isEmpty){
        if(context.mounted){
          showMessage(context, universalData.data as String);
        }
      }else{
        if(context.mounted){
          showMessage(context, universalData.error);
        }
      }

    }
  }


}
