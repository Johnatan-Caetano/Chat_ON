import 'package:ChatON/common/entities/entities.dart';
import 'package:ChatON/common/routes/names.dart';
import 'package:ChatON/common/widgets/toast.dart';
import 'package:ChatON/pages/chat/index.dart';
import 'package:ChatON/pages/sign_in/state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ChatON/pages/sign_in/index.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../common/store/user.dart';



class ChatController extends GetxController{
  ChatController();
  ChatState state = ChatState();
  var doc_id = null;
  final textController = TextEditingController();
  ScrollController msgScrolling = ScrollController();
  FocusNode contentNode = FocusNode();
  final user_id = UserStore.to.token;
  final db = FirebaseFirestore.instance;

  @override
  void onInit(){
    super.onInit();
    var data = Get.parameters;
    doc_id = data['doc_id'];
    state.to_uid.value = data['to_uid']??"";
    state.to_name.value = data['to_name']??"";
    state.to_avatar.value = data['to_avatar']??"";

  }

  sendMessage()async{
    String sendContent = textController.text;
    final content = Msgcontent(
      uid: user_id,
      content: sendContent,
      type: "text",
      addtime: Timestamp.now()
    );

    await db.collection("message").doc(doc_id).collection("msgList").
    withConverter(
      fromFirestore: Msgcontent.fromFirestore, 
      toFirestore: (Msgcontent msgcontent, options)=> msgcontent.toFirestore()).add(content).then((DocumentReference doc){
        print("Document snapshot added with id, ${doc.id}");
        textController.clear();
        Get.focusScope?.unfocus();
      });
      await db.collection("message").doc(doc_id).update({
        "last_msg":sendContent,
        "last_time": Timestamp.now()
      });
  }
}