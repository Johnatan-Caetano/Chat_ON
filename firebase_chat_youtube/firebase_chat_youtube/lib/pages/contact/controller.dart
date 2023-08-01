import 'package:ChatON/common/entities/entities.dart';
import 'package:ChatON/common/store/store.dart';
import 'package:ChatON/pages/contact/index.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ContactController extends GetxController{
  ContactController();
  final ContactState state = ContactState();
  final db =  FirebaseFirestore.instance;
  final token = UserStore.to.token;

  @override
  void onReady(){
    super.onReady();
    asyncLoadAllData();
  }

  goChat(UserData to_userdata)async{
   var from_messages = await db.collection("message").withConverter(
      fromFirestore: Msg.fromFirestore,
      toFirestore: (Msg msg, options)=> msg.toFirestore()).where("from_uid", isEqualTo: token).where(
        "to_uid", isEqualTo: to_userdata.id).get();
  }

  asyncLoadAllData()async{
    var usersbase = await db.collection("users").where("id", isNotEqualTo: token).withConverter(
      fromFirestore: UserData.fromFirestore,
      toFirestore: (UserData userdata, options)=> userdata.toFirestore()
    ).get();

    for (var doc in usersbase.docs){
      state.contactList.add(doc.data());
      print(doc.toString());
    }
  }

}



