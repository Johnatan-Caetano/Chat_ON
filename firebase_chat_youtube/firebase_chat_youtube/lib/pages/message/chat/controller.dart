import 'dart:io';
import 'package:ChatON/common/utils/security.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ChatON/common/store/store.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../common/entities/msgcontent.dart';
import 'index.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:path/path.dart';
import 'package:firebase_storage/firebase_storage.dart';



class ChatController extends GetxController{
  ChatController();
  ChatState state = ChatState();
  var doc_id = null;
  final textController = TextEditingController();
  ScrollController msgScrolling = ScrollController();
  FocusNode contentNode = FocusNode();
  final user_id = UserStore.to.token;
  final db = FirebaseFirestore.instance;
  var listener;

  File? _photo;
  final ImagePicker _piker = ImagePicker();

  Future imgFromGallery()async{
    
    final pickedFile = await _piker.pickImage(source: ImageSource.gallery);
    if(pickedFile != null){
      _photo = File(pickedFile.path);
      uploadFile();
    }else{
      print("Nenhuma imagem selecionada");
    }
  }

  Future uploadFile()async{
    if(_photo == null) return;
    final fileName = getRandomString(15)+ extension (_photo!.path);
    try{

      final ref = FirebaseStorage.instance.ref("chat").child(fileName);

    }catch(e){
      print("There's an error $e");
    }
  }

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

  @override
  void onReady(){
    super.onReady();
    var messages = db.collection("message").doc(doc_id).collection("msgList")
    .withConverter(
      fromFirestore: Msgcontent.fromFirestore, 
      toFirestore: (Msgcontent msgcontent, options)=> msgcontent.toFirestore()).orderBy("addtime", descending: true);
      state.msgcontentList.clear();

      listener = messages.snapshots().listen((event) {
        for(var change in event.docChanges){
          switch(change.type){
            case DocumentChangeType.added:
              if(change.doc.data()!=null){
                state.msgcontentList.insert(0, change.doc.data()!);
              }
              break;

            case DocumentChangeType.modified:
              break;

            case DocumentChangeType.removed:
              break;
          }
        }
        
      },

      onError: (error)=> print("Listen failed: $error")
    );
  }

  @override
  void dispose(){
    msgScrolling.dispose();
    listener.cancel();
    super.dispose();
  }
  

}