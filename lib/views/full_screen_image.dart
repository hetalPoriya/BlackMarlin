// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:sizer/sizer.dart';
// import 'package:synram_practical/utils/app_widget.dart';
//
// class FullScreenImage extends StatelessWidget {
//   const FullScreenImage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     print(Get.arguments[0]);
//     print(Get.arguments[1]);
//     print(Get.arguments[2]);
//     return SafeArea(
//         child: Scaffold(
//       body: Column(children: [
//         AppWidget.appBarWidget(text: ''),
//         Expanded(
//             child: Padding(
//           padding: EdgeInsets.symmetric(horizontal: 6.w),
//           child: Column(
//             children: [
//               SizedBox(
//                 height: 4.h,
//               ),
//               Expanded(
//                   child: Container(
//                       decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(4.w),
//                 image: DecorationImage(
//                     image: NetworkImage(Get.arguments[2].toString()),
//                     fit: BoxFit.fill),
//               ))),
//               SizedBox(
//                 height: 4.h,
//               ),
//               Expanded(
//                   child: SingleChildScrollView(
//                     child: Text(
//                       Get.arguments[1],
//                       style: TextStyle(fontSize: 12.sp),
//                     ),
//                   ),
//                   flex: 2),
//               SizedBox(
//                 height: 1.h,
//               ),
//             ],
//           ),
//         ))
//       ]),
//     ));
//   }
// }
