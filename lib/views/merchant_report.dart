import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:flutter/widgets.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sizer/sizer.dart';
import 'package:synram_practical/bloc/merchant/merchant_report/merchant_report_bloc.dart';
import 'package:synram_practical/helper/route_helper.dart';
import 'package:synram_practical/model/merchat_report_model.dart';
import 'package:synram_practical/utils/app_string.dart';
import 'package:synram_practical/utils/app_widget.dart';
import 'package:synram_practical/utils/shared_pref.dart';

class MerchantReportClass extends StatefulWidget {
  const MerchantReportClass({Key? key}) : super(key: key);

  @override
  State<MerchantReportClass> createState() => _MerchantReportClassState();
}

class _MerchantReportClassState extends State<MerchantReportClass> {
  int currentIndex = 0;
  MerchantReportBloc merchantReportBloc = MerchantReportBloc();
  bool? loadingPdf;
  bool? loading;
  MerchantReportModel? merchantReportModel;
  MerchantReportData? merchantReportData;
  String downloadMsg = 'Loading..';
  int percantage = 0;

  @override
  void initState() {
    merchantReportBloc = BlocProvider.of<MerchantReportBloc>(context);
    merchantReportBloc.add(GetMerchantReportDataEvent(
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
                child: Stack(
                  children: [
                    Column(children: [
                      AppWidget.appBarWidget(text: 'merchantReport'.tr),
                      Expanded(
                        child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 6.w),
                            child: BlocConsumer<MerchantReportBloc,
                                MerchantReportState>(
                              listener: (context, state) {
                                if (state is MerchantReportInitial) {
                                  setState(() {
                                    loading = state.loading;
                                  });
                                } else if (state is MerchantReportLoaded) {
                                  setState(() {
                                    merchantReportModel =
                                        state.merchantReportModel;
                                    merchantReportData =
                                        merchantReportModel?.data;
                                  });
                                }
                              },
                              builder: ((context, state) {
                                return loading == true
                                    ? AppWidget.circularIndicator()
                                    : (merchantReportModel?.status == 'false' ||
                                    merchantReportModel?.data == null)
                                    ? Center(child: Text('noDataFound'.tr))
                                    : ListView(
                                  shrinkWrap: true,
                                  // crossAxisAlignment:
                                  //     CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 2.h,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment
                                          .spaceBetween,
                                      children: [
                                        AppWidget.normalText(
                                            text: 'finalTotal'.tr),
                                        GestureDetector(onTap: () async {
                                          setState(() {
                                            downloadMsg = 'Loading..';
                                          });
                                          Get.toNamed(RouteHelper.showPdf);
                                          // openFile(
                                          //     url: 'https://blackmarlinco.com/sys/ApiController/downloadReport?userID=${SharedPreferenceClass
                                          //         .getString(
                                          //         AppStrings.userId)}');
                                        },

                                            child: Icon(
                                                Icons.download_rounded)),
                                      ],),
                                    SizedBox(
                                      height: 1.h,
                                    ),
                                    Container(
                                      height: 12.h,
                                      width: 100.w,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(4.w),
                                          color: Colors.red.shade100),
                                      child: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment
                                              .spaceEvenly,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment
                                                  .spaceAround,
                                              children: [
                                                AppWidget.normalText(
                                                    text: 'usd'.tr,
                                                    fontSize: 14.sp),
                                                AppWidget.normalText(
                                                    text: 'rmb'.tr,
                                                    fontSize: 14.sp),
                                              ],
                                            ),
                                            Container(
                                              height: 4.h,
                                              margin:
                                              EdgeInsets.symmetric(
                                                  horizontal: 5.w),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                  BorderRadius
                                                      .circular(
                                                    2.w,
                                                  ),
                                                  color: Colors.white),
                                              child: Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceAround,
                                                  children: [
                                                    AppWidget.normalText(
                                                        text: merchantReportModel
                                                            ?.data
                                                            ?.finalTotal
                                                            ?.usd,
                                                        color: Colors
                                                            .orange
                                                            .shade900),
                                                    AppWidget.normalText(
                                                        text: merchantReportModel
                                                            ?.data
                                                            ?.finalTotal
                                                            ?.rmb,
                                                        color: Colors.orange
                                                            .shade900),
                                                  ]),
                                            ),
                                          ]),
                                    ),
                                    SizedBox(
                                      height: 2.h,
                                    ),
                                    Material(
                                      elevation: 4,
                                      borderRadius:
                                      BorderRadius.circular(4.w),
                                      child: Container(
                                        width: 100.w,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(
                                                4.w),
                                            color: Colors.red.shade50),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 4.w,
                                              vertical: 2.h),
                                          child: Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment
                                                  .start,
                                              children: [
                                                AppWidget.normalText(
                                                    text:
                                                    'receivedMoney'.tr),
                                                SizedBox(
                                                  height: 1.h,
                                                ),
                                                AppWidget
                                                    .merchantReportUpperContainer(
                                                  RMBPrice:
                                                  merchantReportData
                                                      ?.recivedMoney
                                                      ?.last.recivedUsd,
                                                  USDPrice:
                                                  merchantReportData
                                                      ?.recivedMoney
                                                      ?.last.recivedRmb,),
                                                SizedBox(
                                                  height: 1.h,
                                                ),
                                                // merchantReportData
                                                //             ?.recivedMoney
                                                //             ?.length ==
                                                //         0
                                                //     ? CircularProgressIndicator()
                                                //     :
                                                ListView.builder(
                                                  itemCount:
                                                  (merchantReportData
                                                      ?.recivedMoney
                                                      ?.length)! - 1,
                                                  shrinkWrap: true,
                                                  physics:
                                                  NeverScrollableScrollPhysics(),
                                                  itemBuilder:
                                                  ((context,
                                                      index) {
                                                    DateFormat
                                                    inputFormat =
                                                    DateFormat(
                                                        'dd-MM-yyyy');

                                                    return Column(
                                                      children: [
                                                        AppWidget
                                                            .merchantReportContainer(
                                                            date: merchantReportData
                                                                ?.recivedMoney?[index]
                                                                .date
                                                                .toString() !=
                                                                ''
                                                                ? DateFormat.d()
                                                                .format(
                                                                inputFormat
                                                                    .parse(
                                                                    merchantReportData
                                                                        ?.recivedMoney?[index]
                                                                        .date
                                                                        .toString() ??
                                                                        ' '))
                                                                : '',
                                                            completeDate: merchantReportData
                                                                ?.recivedMoney?[index]
                                                                .date
                                                                .toString() !=
                                                                ''
                                                                ? DateFormat
                                                                .yMMMM().format(
                                                                inputFormat
                                                                    .parse(
                                                                    merchantReportData
                                                                        ?.recivedMoney?[index]
                                                                        .date
                                                                        .toString() ??
                                                                        '12-09-2022'))
                                                                : '',
                                                            count: merchantReportData
                                                                ?.recivedMoney?[index]
                                                                .sNo.toString(),
                                                            currency: merchantReportData
                                                                ?.recivedMoney?[index]
                                                                .currencyType
                                                                .toString(),
                                                            description: merchantReportData
                                                                ?.recivedMoney?[index]
                                                                .description
                                                                .toString(),
                                                            recievedRMB: merchantReportData
                                                                ?.recivedMoney?[index]
                                                                .recivedRmb
                                                                .toString(),
                                                            recievedUSD: merchantReportData
                                                                ?.recivedMoney?[index]
                                                                .recivedUsd
                                                                .toString(),
                                                            subject: merchantReportData
                                                                ?.recivedMoney?[index]
                                                                .subject
                                                                .toString()),
                                                        SizedBox(
                                                          height:
                                                          1.h,
                                                        ),
                                                      ],
                                                    );
                                                  }),

                                                )
                                              ]),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 2.h,
                                    ),
                                    AppWidget
                                        .mainContainerWidgetMerchantReport(
                                      widget: Container(
                                        child: Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              AppWidget.normalText(
                                                  text: 'spendMoney'.tr),
                                              SizedBox(
                                                height: 1.h,
                                              ),
                                              AppWidget
                                                  .merchantReportUpperContainer(
                                                color:
                                                Colors.red.shade100,
                                                RMBPrice:
                                                merchantReportData?.spentMoney
                                                    ?.last
                                                    .spentRmb,
                                                USDPrice:
                                                merchantReportData?.spentMoney
                                                    ?.last
                                                    .spentUsd,

                                              ),
                                              SizedBox(
                                                height: 1.h,
                                              ),
                                              ListView.builder(

                                                itemCount: (merchantReportData
                                                    ?.spentMoney
                                                    ?.length)! - 1,
                                                shrinkWrap: true,
                                                physics:
                                                NeverScrollableScrollPhysics(),
                                                itemBuilder: ((context, index) {
                                                  DateFormat
                                                  inputFormat =
                                                  DateFormat(
                                                      'dd-MM-yyyy');
                                                  return Column(
                                                    children: [
                                                      AppWidget
                                                          .merchantReportContainer(
                                                          date: merchantReportData
                                                              ?.spentMoney?[index]
                                                              .date
                                                              .toString() != ''
                                                              ? DateFormat.d()
                                                              .format(
                                                              inputFormat.parse(
                                                                  merchantReportData
                                                                      ?.spentMoney?[index]
                                                                      .date
                                                                      .toString() ??
                                                                      ''))
                                                              : '',
                                                          completeDate: merchantReportData
                                                              ?.spentMoney?[index]
                                                              .date
                                                              .toString() != ''
                                                              ? DateFormat
                                                              .yMMMM().format(
                                                              inputFormat.parse(
                                                                  merchantReportData
                                                                      ?.spentMoney?[index]
                                                                      .date
                                                                      .toString() ??
                                                                      ''))
                                                              : '',
                                                          count: merchantReportData
                                                              ?.spentMoney?[index]
                                                              .sNo.toString(),
                                                          currency: merchantReportData
                                                              ?.spentMoney?[index]
                                                              .currencyType
                                                              .toString(),
                                                          description: merchantReportData
                                                              ?.spentMoney?[index]
                                                              .description
                                                              .toString(),
                                                          recievedRMB: merchantReportData
                                                              ?.spentMoney?[index]
                                                              .spentRmb
                                                              .toString(),
                                                          recievedUSD: merchantReportData
                                                              ?.spentMoney?[index]
                                                              .spentUsd
                                                              .toString(),
                                                          subject: merchantReportData
                                                              ?.spentMoney?[index]
                                                              .subject
                                                              .toString()
                                                      ),
                                                      SizedBox(
                                                        height: 1.h,
                                                      ),
                                                    ],
                                                  );
                                                }),

                                              ),

                                            ]),
                                      ),
                                    ),
                                    SizedBox(height: 1.h,),
                                    ListView.builder(
                                        itemCount: merchantReportData
                                            ?.totalTable?.length,
                                        shrinkWrap: true,
                                        physics:
                                        NeverScrollableScrollPhysics(),
                                        itemBuilder: ((context, index) {
                                          return Column(

                                            children: [
                                              SizedBox(
                                                height: 2.h,
                                              ),
                                              Container(
                                                width: 100.w,
                                                height: 12.h,
                                                decoration: BoxDecoration(
                                                    color: Colors.red.shade100,
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        4.w)),
                                                child: Padding(
                                                  padding:
                                                  EdgeInsets.symmetric(
                                                      horizontal: 2.w,
                                                      vertical: 0.w),
                                                  child: Column(
                                                      mainAxisAlignment: MainAxisAlignment
                                                          .spaceEvenly,
                                                      children: [
                                                        Text(
                                                          merchantReportData!
                                                              .totalTable![index]
                                                              .subject
                                                              .toString(),
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .black,
                                                              fontSize: 10.sp,
                                                              fontWeight:
                                                              FontWeight
                                                                  .bold),
                                                        ),

                                                        Column(
                                                            mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                            children: [
                                                              Row(
                                                                mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceAround,
                                                                children: [
                                                                  AppWidget
                                                                      .normalText(
                                                                      text: 'usd'
                                                                          .tr,
                                                                      fontSize: 14
                                                                          .sp),
                                                                  AppWidget
                                                                      .normalText(
                                                                      text: 'rmb'
                                                                          .tr,
                                                                      fontSize: 14
                                                                          .sp),
                                                                ],
                                                              ),
                                                              Container(
                                                                height: 4.h,
                                                                width: 100.w,
                                                                margin:
                                                                EdgeInsets
                                                                    .symmetric(
                                                                    horizontal: 5
                                                                        .w),
                                                                decoration: BoxDecoration(
                                                                    borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                      2.w,
                                                                    ),
                                                                    color: Colors
                                                                        .white),
                                                                child: Row(

                                                                    children: [
                                                                      Flexible(
                                                                        child: Container(
                                                                          alignment: Alignment
                                                                              .center,
                                                                          child: AppWidget
                                                                              .normalText(
                                                                              text: merchantReportModel
                                                                                  ?.data
                                                                                  ?.totalTable?[index]
                                                                                  .totalUsd
                                                                                  .toString(),
                                                                              color: Colors
                                                                                  .orange
                                                                                  .shade900),
                                                                        ),
                                                                      ),
                                                                      Flexible(
                                                                        child: Container(
                                                                          alignment: Alignment
                                                                              .center,
                                                                          child: AppWidget
                                                                              .normalText(
                                                                              text: merchantReportModel
                                                                                  ?.data
                                                                                  ?.totalTable?[index]
                                                                                  .totalRmb
                                                                                  .toString(),
                                                                              color: Colors
                                                                                  .orange
                                                                                  .shade900),
                                                                        ),
                                                                      ),
                                                                    ]),
                                                              ),
                                                            ]),

                                                      ]),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 2.h,
                                              ),
                                            ],
                                          );
                                        })
                                    )
                                    ,
                                  ]
                                  ,
                                );
                              }),
                            )),
                      ),
                    ]),
                    if(loadingPdf == true) Align(
                        alignment: Alignment.bottomCenter,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,

                          children: [
                            Container(
                                width: 40.w,
                                height: 4.h,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4.w),
                                  color: Colors.black54,),

                                child: Text(downloadMsg.toString(),
                                  style: TextStyle(color: Colors.white),)),
                            SizedBox(height: 4.h,),
                          ],
                        )),

                  ],
                ))));
  }

  Future<bool?> getStoragePermission() async {
    if (await Permission.storage
        .request()
        .isGranted) {
      return true;
    } else if (await Permission.storage
        .request()
        .isPermanentlyDenied) {
      await openAppSettings();
    } else if (await Permission.storage
        .request()
        .isDenied) {
      getStoragePermission();
    }
  }

  // Future<String> get _localPath async {
  //   final directory = await getApplicationDocumentsDirectory();
  //   print(directory.path);
  //   return directory.path;
  // }
  //
  // String? direc;

  // Future<String?> createFolderInAppDocDir() async {
  //   final String path = await _localPath;
  //   final Directory directory = await Directory('$path/BlackMarlin/').create(
  //       recursive: true);
  //   print("The directory $directory is created");
  //
  //   setState(() {
  //     direc = directory.absolute.path.toString();
  //   });
  //   //   final path = Directory(
  //   //       "/storage/emulated/0/Download/BlackMarlin/");
  //   //   if ((await path.exists())) {
  //   //     print('Path $path');
  //   //     return path.path;
  //   //   } else {
  //   //     path.create();
  //   //     print('PATH! ${path.path}');
  //   //     print('PATH! ${path.path}');
  //   //     return path.path;
  //   //   }
  //
  // }

  // Future openFile({required String url}) async {
  //   //   Fluttertoast.showToast(msg: 'Downloading...');
  //   getStoragePermission().then((value) {
  //     createFolderInAppDocDir().then((value) async {
  //       await downloadFile(url).then((value) =>
  //           Fluttertoast.showToast(msg: 'Download Completed'));
  //     });
  //   });
  // }

  Future get _localPath async {
    // Application documents directory: /data/user/0/{package_name}/{app_name}
    final applicationDirectory = await getApplicationDocumentsDirectory();
    return applicationDirectory.path;
  }

  Future get _localFile async {
    final path = await _localPath;
    return File('$path/MerchantReport.pdf');
  }


  Future _writeToFile(String text) async {
    final file = await _localFile;
    // Write the file
    File result = await file.writeAsString('$text');
    print('Result ${result}');
  }

  Future openFile({required String url}) async {
    //   Fluttertoast.showToast(msg: 'Downloading...');
    await _writeToFile(url).then((value) {
      Fluttertoast.showToast(msg: 'Download Completed');
      Get.toNamed(RouteHelper.showPdf);
    }
    );
  }

// Future<File?> downloadFile(String url) async {
//   try {
//     setState(() {
//       loadingPdf = true;
//     });
//     final String path = await _localPath;
//     final file = File(
//         '$direc${DateTime
//             .now()
//             .millisecondsSinceEpoch
//             .toString()}');
//     // final file = File(
//     //     '/storage/emulated/0/Download/BlackMarlin/MerchantReport${DateTime
//     //         .now()
//     //         .millisecondsSinceEpoch
//     //         .toString()}.pdf');
//     print('FIle $file');
//     final response = await Dio().get(url, onReceiveProgress: ((count, total) {
//       percantage = (count / total * 100).round();
//       setState(() {
//         downloadMsg = '${percantage} %';
//       });
//     }),
//         options: Options(
//             responseType: ResponseType.bytes,
//             receiveTimeout: 0,
//             followRedirects: false));
//
//     if (response.statusCode == 200) {
//       final ref = file.openSync(mode: FileMode.write);
//       ref.writeFromSync(response.data);
//       await ref.close();
//       setState(() {
//         loadingPdf = false;
//       });
//       return file;
//     } else if (response.statusCode == 404) {
//       Fluttertoast.showToast(msg: 'Url not found');
//     }
//     return file;
//   } on DioError catch (e) {
//     percantage = 0;
//     if (e.response?.statusCode == 404) {
//       Fluttertoast.showToast(msg: e.message);
//     } else {
//       Fluttertoast.showToast(msg: 'Something went wrong');
//     }
//     return null;
//   }
// }


}
