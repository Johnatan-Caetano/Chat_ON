import 'package:ChatON/common/widgets/button.dart';
import 'package:ChatON/pages/sign_in/controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dots_indicator/dots_indicator.dart';

import '../../common/values/colors.dart';
import '../../common/values/shadows.dart';
import 'controller.dart';

class ApplicationPage extends GetView<ApplicationController> {
const ApplicationPage({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {

    Widget _buildPageView(){
      return PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: controller.pageController,
        onPageChanged: controller.handlePageChanged,
        children: [
          Center(child: Text('Conversas'),),
          Center(child: Text('Contatos'),),
          Center(child: Text('Configurações'),)
        ],
      );
    }

    Widget _buildBottomNavigationBar(){
      return Obx(() => BottomNavigationBar(items: controller.bottomTabs,
      currentIndex: controller.state.page,
      type: BottomNavigationBarType.fixed,
      onTap: controller.handleNavBarTap,
      showUnselectedLabels: true,
      showSelectedLabels: true,
      unselectedItemColor: AppColors.tabBarElement,
      selectedItemColor: Colors.red,
      ));
    }
    return Scaffold(
      body: _buildPageView(),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }
}