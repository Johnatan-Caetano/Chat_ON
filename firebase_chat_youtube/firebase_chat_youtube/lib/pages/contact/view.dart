import 'package:ChatON/common/widgets/app.dart';
import 'package:ChatON/common/widgets/button.dart';
import 'package:ChatON/pages/contact/controller.dart';
import 'package:ChatON/pages/contact/widgets/contact_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dots_indicator/dots_indicator.dart';

import '../../common/values/colors.dart';
import '../../common/values/shadows.dart';

class ContactPage extends GetView<ContactController> {
const ContactPage({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {

    AppBar _buildAppBar(){
      return AppBar(
        backgroundColor: Color(0xFF73022C), // Define a cor de fundo da AppBar como transparente
        elevation: 4,
        centerTitle: true,
        title: Text(
          "Contatos",
          style: TextStyle(
            color: AppColors.primaryBackground,
            fontSize: 18.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
      );
}



    return Scaffold(
      appBar: _buildAppBar(),
      body: ContactList(),
    );
  }
}