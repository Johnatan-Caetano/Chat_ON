import 'package:ChatON/pages/chat/controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../common/values/colors.dart';


class ChatPage extends GetView<ChatController> {
const ChatPage({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {

    AppBar _buildAppBar(){
      return AppBar(
        backgroundColor: Color(0xFF73022C),
        elevation: 4,
        title: Container(
          padding: EdgeInsets.only(top: 0.w, bottom: 0.w, right: 0.w),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.only(top: 0.w, bottom: 0.w, right: 0.w),
                child: InkWell(
                  child: SizedBox(
                    width: 44.w,
                    height: 44.w,
                    child: CachedNetworkImage(
                      imageUrl: controller.state.to_avatar.value,
                      imageBuilder: (context, imageProvider) => Container(
                        height: 44.w,
                        width: 44.w,
                        margin: null,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(44.w)),
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover, 
                          )
                        ),
                      ),
                      errorWidget: (context, url, error) => Image(
                        image: AssetImage('assets/images/feature-1.png'), 
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 15.w,),
              Container(
                width: 180.w,
                padding: EdgeInsets.only(top: 0.w, bottom: 0.w, right: 0.w),
                child: Row(
                  children: [
                    SizedBox(
                      width: 180.w,
                      height: 44.w,
                      child: GestureDetector(
                        onTap: (){

                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              controller.state.to_name.value,
                              overflow: TextOverflow.clip,
                              maxLines: 1,
                              style: TextStyle(
                                fontFamily: 'Avenir',
                                fontWeight: FontWeight.bold,
                                color: AppColors.primaryBackground,
                                fontSize: 16.sp
                              ),
                            ),
                            Text(
                              "unknow location",
                              overflow: TextOverflow.clip,
                              maxLines: 1,
                              style: TextStyle(
                                fontFamily: 'Avenir',
                                fontWeight: FontWeight.normal,
                                color: AppColors.primaryBackground,
                                fontSize: 14.sp
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      );
    }

    return Scaffold(
      appBar: _buildAppBar(),
      body: SafeArea(
        child: ConstrainedBox(
          constraints: BoxConstraints.expand(),
          child: Stack(
            children: [
              Positioned(
                bottom: 0.h,
                height: 50.h,
                child: Container(
                  width: 360.w,
                  height: 50.h,
                  color: AppColors.primaryBackground,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 250.w,
                        height: 50.h,
                        child: TextField(
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          controller: controller.textController,
                          autofocus: false,
                          focusNode: controller.contentNode,
                          decoration:const InputDecoration(
                            hintText: "Envie sua mensagem",
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF73022C)),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF73022C)),
                            ),
                          ),
                        )
                      ),
                      Container(
                        height: 30.h,
                        width: 30.w,
                        margin: EdgeInsets.only(left: 25.w),
                        child: GestureDetector(
                          child: Icon(
                            Icons.arrow_circle_right_outlined,
                            size: 30.w,
                            color: Color(0xFF73022C),
                          ),
                          onTap: (){
                            controller.sendMessage();
                          },
                        ),
                      ),
                      Container(
                        height: 30.h,
                        width: 30.w,
                        margin: EdgeInsets.only(left: 15.w),
                        child: GestureDetector(
                          child: Icon(
                            Icons.photo_outlined,
                            size: 30.w,
                            color: Color(0xFF73022C),
                          ),
                          onTap: (){

                          },
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        )
      )
    );
  }
}