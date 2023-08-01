import 'package:ChatON/common/entities/entities.dart';
import 'package:ChatON/common/routes/names.dart';
import 'package:ChatON/common/widgets/toast.dart';
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

        final _gAuthentication = await user.authentication;
       final _credencial = GoogleAuthProvider.credential(
          idToken: _gAuthentication.idToken,
          accessToken: _gAuthentication.accessToken
        );

       await FirebaseAuth.instance.signInWithCredential(_credencial);
 
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
        var userbase = await db.collection("users").withConverter(
          fromFirestore: UserData.fromFirestore, 
          toFirestore: (UserData userdata, options) => userdata.toFirestore(),
        ).where("id", isEqualTo: id).get();

        if(userbase.docs.isEmpty){
          final data = UserData(
            id: id,
            name: displayName,
            email: email,
            photourl: photoUrl,
            location: "",
            fcmtoken: "",
            addtime: Timestamp.now()
          );

          await db.collection("users").withConverter(
          fromFirestore: UserData.fromFirestore, 
          toFirestore: (UserData userdata, options) => userdata.toFirestore(),
        ).add(data);

        }
        toastInfo(msg: "Login bem sucedido");
        Get.offAndToNamed(AppRoutes.Application);
      }
    }catch(e){
      toastInfo(msg: "Erro ao realizar o login");
      print(e);
    }
  }

  @override
  void onReady(){
    super.onReady();
    FirebaseAuth.instance.authStateChanges().listen((User? user) { 
      if(user == null){
        print("O usuário está desconectado no momento");
      }else{
        print("O usuário está conectado");
      }
    });
  }
}