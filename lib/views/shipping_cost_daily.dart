import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:intl/intl.dart';
import 'package:synram_practical/bloc/shipingCostDaily/shipping_cost_daily_bloc.dart';
import 'package:synram_practical/model/list_model.dart';
import 'package:synram_practical/model/shippingCost_model.dart';

import 'package:synram_practical/utils/app_images.dart';
import 'package:synram_practical/utils/app_widget.dart';

class ShippingCostDaily extends StatefulWidget {
  ShippingCostDaily({Key? key}) : super(key: key);

  @override
  State<ShippingCostDaily> createState() => _ShippingCostDailyState();
}

class _ShippingCostDailyState extends State<ShippingCostDaily> {
  List<ListModel> texts = [
    ListModel(text: 'cmb'.tr, amount: '0'),
    ListModel(text: 'container'.tr, amount: '0'),
    ListModel(text: 'cbmHealthProduct'.tr, amount: '0'),
    ListModel(text: 'cbmCopyProduct'.tr, amount: '0'),
  ];

  //store data from api
  bool? loading = false;
  List<ShippingDailyCostList>? shippingDailyCostList;

  //bloc
  ShippingDailyCostModel? shippingCostDailyData;
  ShippingCostDailyBloc? shippingCostDailyBloc;

  //for date picker
  String? formattedDate;
  String? dateShowing;
  DateTime? pickedDate;

  //open calendar
  _openCalendar() async {
    pickedDate = await showDatePicker(
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100),
        selectableDayPredicate: (day) => day.isBefore(DateTime.now()),
        context: context,
        builder: (context, child) {
          return Theme(
              data: Theme.of(context).copyWith(
                colorScheme: ColorScheme.light(
                  primary: Colors.deepOrange, // <-- SEE HERE
                  onPrimary: Colors.white, // <-- SEE HERE
                  onSurface: Colors.black, // <-- SEE HERE
                ),
              ),
              child: child!);
        });

    if (pickedDate != null) {
      print(pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
      formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate!);
      dateShowing = DateFormat.yMMMMd().format(pickedDate!);
      shippingCostDailyBloc?.add(ShippingCostData(date: formattedDate));
      print(
          'formattedDate $formattedDate'); //formatted date output using intl package =>  2021-03-16
    } else {
      print('error');
    }
  }

  @override
  void initState() {
    shippingCostDailyBloc = BlocProvider.of<ShippingCostDailyBloc>(context);
    shippingCostDailyBloc?.add(ShippingCostData(date: ''));
//        date: DateFormat('yyyy-MM-dd').format(DateTime.now())
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
              child:
                  BlocConsumer<ShippingCostDailyBloc, ShippingCostDailyState>(
                      listener: ((context, state) {
                if (state is ShippingCostDailyLoaded) {
                  setState(() {
                    shippingCostDailyData = state.shippingDailyCostData;
                    shippingDailyCostList = shippingCostDailyData?.data;
                    dateShowing = DateFormat.yMMMMd().format(
                        shippingDailyCostList?.last.date ?? pickedDate!);

                    loading = false;
                    if (shippingDailyCostList != null) {
                      texts[0].amount = shippingDailyCostList?.last.cbm;
                      texts[1].amount = shippingDailyCostList?.last.container;
                      texts[2].amount =
                          shippingDailyCostList?.last.cbmHealthProduct;
                      texts[3].amount =
                          shippingDailyCostList?.last.cbmCopyProduct;
                    }
                  });
                } else if (state is ShippingCostDailyLoading) {
                  setState(() {
                    loading = true;
                  });
                }
              }), builder: (context, state) {
                return Stack(
                  children: [
                    Container(
                      child: Column(children: [
                        AppWidget.appBarWidget(text: 'shippingCost'.tr),
                        SizedBox(
                          height: 4.h,
                        ),
                        // Expanded(
                        //     child: Container(
                        //       decoration: BoxDecoration(
                        //         borderRadius: BorderRadius.vertical(
                        //             bottom: Radius.circular(8.w)),
                        //         color: Colors.orange.shade900,
                        //       ),
                        //       child: Padding(
                        //         padding: EdgeInsets.symmetric(horizontal: 6.w),
                        //         child: Row(children: [
                        //           Expanded(
                        //             child: Align(
                        //               child: IconButton(
                        //                   onPressed: () {
                        //                     Get.toNamed(RouteHelper.merchantBal);
                        //                   },
                        //                   icon: Icon(
                        //                     Icons.menu,
                        //                     size: 8.w,
                        //                     color: Colors.white,
                        //                   )),
                        //               alignment: Alignment.centerLeft,
                        //             ),
                        //           ),
                        //           Expanded(
                        //             child: Row(
                        //               mainAxisAlignment: MainAxisAlignment.end,
                        //               children: [
                        //                 Image.asset(
                        //                   AppImages.logo,
                        //                   color: Colors.white,
                        //                   height: 6.h,
                        //                 ),
                        //                 PopupMenuButton(
                        //                   icon: Icon(Icons.more_vert,
                        //                       color: Colors.white),
                        //                   itemBuilder: (BuildContext context) =>
                        //                   <PopupMenuEntry>[
                        //                     // const PopupMenuItem(
                        //                     //   child: ListTile(
                        //                     //     leading: Icon(Icons.add),
                        //                     //     title: Text('Item 1'),
                        //                     //   ),
                        //                     // ),
                        //                     // const PopupMenuItem(
                        //                     //   child: ListTile(
                        //                     //     leading:
                        //                     //         Icon(Icons.anchor),
                        //                     //     title: Text('Item 2'),
                        //                     //   ),
                        //                     // ),
                        //                     // const PopupMenuItem(
                        //                     //   child: ListTile(
                        //                     //     leading:
                        //                     //         Icon(Icons.article),
                        //                     //     title: Text('Item 3'),
                        //                     //   ),
                        //                     // ),
                        //                     // const PopupMenuDivider(),
                        //                     const PopupMenuItem(
                        //                         child: Text('Report')),
                        //                     const PopupMenuItem(
                        //                         child: Text('Balance')),
                        //                     const PopupMenuItem(
                        //                         child: Text('Order')),
                        //                     const PopupMenuItem(
                        //                         child: Text('Shipping')),
                        //                     const PopupMenuItem(
                        //                         child: Text('Shipping cost daily')),
                        //                   ],
                        //                 ),
                        //               ],
                        //             ),
                        //             flex: 2,
                        //           )
                        //         ]),
                        //       ),
                        //     )),
                        // Expanded(
                        //     flex: 5,
                        //     child: loading == true
                        //         ? Container()
                        //         : (newsModel?.status == false ||
                        //                 newsModelList == null)
                        //             ? Center(child: Text('No data found'))
                        //             : Padding(
                        //                 padding: EdgeInsets.symmetric(
                        //                     horizontal: 3.w, vertical: 1.h),
                        //                 child: Column(
                        //                   children: [
                        //                     Flexible(
                        //                         flex: 3,
                        //                         child: Container(
                        //                           height: 100.h,
                        //                           width: 100.w,
                        //                           decoration: BoxDecoration(
                        //                               borderRadius:
                        //                                   BorderRadius.circular(
                        //                                       4.w),
                        //                               image: DecorationImage(
                        //                                 image: AssetImage(
                        //                                   AppImages.background,
                        //                                 ),
                        //                                 fit: BoxFit.fill,
                        //                               )),
                        //                         )),
                        //                     Flexible(
                        //                         flex: 2,
                        //                         child: Column(
                        //                           children: [
                        //                             SizedBox(
                        //                               height: 1.h,
                        //                             ),
                        //                             Flexible(
                        //                               child: FittedBox(
                        //                                 child: Text(
                        //                                     'Lorem Ipsum',
                        //                                     style: TextStyle(
                        //                                         fontSize: 13.sp,
                        //                                         fontWeight:
                        //                                             FontWeight
                        //                                                 .w700)),
                        //                               ),
                        //                             ),
                        //                             SizedBox(
                        //                               height: 1.w,
                        //                             ),
                        //                             Container(
                        //                                 width: 15.w,
                        //                                 child: Divider(
                        //                                   color: Colors
                        //                                       .orange.shade600,
                        //                                   thickness: 1.w,
                        //                                 )),
                        //                             SizedBox(
                        //                               height: 1.w,
                        //                             ),
                        //                             Flexible(
                        //                               child: Text(
                        //                                   'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s,',
                        //                                   style: TextStyle(
                        //                                       fontSize: 10.sp,
                        //                                       fontWeight:
                        //                                           FontWeight
                        //                                               .normal),
                        //                                   textAlign:
                        //                                       TextAlign.center),
                        //                             ),
                        //                           ],
                        //                         )),
                        //                   ],
                        //                   //    color: Colors.green,
                        //                 ),
                        //               )),
                        loading == true
                            ? Container()
                            : Padding(
                                padding: EdgeInsets.symmetric(horizontal: 3.w),
                                child: GestureDetector(
                                  onTap: () => _openCalendar(),
                                  child: Container(
                                    height: 6.h,
                                    width: 100.w,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(2.w),
                                        color: Colors.orange.shade900),
                                    child: Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 3.w),
                                      child: Row(children: [
                                        Icon(
                                          Icons.calendar_today_sharp,
                                          color: Colors.white,
                                          size: 6.w,
                                        ),
                                        SizedBox(
                                          width: 4.w,
                                        ),
                                        Text(
                                          dateShowing.toString(),
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12.sp),
                                        )
                                      ]),
                                    ),
                                  ),
                                ),
                              ),
                        Expanded(
                            flex: 5,
                            child: Container(
                              width: 100.w,
                              height: 100.h,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 3.w),
                                child: Column(children: [
                                  Expanded(
                                    flex: 1,
                                    child: loading == true
                                        ? Container()
                                        : Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Flexible(
                                                  child: Divider(
                                                thickness: 1,
                                                color: Colors.orange.shade600,
                                              )),
                                              Text('shippingCostDaily'.tr,
                                                  style: TextStyle(
                                                      fontSize: 8.sp)),
                                              Flexible(
                                                  child: Divider(
                                                      thickness: 1,
                                                      color: Colors
                                                          .orange.shade600)),
                                            ],
                                          ),
                                  ),
                                  Expanded(
                                    flex: 8,
                                    child: loading == true
                                        ? Container()
                                        : (shippingCostDailyData?.status ==
                                                    false ||
                                                shippingCostDailyData == null)
                                            ? Center(
                                                child: Text("noDataFound".tr,
                                                    style: TextStyle(
                                                        fontSize: 8.sp)))
                                            : GridView.builder(
                                                itemCount: 4,
                                                gridDelegate:
                                                    SliverGridDelegateWithFixedCrossAxisCount(
                                                        crossAxisCount: 2,
                                                        crossAxisSpacing: 4.w,
                                                        childAspectRatio: MediaQuery
                                                                    .of(context)
                                                                .size
                                                                .width /
                                                            (MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height /
                                                                3),
                                                        mainAxisSpacing: 4.w),
                                                itemBuilder: ((context, index) {
                                                  return Material(
                                                    elevation: 6,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4.w),
                                                    child: Container(
                                                      height: 10.h,
                                                      width: 100.w,
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        image: DecorationImage(
                                                            image: AssetImage(
                                                                AppImages
                                                                    .background),
                                                            fit: BoxFit.fill,
                                                            colorFilter:
                                                                ColorFilter.mode(
                                                                    Colors
                                                                        .white10,
                                                                    BlendMode
                                                                        .dstATop)),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(4.w),
                                                      ),
                                                      child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Center(
                                                              child: Text(
                                                                texts[index]
                                                                    .text
                                                                    .toString(),
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize:
                                                                        14.sp,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                              ),
                                                            ),
                                                            Text(
                                                              texts[index]
                                                                      .amount
                                                                      .toString()
                                                                      .isEmpty
                                                                  ? ' '
                                                                  : texts[index]
                                                                      .amount
                                                                      .toString(),
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .orange
                                                                    .shade600,
                                                                fontSize: 14.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                            )
                                                          ]),
                                                    ),
                                                  );
                                                })),
                                  )
                                ]),
                              ),
                            ))
                      ]),
                    ),
                    if (loading == true)
                      Container(
                        color: Colors.white60,
                        child: AppWidget.circularIndicator(),
                      )
                  ],
                );
              }))),
    );
  }
}
