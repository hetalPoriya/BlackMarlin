import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:synram_practical/utils/app_images.dart';

class AppWidget {
  static Widget textFormFieldWidget(
          {String? hintText,
          IconData? icon,
          IconData? suffixIcon,
          TextInputType? textInputType,
          TextInputAction? actionType,
          TextEditingController? textEditingController,
          String? Function(String?)? validator,
          bool? obscureText,
          VoidCallback? onPressed}) =>
      TextFormField(
        obscureText: obscureText ?? false,
        decoration: InputDecoration(
            hintText: hintText.toString(),
            prefixIcon: Icon(icon, color: Colors.grey.shade600),
            suffixIcon: IconButton(
                icon: Icon(suffixIcon, color: Colors.grey.shade600),
                onPressed: onPressed),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade600)),
            border: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade600))),
        keyboardType: textInputType ?? TextInputType.text,
        textInputAction: actionType ?? TextInputAction.next,
        controller: textEditingController,
        validator: validator,
      );

  static Widget merchantWidget(
          {String? imageString,
          String? spendPrice,
          String? recievedPrice,
          String? remindPrice}) =>
      Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(4.w)),
        child: Row(children: [
          Expanded(
              child: Container(
            padding: EdgeInsets.symmetric(horizontal: 1.w, vertical: 1.w),
            child: Image.asset(imageString ?? AppImages.group_29),
          )),
          Expanded(
              flex: 4,
              child: Container(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 100.w,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Container(
                                  child: Text('spent'.tr,
                                      style: TextStyle(
                                          fontSize: 9.sp,
                                          fontWeight: FontWeight.w600)),
                                ),
                              ),
                              Flexible(
                                  child: Container(
                                child: FittedBox(
                                  child: Text(spendPrice.toString(),
                                      style: TextStyle(
                                          fontSize: 9.sp,
                                          fontWeight: FontWeight.w600)),
                                ),
                              )),
                            ]),
                      ),
                      SizedBox(
                        height: 1.w,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                                child: Text(
                              'received'.tr,
                              style: TextStyle(
                                  fontSize: 9.sp, fontWeight: FontWeight.w600),
                            )),
                            Flexible(
                                child: Text(recievedPrice.toString(),
                                    style: TextStyle(
                                        fontSize: 9.sp,
                                        fontWeight: FontWeight.w600))),
                          ]),
                      SizedBox(
                        height: 1.w,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                                child: Text('remind'.tr,
                                    style: TextStyle(
                                        fontSize: 9.sp,
                                        fontWeight: FontWeight.w600))),
                            Flexible(
                                child: Text(remindPrice.toString(),
                                    style: TextStyle(
                                        fontSize: 9.sp,
                                        fontWeight: FontWeight.w600))),
                          ]),
                    ],
                  ),
                ),
              )),
        ]),
      );

  static Widget shippingCostDailyWidget({String? text, String? amount}) =>
      Container(
        height: 10.h,
        width: 100.w,
        decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
              image: AssetImage(AppImages.background),
              fit: BoxFit.fill,
              colorFilter: ColorFilter.mode(Colors.white10, BlendMode.dstATop)),
          borderRadius: BorderRadius.circular(4.w),
        ),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            text.toString(),
            style: TextStyle(
                color: Colors.black,
                fontSize: 14.sp,
                fontWeight: FontWeight.bold),
          ),
          Text(
            amount.toString(),
            style: TextStyle(
                color: Colors.orange.shade600,
                fontSize: 14.sp,
                fontWeight: FontWeight.bold),
          )
        ]),
      );

  static Widget circularIndicator() => Center(
          child: Center(
              child: CircularProgressIndicator(
        color: Colors.black,
      )));

  static Widget appBarWidget({String? text}) => Container(
        height: 8.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(8.w)),
          color: Colors.orange.shade900,
        ),
        child: Row(children: [
          Expanded(
            child: Container(
              height: 100.h,
              width: 100.w,
              margin: EdgeInsets.only(left: 8.w),
              alignment: Alignment.centerLeft,
              child: GestureDetector(
                onTap: () => Get.back(),
                child: Icon(Icons.arrow_back_ios_rounded,
                    color: Colors.white, size: 4.h),
              ),
            ),
          ),
          Expanded(
              child: Container(
                child: Text(text.toString(),
                    style: TextStyle(
                        fontSize: 15.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.bold)),
              ),
              flex: 2),
        ]),
      );

  static Widget merchantReportUnderContainer(
          {String? text, String? price, double? fontSize}) =>
      Flexible(
        child: Container(
          width: 100.w,
          child: Column(
            children: [
              Text(
                text.toString(),
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: Colors.orange.shade900,
                    fontWeight: FontWeight.bold,
                    fontSize: fontSize ?? 12.sp),
              ),
              Text(
                price.toString(),
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: fontSize ?? 10.sp),
              ),
            ],
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
          ),
        ),
      );

  static Widget merchantReportWidget(
          {String? date,
          String? text1,
          String? text2,
          String? text3,
          String? price1,
          String? price2,
          String? price3}) =>
      Column(
        children: [
          Material(
              child: Container(
                width: 100.w,
                height: 15.h,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                        child: Container(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4.w),
                        child: Row(children: [
                          Icon(
                            Icons.calendar_today,
                            color: Colors.black54,
                            size: 4.w,
                          ),
                          Text(
                            date.toString(),
                            style: TextStyle(
                                color: Colors.black54, fontSize: 9.sp),
                          )
                        ]),
                      ),
                    )),
                    Flexible(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.w),
                          child: Container(
                            width: 100.w,
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  AppWidget.merchantReportUnderContainer(
                                      text: 'spent'.tr,
                                      price: price1.toString()),
                                  AppWidget.merchantReportUnderContainer(
                                      text: 'received'.tr,
                                      price: price2.toString()),
                                  AppWidget.merchantReportUnderContainer(
                                      text: 'currency'.tr,
                                      price: price3.toString()),
                                ]),
                          ),
                        ),
                        flex: 2),
                    Flexible(
                        child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.w),
                      child: Container(
                          alignment: Alignment.centerLeft,
                          child: Text('subject'.tr,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: TextStyle(
                                  fontSize: 9.sp, color: Colors.black))),
                    )),
                  ],
                ),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.lightBlue.shade50),
                    color: Colors.white38,
                    borderRadius: BorderRadius.circular(4.w)),
              ),
              elevation: 4,
              borderRadius: BorderRadius.circular(4.w)),
          SizedBox(
            height: 4.h,
          )
        ],
      );

  static Widget formToEndTo({String? text, VoidCallback? onPressed}) =>
      GestureDetector(
        onTap: onPressed,
        child: Container(
          width: 25.w,
          height: 4.h,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.lightBlue.shade200),
              borderRadius: BorderRadius.circular(2.w)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: Container(
                  alignment: Alignment.center,
                  width: 100.w,
                  height: 100.h,
                  child: FittedBox(
                    child: Text(
                      text.toString(),
                      style: TextStyle(color: Colors.black, fontSize: 10.sp),
                    ),
                  ),
                ),
                flex: 2,
              ),
              Flexible(
                child: Container(
                  alignment: Alignment.center,
                  width: 100.w,
                  height: 100.h,
                  child: Icon(
                    Icons.arrow_drop_down_rounded,
                    color: Colors.lightBlue.shade400,
                    size: 30,
                  ),
                ),
                flex: 1,
              )
            ],
          ),
        ),
      );

  static Widget normalText({String? text, double? fontSize, Color? color}) =>
      Text(
        text.toString(),
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
            fontSize: fontSize ?? 12.sp,
            color: color ?? Colors.black,
            fontWeight: FontWeight.bold),
      );

  static Widget merchantReportContainer(
          {String? description,
          String? count,
          String? date,
          String? completeDate,
          String? subject,
          String? recievedRMB,
          String? recievedUSD,
          String? currency}) =>
      Container(
        height: 18.h,
        width: 100.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.w), color: Colors.white),
        child: Column(children: [
          Flexible(
              flex: 3,
              child: Container(
                width: 100.w,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.w),
                  child: Column(children: [
                    Flexible(
                      child: Container(
                        width: 100.w,
                        alignment: Alignment.centerRight,
                        child: Text(count.toString(),
                            style: TextStyle(
                                fontSize: 10.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.orange.shade900)),
                      ),
                    ),
                    Flexible(
                        child: Container(
                          width: 100.w,
                          child: Row(children: [
                            Flexible(
                              child: Container(
                                child: Column(
                                  children: [
                                    Flexible(
                                      child: Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          Icon(Icons.calendar_today_rounded,
                                              size: 8.w, color: Colors.black54),
                                          Positioned(
                                            bottom: 1.w,
                                            child: Text(date.toString(),
                                                style:
                                                    TextStyle(fontSize: 8.sp)),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Flexible(
                                        child: Text(
                                      completeDate.toString(),
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 4.sp),
                                    ))
                                  ],
                                ),
                              ),
                            ),
                            Flexible(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AppWidget.normalText(
                                    text: subject.toString(),
                                    color: Colors.grey.shade600,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      AppWidget.merchantReportUnderContainer(
                                          fontSize: 10.sp,
                                          text: 'received¥'.tr,
                                          price: recievedRMB.toString()),
                                      AppWidget.merchantReportUnderContainer(
                                          fontSize: 10.sp,
                                          text: 'received\$'.tr,
                                          price: recievedUSD.toString()),
                                      AppWidget.merchantReportUnderContainer(
                                          fontSize: 10.sp,
                                          text: 'currency'.tr,
                                          price: currency.toString())
                                    ],
                                  )
                                ],
                              ),
                              flex: 8,
                            )
                          ]),
                        ),
                        flex: 4),
                  ]),
                ),
              )),
          Flexible(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              child: Container(
                width: 100.w,
                alignment: Alignment.centerLeft,
                child: Text(
                  'description:- ${description}'.tr,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: TextStyle(fontSize: 9.sp),
                ),
              ),
            ),
          ),
        ]),
      );

  static Widget merchantReportUpperContainer(
          {String? USDPrice, String? RMBPrice, Color? color}) =>
      Container(
        height: 10.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.w),
            color: color ?? Colors.lightGreen.shade100),
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Container(
            child: Row(children: [
              Container(width: 12.w),
              AppWidget.normalText(text: 'received\$'.tr, fontSize: 9.sp),
              AppWidget.normalText(text: 'received¥'.tr, fontSize: 9.sp)
            ], mainAxisAlignment: MainAxisAlignment.spaceEvenly),
          ),
          Container(
            height: 4.h,
            margin: EdgeInsets.symmetric(horizontal: 4.w),
            padding: EdgeInsets.symmetric(horizontal: 1.w),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2.w), color: Colors.white),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  FittedBox(child: AppWidget.normalText(text: 'total'.tr)),
                  FittedBox(
                      child: AppWidget.normalText(text: USDPrice.toString())),
                  FittedBox(
                      child: AppWidget.normalText(text: RMBPrice.toString()))
                ]),
          )
        ]),
      );

  static Widget mainContainerWidgetMerchantReport({Widget? widget}) => Material(
        elevation: 4,
        borderRadius: BorderRadius.circular(4.w),
        child: Container(
          width: 100.w,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.w),
              color: Colors.red.shade50),
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
              child: widget),
        ),
      );
}
