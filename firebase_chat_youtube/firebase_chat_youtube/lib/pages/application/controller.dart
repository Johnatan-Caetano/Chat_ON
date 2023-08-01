import 'package:ChatON/common/entities/entities.dart';
import 'package:ChatON/common/routes/names.dart';
import 'package:ChatON/common/style/color.dart';
import 'package:ChatON/common/widgets/toast.dart';
import 'package:ChatON/pages/application/state.dart';
import 'package:ChatON/pages/sign_in/state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ChatON/pages/sign_in/index.dart';

import '../../common/store/user.dart';
import '../../common/values/colors.dart';



class ApplicationController extends GetxController{
  final state = ApplicationState();
  ApplicationController();
 
  late final List<String> tabTitles;
  late final PageController pageController;
  late final List<BottomNavigationBarItem> bottomTabs;
  
  void handlePageChanged(int index){
    state.page = index;
  }

  void handleNavBarTap(int index){
    pageController.jumpToPage(index);
  }

  @override
  void onInit(){
    super.onInit();
    tabTitles = ['Conversas', 'Contatos', 'Configurações'];
    bottomTabs = <BottomNavigationBarItem>[
      const BottomNavigationBarItem(
        icon: Icon(Icons.message,
        color: AppColors.thirdElementText),
        activeIcon: Icon(
          Icons.message,
          color: Color(0xFF73022C),
        ),
        label: 'Conversas',
        backgroundColor: AppColors.primaryBackground
      ),

      const BottomNavigationBarItem(
        icon: Icon(Icons.contact_page,
        color: AppColors.thirdElementText),
        activeIcon: Icon(
          Icons.contact_page,
          color: Color(0xFF73022C),
        ),
        label: 'Contatos',
        backgroundColor: AppColors.primaryBackground
      ),

      const BottomNavigationBarItem(
        icon: Icon(Icons.settings,
        color: AppColors.thirdElementText),
        activeIcon: Icon(
          Icons.settings,
          color: Color(0xFF73022C),
        ),
        label: 'Configurações',
        backgroundColor: AppColors.primaryBackground
      ),
    ];
    pageController = PageController(initialPage: state.page);
  }

  @override
  void dispose(){
    pageController.dispose();
    super.dispose();
  }

}