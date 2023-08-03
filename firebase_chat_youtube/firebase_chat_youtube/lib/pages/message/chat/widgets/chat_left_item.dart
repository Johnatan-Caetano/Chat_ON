import 'package:ChatON/common/entities/entities.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';

Widget ChatLeftItem(Msgcontent item){
  return Container(
    padding: EdgeInsets.only(top: 10.w, left: 15.w, bottom: 10.w),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
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
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10.w)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5), // cor da sombra
                  spreadRadius: 2, // o tamanho do "espalhamento" da sombra
                  blurRadius: 5, // o desfoque da sombra
                  offset: Offset(0, 3), // deslocamento da sombra em relação ao container (x, y)
                ),
              ],
            ),
            child: item.type == "text"
                ? Text("${item.content}")
                : ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: 90.w),
                    child: GestureDetector(
                      onTap: () {},
                      child: CachedNetworkImage(imageUrl: "${item.content}"),
                    ),
                  ),
          ),

        ),
      ],
    ),
  );
}