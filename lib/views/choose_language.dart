import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:synram_practical/helper/route_helper.dart';
import 'package:synram_practical/utils/app_string.dart';
import 'package:synram_practical/utils/app_widget.dart';
import 'package:synram_practical/utils/shared_pref.dart';

class ChooseLanguage extends StatefulWidget {
  const ChooseLanguage({Key? key}) : super(key: key);

  @override
  State<ChooseLanguage> createState() => _ChooseLanguageState();
}

class _ChooseLanguageState extends State<ChooseLanguage> {
  final List locale = [
    {'name': 'English', 'locale': Locale('en_US')},
    {'name': 'Arabic', 'locale': Locale('ar')},
    {'name': 'kurdish', 'locale': Locale('ckb')},
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
          height: 100.h,
          width: 100.w,
          child: Column(
            children: [
              Container(
                height: 8.h,
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(8.w)),
                  color: Colors.orange.shade900,
                ),
                child: Container(
                  height: 100.h,
                  width: 100.w,
                  margin: EdgeInsets.only(left: 8.w),
                  alignment: Alignment.center,
                  child: Container(
                    child: Text('Choose Language',
                        style: TextStyle(
                            fontSize: 15.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
              ),
              SizedBox(
                height: 4.h,
              ),
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: locale.length,
                  itemBuilder: ((context, index) {
                    return Column(
                      children: [
                        languageSelect(
                            onTap: () {
                              SharedPreferenceClass.setBool(
                                  AppStrings.chooseLan, true);
                              Get.offAllNamed(RouteHelper.mainScreen);

                              SharedPreferenceClass.setString(
                                  AppStrings.localCode,
                                  '${locale[index]['locale']}');
                              Get.updateLocale(
                                  Locale(locale[index]['locale'].toString()));
                            },
                            text: locale[index]['name']),
                        SizedBox(
                          height: 2.h,
                        ),
                      ],
                    );
                  }))
            ],
          )),
    ));
  }

  languageSelect({VoidCallback? onTap, String? text}) => Padding(
        padding: EdgeInsets.symmetric(horizontal: 6.w),
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            height: 6.h,
            width: 100.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2.w),
                color: Colors.orange.shade900),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.w),
              child: Row(children: [
                Icon(
                  Icons.flag,
                  color: Colors.white,
                  size: 6.w,
                ),
                SizedBox(
                  width: 4.w,
                ),
                Text(
                  text.toString(),
                  style: TextStyle(color: Colors.white, fontSize: 12.sp),
                )
              ]),
            ),
          ),
        ),
      );
}
