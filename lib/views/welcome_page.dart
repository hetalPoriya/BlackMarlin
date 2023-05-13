import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:synram_practical/helper/route_helper.dart';
import 'package:synram_practical/utils/app_images.dart';
import 'package:synram_practical/utils/app_string.dart';
import 'package:synram_practical/utils/language_string.dart';
import 'package:synram_practical/utils/shared_pref.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  void didChangeDependencies() {
    precacheImage(AssetImage(AppImages.background), context);
    super.didChangeDependencies();
  }

  @override
  void initState() {
    Timer(Duration(seconds: 2), () async {
      String? modelData = await SharedPreferenceClass.getUserData();

      // if (modelData.toString().isNotEmpty) {
      //
      //   print('SuccesFu;; ${data['Data'][0]['userID']}');
      bool lan = SharedPreferenceClass.getBool(AppStrings.chooseLan, false);
      if (lan == false) {
        Get.offAllNamed(RouteHelper.chooseLan);
      } else {
        Get.offAllNamed(RouteHelper.mainScreen);
      }

      // var response = LoginAndSignUpModel.fromJson(data);
      // loginAndSignUpModel.userData!.type == 1
      //     ? Get.offAllNamed('/adminHomePage')
      //     : Get.offAllNamed('/userHomePage');
      // } else {
      //   Get.offAllNamed(RouteHelper.mainScreen);
      // }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
              color: Colors.orange.shade900,
              image: DecorationImage(
                  image: AssetImage(AppImages.background),
                  fit: BoxFit.fill,
                  colorFilter:
                      ColorFilter.mode(Colors.white10, BlendMode.dstATop))),
          child: Container(
              height: 100.h,
              width: 100.w,
              //color: Colors.red,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 12.h,
                  ),
                  Text(
                    'welcome'.tr,
                    style: TextStyle(fontSize: 35.sp, color: Colors.white),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    child: Text(
                      'welcomeNewText'.tr,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 12.sp, color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    height: 18.h,
                  ),
                  Container(
                      width: 100.w,
                      color: Colors.white,
                      child: Image.asset(
                        AppImages.logo,
                        width: 70.w,
                        height: 20.h,
                      ))
                ],
              )),
        ),
      ),
    );
  }
}
