import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:synram_practical/bloc/merchant/merchant_balance/merchant_balance_bloc.dart';
import 'package:synram_practical/model/merchant_balance_model.dart';
import 'package:synram_practical/utils/app_images.dart';
import 'package:synram_practical/utils/app_string.dart';
import 'package:synram_practical/utils/app_widget.dart';
import 'package:synram_practical/utils/shared_pref.dart';

class MerchantBalance extends StatefulWidget {
  const MerchantBalance({Key? key}) : super(key: key);

  @override
  State<MerchantBalance> createState() => _MerchantBalanceState();
}

class _MerchantBalanceState extends State<MerchantBalance> {
  MerchantBalanceBloc merchantBalanceBloc = MerchantBalanceBloc();
  MerchantBalanceModel? merchantBalanceModel;
  bool? loading;

  @override
  void initState() {
    merchantBalanceBloc = BlocProvider.of<MerchantBalanceBloc>(context);
    merchantBalanceBloc.add(GetMerchantBalanceEventData(
        userID: SharedPreferenceClass.getString(AppStrings.userId)));

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            children: [
              AppWidget.appBarWidget(text: 'merchantBalance'.tr),
              Expanded(
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.w),
                    child:
                        BlocConsumer<MerchantBalanceBloc, MerchantBalanceState>(
                      listener: (context, state) {
                        if (state is MerchantBalanceInitial) {
                          setState(() {
                            loading = state.loading;
                          });
                        } else if (state is MerchantBalanceLoaded) {
                          setState(() {
                            merchantBalanceModel = state.merchantBalanceModel;
                          });
                        }
                      },
                      builder: ((context, state) {
                        return loading == true
                            ? AppWidget.circularIndicator()
                            : merchantBalanceModel?.data == null
                                ? Center(
                                    child: Text(
                                      'noDataFound'.tr,
                                      style: TextStyle(fontSize: 12.sp),
                                    ),
                                  )
                                : ListView(
                                    children: [
                                      Column(
                                        children: [
                                          SizedBox(
                                            height: 2.h,
                                          ),
                                          Container(
                                            width: 100.w,
                                            height: 30.h,
                                            decoration: BoxDecoration(
                                                color: merchantBalanceModel
                                                            ?.data?.last.subject
                                                            .toString() ==
                                                        'Sum All'
                                                    ? Colors.red
                                                    : Colors.red.shade100,
                                                borderRadius:
                                                    BorderRadius.circular(4.w)),
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 2.w,
                                                  vertical: 2.w),
                                              child: Column(children: [
                                                Text(
                                                  merchantBalanceModel?.data
                                                              ?.last.subject
                                                              .toString() ==
                                                          'Sum All'
                                                      ? 'sumAll'.tr
                                                      : '',
                                                  style: TextStyle(
                                                      color: merchantBalanceModel
                                                                  ?.data
                                                                  ?.last
                                                                  .subject
                                                                  .toString() ==
                                                              'Sum All'
                                                          ? Colors.white
                                                          : Colors.black,
                                                      fontSize: 10.sp,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                SizedBox(
                                                  height: 1.w,
                                                ),
                                                Expanded(
                                                    child: AppWidget.merchantWidget(
                                                        imageString:
                                                            AppImages.group_29,
                                                        spendPrice:
                                                            merchantBalanceModel
                                                                ?.data
                                                                ?.last
                                                                .spentUsd
                                                                .toString(),
                                                        recievedPrice:
                                                            merchantBalanceModel
                                                                ?.data
                                                                ?.last
                                                                .recivedUsd
                                                                .toString(),
                                                        remindPrice:
                                                            merchantBalanceModel
                                                                ?.data
                                                                ?.last
                                                                .remindUsd
                                                                .toString())),
                                                SizedBox(
                                                  height: 2.h,
                                                ),
                                                Expanded(
                                                    child: Container(
                                                        child: AppWidget.merchantWidget(
                                                            imageString:
                                                                AppImages
                                                                    .group_28,
                                                            spendPrice:
                                                                merchantBalanceModel
                                                                    ?.data
                                                                    ?.last
                                                                    .spentRmb
                                                                    .toString(),
                                                            recievedPrice:
                                                                merchantBalanceModel
                                                                    ?.data
                                                                    ?.last
                                                                    .recivedRmb
                                                                    .toString(),
                                                            remindPrice:
                                                                merchantBalanceModel
                                                                    ?.data
                                                                    ?.last
                                                                    .remindRmb
                                                                    .toString()))),
                                              ]),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 2.h,
                                          ),
                                        ],
                                      ),
                                      ListView.builder(
                                          shrinkWrap: true,
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          itemCount: ((merchantBalanceModel
                                                  ?.data?.length)! -
                                              1),
                                          itemBuilder: ((context, index) {
                                            return Column(
                                              children: [
                                                SizedBox(
                                                  height: 2.h,
                                                ),
                                                Container(
                                                  width: 100.w,
                                                  height: 30.h,
                                                  decoration: BoxDecoration(
                                                      color: merchantBalanceModel!
                                                                  .data![index]
                                                                  .subject
                                                                  .toString() ==
                                                              'sumAll'.tr
                                                          ? Colors.red
                                                          : Colors.red.shade100,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4.w)),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 2.w,
                                                            vertical: 2.w),
                                                    child: Column(children: [
                                                      Text(
                                                        merchantBalanceModel!
                                                                    .data![
                                                                        index]
                                                                    .subject
                                                                    .toString() ==
                                                                'Order'
                                                            ? 'merchantOrder'.tr
                                                            : merchantBalanceModel!
                                                                        .data![
                                                                            index]
                                                                        .subject
                                                                        .toString() ==
                                                                    'Merchant Company'
                                                                ? 'merchantCompany'
                                                                    .tr
                                                                : merchantBalanceModel!
                                                                            .data![
                                                                                index]
                                                                            .subject
                                                                            .toString() ==
                                                                        'Container Amount'
                                                                    ? 'containerAmount'
                                                                        .tr
                                                                    : 'exchangeBalance'
                                                                        .tr,
                                                        style: TextStyle(
                                                            color: merchantBalanceModel!
                                                                        .data![
                                                                            index]
                                                                        .subject
                                                                        .toString() ==
                                                                    'Sum All'
                                                                ? Colors.white
                                                                : Colors.black,
                                                            fontSize: 10.sp,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      SizedBox(
                                                        height: 1.w,
                                                      ),
                                                      Expanded(
                                                          child: AppWidget.merchantWidget(
                                                              imageString:
                                                                  AppImages
                                                                      .group_29,
                                                              spendPrice:
                                                                  merchantBalanceModel!
                                                                      .data![
                                                                          index]
                                                                      .spentUsd
                                                                      .toString(),
                                                              recievedPrice:
                                                                  merchantBalanceModel!
                                                                      .data![
                                                                          index]
                                                                      .recivedUsd
                                                                      .toString(),
                                                              remindPrice:
                                                                  merchantBalanceModel!
                                                                      .data![
                                                                          index]
                                                                      .remindUsd
                                                                      .toString())),
                                                      SizedBox(
                                                        height: 2.h,
                                                      ),
                                                      Expanded(
                                                          child: Container(
                                                              child: AppWidget.merchantWidget(
                                                                  imageString:
                                                                      AppImages
                                                                          .group_28,
                                                                  spendPrice: merchantBalanceModel!
                                                                      .data![
                                                                          index]
                                                                      .spentRmb
                                                                      .toString(),
                                                                  recievedPrice: merchantBalanceModel!
                                                                      .data![
                                                                          index]
                                                                      .recivedRmb
                                                                      .toString(),
                                                                  remindPrice: merchantBalanceModel!
                                                                      .data![
                                                                          index]
                                                                      .remindRmb
                                                                      .toString()))),
                                                    ]),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 2.h,
                                                ),
                                              ],
                                            );
                                          })),
                                    ],
                                  );
                      }),
                    )),
              )
            ],
          )),
    ));
  }
}
