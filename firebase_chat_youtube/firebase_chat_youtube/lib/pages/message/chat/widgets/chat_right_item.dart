import 'package:ChatON/common/entities/entities.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';

Widget ChatRightItem(Msgcontent item){
  return Container(
    padding: EdgeInsets.only(top: 10.w, left: 15.w, bottom: 10.w),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: 230.w,
            minHeight: 40.w
          ),
          child: Container(
            margin: EdgeInsets.only(right: 10.w, top: 0.w),
            padding: EdgeInsets.only(top: 10.w, left: 10.w, right: 10.w),
            decoration: BoxDecoration(
              color: Color(0xFF73022C),
              borderRadius: BorderRadius.all(Radius.circular(10.w))
            ),
            child: item.type == "text"? Text(
              "${item.content}",
              style: TextStyle(
                color: Colors.white
              ),
            ):
            ConstrainedBox(
             constraints: BoxConstraints(
                maxWidth: 90.w,
              ),
              child: GestureDetector(
                onTap: (){

                },
                child: CachedNetworkImage(
                  imageUrl: "${item.content}"
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}