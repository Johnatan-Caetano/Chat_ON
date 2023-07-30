import 'package:ChatON/common/widgets/button.dart';
import 'package:ChatON/pages/sign_in/controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dots_indicator/dots_indicator.dart';

import '../../common/values/colors.dart';
import '../../common/values/shadows.dart';

class SignInPage extends GetView<SignInController> {
const SignInPage({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {

    Widget _buildLogo(){
      return Container(
        width: 110.w,
        margin: EdgeInsets.only(top: 84.h),
        child: Column(children: [
          Container(
            width: 100.w,
            height: 100.w,
            margin: EdgeInsets.symmetric(horizontal: 15.w),
            child: Stack(
              children: [
                Positioned(
                  child: Image.asset(
                    "assets/images/Chat_on_logo.png",
                    width: 90.w
                  )
                ),
              ],
            ),
          )
        ]),
      );
    }

    Widget _buildThirdPartyLogin(){
      return Container(
        width: 295.w,
        margin: EdgeInsets.only(bottom: 280.h),
        child: Column(
          children: [
            Text(
              "Entre com a sua rede social",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.primaryText,
                fontWeight: FontWeight.w400,
                fontSize: 16.sp,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top:30.h, left: 50.w, right: 50.w
              ),
              child: btnFlatButtonWidget(
                onPressed: (){controller.handleSignIn();},
                width: 200.w,
                height: 40.h,
                title: "Google Login",
                gbColor: Colors.white,
                fontColor: Colors.black,
                elevation: 4,
                image: AssetImage("assets/images/google-logo.png"),
              ),
            ),


          ]
        ),
      );
    }

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            _buildLogo(),
            Spacer(),
            _buildThirdPartyLogin()
          ],
        ),
      )
    );
  }
}