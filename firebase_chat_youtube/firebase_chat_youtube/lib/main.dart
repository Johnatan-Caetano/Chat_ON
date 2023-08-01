import 'package:ChatON/common/routes/pages.dart';
import 'package:ChatON/common/services/services.dart';
import 'package:ChatON/common/store/config.dart';
import 'package:ChatON/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'common/store/user.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await Get.putAsync<StorageService>(() => StorageService().init());
  Get.put<ConfigStore>(ConfigStore());
  Get.put<UserStore>(UserStore());


  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        builder: (BuildContext context, Widget? child)=> GetMaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,
        //home: Center(child:Container(child: Text("Project Started"),)),
      ),
    );
  }
}

