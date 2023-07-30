import 'package:ChatON/common/entities/entities.dart';
import 'package:ChatON/common/routes/names.dart';
import 'package:ChatON/pages/sign_in/state.dart';
import 'package:get/get.dart';
import 'package:ChatON/pages/sign_in/index.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../common/store/user.dart';

GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: <String>[
    'openid'
  ]
);


class SignInController extends GetxController{
  final state = SignInState();
  SignInController();
  final db = FirebaseFirestore.instance;
  Future<void>handleSignIn()async{
    try{
      var user = await _googleSignIn.signIn();
      if(user !=null){
        String displayName = user.displayName??user.email;
        String email = user.email;
        String id = user.id;
        String photoUrl = user.photoUrl??"";

        UserLoginResponseEntity userProfile = UserLoginResponseEntity();
        userProfile.email = email;
        userProfile.accessToken = id;
        userProfile.displayName = displayName;
        userProfile.photoUrl = photoUrl;

        UserStore.to.saveProfile(userProfile);
      }
    }catch(e){

    }
  }
}