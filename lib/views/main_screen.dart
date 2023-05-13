// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:get/get.dart';
// import 'package:sizer/sizer.dart';
// import 'package:intl/intl.dart';
// import 'package:synram_practical/bloc/shipingCostDaily/shipping_cost_daily_bloc.dart';
// import 'package:synram_practical/helper/route_helper.dart';
// import 'package:synram_practical/model/news_model.dart';
// import 'package:synram_practical/model/shippingCost_model.dart';
// import 'package:synram_practical/models/list_model.dart';
// import 'package:synram_practical/utils/app_images.dart';
// import 'package:synram_practical/utils/app_widget.dart';
//
// class MainScreen extends StatefulWidget {
//   MainScreen({Key? key}) : super(key: key);
//
//   @override
//   State<MainScreen> createState() => _MainScreenState();
// }
//
// class _MainScreenState extends State<MainScreen> {
//   List<ListModel> texts = [
//     ListModel(text: 'CBM', amount: '0'),
//     ListModel(text: 'CONTAINER', amount: '0'),
//     ListModel(text: 'CBM HEALTH PRODUCT', amount: '0'),
//     ListModel(text: 'CBM COPY PRODUCT', amount: '0'),
//   ];
//
//   //store data from api
//   bool? loading = false;
//   bool? loading2 = false;
//   NewsModel? newsModel;
//   List<ShippingDailyCostList>? shippingDailyCostList;
//   List<NewsModelList>? newsModelList;
//
//   //bloc
//   ShippingDailyCostModel? shippingCostDailyData;
//   ShippingCostDailyBloc? shippingCostDailyBloc;
//
//   //for date picker
//   String? formattedDate;
//   DateTime? pickedDate;
//
//   //open calendar
//   _openCalendar() async {
//     pickedDate = await showDatePicker(
//         initialDate: DateTime.now(),
//         firstDate: DateTime(2000),
//         lastDate: DateTime(2030),
//         context: context,
//         builder: (context, child) {
//           return Theme(
//               data: Theme.of(context).copyWith(
//                 colorScheme: ColorScheme.light(
//                   primary: Colors.deepOrange, // <-- SEE HERE
//                   onPrimary: Colors.white, // <-- SEE HERE
//                   onSurface: Colors.black, // <-- SEE HERE
//                 ),
//               ),
//               child: child!);
//         });
//
//     if (pickedDate != null) {
//       print(pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
//       formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate!);
//       shippingCostDailyBloc?.add(ShippingCostData(date: formattedDate));
//       shippingCostDailyBloc?.add(GetNewsData());
//       print(
//           'formattedDate $formattedDate'); //formatted date output using intl package =>  2021-03-16
//     } else {
//       print('error');
//     }
//   }
//
//   @override
//   void initState() {
//     shippingCostDailyBloc = BlocProvider.of<ShippingCostDailyBloc>(context);
//     shippingCostDailyBloc?.add(GetNewsData());
//     shippingCostDailyBloc?.add(ShippingCostData(
//         date: DateFormat('yyyy-MM-dd').format(DateTime.now())));
//
//     // TODO: implement initState
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//           floatingActionButton: FloatingActionButton(
//             onPressed: () => _openCalendar(),
//             child: Icon(Icons.calendar_today_rounded),
//             backgroundColor: Colors.orange.shade900,
//           ),
//           body: Container(
//               height: double.infinity,
//               width: double.infinity,
//               child:
//                   BlocConsumer<ShippingCostDailyBloc, ShippingCostDailyState>(
//                       listener: ((context, state) {
//                 if (state is ShippingCostDailyLoaded) {
//                   setState(() {
//                     print(
//                         'state.shippingDailyCostData! ${state.shippingDailyCostData}');
//                     shippingCostDailyData = state.shippingDailyCostData;
//                     shippingDailyCostList = shippingCostDailyData?.data;
//                    loading = false;
//                     if (shippingDailyCostList != null) {
//                       texts[0].amount = shippingDailyCostList?[0].cbm;
//                       texts[1].amount = shippingDailyCostList?[0].container;
//                       texts[2].amount =
//                           shippingDailyCostList?[0].cbmHealthProduct;
//                       texts[3].amount =
//                           shippingDailyCostList?[0].cbmCopyProduct;
//                     }
//                     print('shippingDailyCostList ${shippingDailyCostList}');
//                   });
//                 }
//                 else if (state is GetNewsDataLoaded) {
//                   setState(() {
//                     loading2 = false;
//                     newsModel = state.newsModel;
//                     newsModelList = newsModel?.data;
//                     print('newsModelList ${newsModelList}');
//                   });
//                 } else if (state is ShippingCostDailyLoading) {
//                   setState(() {
//                     loading =true;
//                     loading2 = true;
//                   });
//                 }
//               }), builder: (context, state) {
//                 return Stack(
//                   children: [
//                     Container(
//                       child: Column(children: [
//                         Expanded(
//                             child: Container(
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.vertical(
//                                 bottom: Radius.circular(8.w)),
//                             color: Colors.orange.shade900,
//                           ),
//                           child: Padding(
//                             padding: EdgeInsets.symmetric(horizontal: 6.w),
//                             child: Row(children: [
//                               Expanded(
//                                 child: Align(
//                                   child: IconButton(
//                                       onPressed: () {
//                                         Get.toNamed(RouteHelper.merchantBal);
//                                       },
//                                       icon: Icon(
//                                         Icons.menu,
//                                         size: 8.w,
//                                         color: Colors.white,
//                                       )),
//                                   alignment: Alignment.centerLeft,
//                                 ),
//                               ),
//                               Expanded(
//                                 child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.end,
//                                   children: [
//                                     Image.asset(
//                                       AppImages.logo,
//                                       color: Colors.white,
//                                       height: 6.h,
//                                     ),
//                                     PopupMenuButton(
//                                       icon: Icon(Icons.more_vert,
//                                           color: Colors.white),
//                                       itemBuilder: (BuildContext context) =>
//                                           <PopupMenuEntry>[
//                                         // const PopupMenuItem(
//                                         //   child: ListTile(
//                                         //     leading: Icon(Icons.add),
//                                         //     title: Text('Item 1'),
//                                         //   ),
//                                         // ),
//                                         // const PopupMenuItem(
//                                         //   child: ListTile(
//                                         //     leading:
//                                         //         Icon(Icons.anchor),
//                                         //     title: Text('Item 2'),
//                                         //   ),
//                                         // ),
//                                         // const PopupMenuItem(
//                                         //   child: ListTile(
//                                         //     leading:
//                                         //         Icon(Icons.article),
//                                         //     title: Text('Item 3'),
//                                         //   ),
//                                         // ),
//                                         // const PopupMenuDivider(),
//                                         const PopupMenuItem(
//                                             child: Text('Report')),
//                                         const PopupMenuItem(
//                                             child: Text('Balance')),
//                                         const PopupMenuItem(
//                                             child: Text('Order')),
//                                         const PopupMenuItem(
//                                             child: Text('Shipping')),
//                                         const PopupMenuItem(
//                                             child: Text('Shipping cost daily')),
//                                       ],
//                                     ),
//                                   ],
//                                 ),
//                                 flex: 2,
//                               )
//                             ]),
//                           ),
//                         )),
//                         Expanded(
//                             flex: 5,
//                             child: loading == true ? Container() : (newsModel?.status == false ||
//                                     newsModelList == null)
//                                 ? Center(child: Text('No data found'))
//                                 : Padding(
//                                     padding: EdgeInsets.symmetric(
//                                         horizontal: 3.w, vertical: 1.h),
//                                     child: Column(
//                                       children: [
//                                         Expanded(
//                                             flex: 3,
//                                             child: Container(
//                                               height: 100.h,
//                                               width: 100.w,
//                                               decoration: BoxDecoration(
//                                                   borderRadius:
//                                                       BorderRadius.circular(
//                                                           4.w),
//                                                   image: DecorationImage(
//                                                     image: AssetImage(
//                                                       AppImages.background,
//                                                     ),
//                                                     fit: BoxFit.fill,
//                                                   )),
//                                             )),
//                                         Expanded(
//                                             flex: 2,
//                                             child: Column(
//                                               children: [
//                                                 SizedBox(
//                                                   height: 1.h,
//                                                 ),
//                                                 Text('Lorem Ipsum',
//                                                     style: TextStyle(
//                                                         fontSize: 14.sp,
//                                                         fontWeight:
//                                                             FontWeight.w700)),
//                                                 SizedBox(
//                                                   height: 1.w,
//                                                 ),
//                                                 Container(
//                                                     width: 15.w,
//                                                     child: Divider(
//                                                       color: Colors
//                                                           .orange.shade600,
//                                                       thickness: 1.w,
//                                                     )),
//                                                 SizedBox(
//                                                   height: 1.w,
//                                                 ),
//                                                 Text(
//                                                     'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s,',
//                                                     style: TextStyle(
//                                                         fontSize: 10.sp,
//                                                         fontWeight:
//                                                             FontWeight.normal),
//                                                     textAlign:
//                                                         TextAlign.center),
//                                               ],
//                                             )),
//                                       ],
//                                       //    color: Colors.green,
//                                     ),
//                                   )),
//                         Expanded(
//                             flex: 5,
//                             child: Container(
//                               width: 100.w,
//                               height: 100.h,
//                               child: Padding(
//                                 padding: EdgeInsets.symmetric(horizontal: 3.w),
//                                 child: Column(children: [
//                                   Expanded(
//                                     flex: 1,
//                                     child: loading == true ? Container() :Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceEvenly,
//                                       children: [
//                                         Flexible(
//                                             child: Divider(
//                                           thickness: 1,
//                                           color: Colors.orange.shade600,
//                                         )),
//                                         Text('  Shipping Cost Daily  '),
//                                         Flexible(
//                                             child: Divider(
//                                                 thickness: 1,
//                                                 color: Colors.orange.shade600)),
//                                       ],
//                                     ),
//                                   ),
//                                   Expanded(
//                                     flex: 8,
//                                     child: loading == true? Container() :(shippingCostDailyData?.status ==
//                                                 false ||
//                                             shippingCostDailyData == null)
//                                         ? Center(child: Text("No data found"))
//                                         : GridView.builder(
//                                             itemCount: 4,
//                                             gridDelegate:
//                                                 SliverGridDelegateWithFixedCrossAxisCount(
//                                                     crossAxisCount: 2,
//                                                     crossAxisSpacing: 4.w,
//                                                     childAspectRatio:
//                                                         MediaQuery.of(context)
//                                                                 .size
//                                                                 .width /
//                                                             (MediaQuery.of(
//                                                                         context)
//                                                                     .size
//                                                                     .height /
//                                                                 3),
//                                                     mainAxisSpacing: 4.w),
//                                             itemBuilder: ((context, index) {
//                                               return Material(
//                                                 elevation: 6,
//                                                 borderRadius:
//                                                     BorderRadius.circular(4.w),
//                                                 child: Container(
//                                                   height: 10.h,
//                                                   width: 100.w,
//                                                   decoration: BoxDecoration(
//                                                     color: Colors.white,
//                                                     image: DecorationImage(
//                                                         image: AssetImage(
//                                                             AppImages
//                                                                 .background),
//                                                         fit: BoxFit.fill,
//                                                         colorFilter:
//                                                             ColorFilter.mode(
//                                                                 Colors.white10,
//                                                                 BlendMode
//                                                                     .dstATop)),
//                                                     borderRadius:
//                                                         BorderRadius.circular(
//                                                             4.w),
//                                                   ),
//                                                   child: Column(
//                                                       mainAxisAlignment:
//                                                           MainAxisAlignment
//                                                               .center,
//                                                       children: [
//                                                         Center(
//                                                           child: Text(
//                                                             texts[index]
//                                                                 .text
//                                                                 .toString(),
//                                                             style: TextStyle(
//                                                                 color: Colors
//                                                                     .black,
//                                                                 fontSize: 14.sp,
//                                                                 fontWeight:
//                                                                     FontWeight
//                                                                         .bold),
//                                                             textAlign: TextAlign
//                                                                 .center,
//                                                           ),
//                                                         ),
//                                                         Text(
//                                                           texts[index]
//                                                                   .amount
//                                                                   .toString()
//                                                                   .isEmpty
//                                                               ? ' '
//                                                               : texts[index]
//                                                                   .amount
//                                                                   .toString(),
//                                                           style: TextStyle(
//                                                             color: Colors.orange
//                                                                 .shade600,
//                                                             fontSize: 14.sp,
//                                                             fontWeight:
//                                                                 FontWeight.bold,
//                                                           ),
//                                                           textAlign:
//                                                               TextAlign.center,
//                                                         )
//                                                       ]),
//                                                 ),
//                                               );
//                                             })),
//                                   )
//                                 ]),
//                               ),
//                             ))
//                       ]),
//                     ),
//                     if (loading == true && loading2 == true)
//                       Container(
//                         color: Colors.white60,
//                         child: AppWidget.circularIndicator(),
//                       )
//                   ],
//                 );
//               }))),
//     );
//   }
// }

import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:synram_practical/api/api_services.dart';
import 'package:synram_practical/bloc/news/get_news_bloc.dart';
import 'package:synram_practical/helper/route_helper.dart';
import 'package:synram_practical/model/drawer_model.dart';
import 'package:synram_practical/model/news_model.dart';
import 'package:synram_practical/utils/app_colors.dart';
import 'package:synram_practical/utils/app_images.dart';
import 'package:synram_practical/utils/app_string.dart';
import 'package:synram_practical/utils/app_widget.dart';
import 'package:synram_practical/utils/shared_pref.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  int? _selectedIndex;
  FlickManager? flickManager;
  YoutubePlayerController? youtubePlayerController;
  GetNewsBloc newsBloc = GetNewsBloc();
  NewsModel? newsModel;
  bool? loading;

  List<NewsModelList> videoList = [];
  List<NewsModelList> imageList = [];

  final List locale = [
    {'name': 'English', 'locale': Locale('en_US')},
    {'name': 'Arabic', 'locale': Locale('ar')},
    // {'name': 'kurdish', 'locale': Locale('ckb')},
    {'name': 'kurdish', 'locale': Locale('ckb')},
  ];

  @override
  void initState() {
    super.initState();
    newsBloc = BlocProvider.of<GetNewsBloc>(context);
    newsBloc.add(GetNewDataEvent());
    // youtubePlayerController = YoutubePlayerController(
    //   initialVideoId: YoutubePlayer.convertUrlToId(
    //       'https://www.youtube.com/watch?v=_TlPc5tkL-k')!,
    //   flags: YoutubePlayerFlags(
    //     autoPlay: true,
    //     mute: false,
    //   ),
    // );
    // flickManager = FlickManager(
    //   autoInitialize: true,
    //   autoPlay: false,
    //   videoPlayerController: VideoPlayerController.network(
    //       // "https://firebasestorage.googleapis.com/v0/b/preschool-6611d.appspot.com/o/how%20to%20integrate%20downloading%20feature%20in%20flutter%20application.mp4?alt=media&token=3b5e5b77-f6a0-4249-839c-7f1fe7db90e3"
    //       'https://www.youtube.com/watch?v=_TlPc5tkL-k'),
    // );
  }

  @override
  void dispose() {
    flickManager?.dispose();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.black));

    List<DrawerModel> drawerModel = [
      DrawerModel(
        text: 'report'.tr,
        route: RouteHelper.merchantReportClass,
      ),
      DrawerModel(text: 'balance'.tr, route: RouteHelper.merchantBal),
      DrawerModel(text: 'order'.tr, route: RouteHelper.orderReport),
      DrawerModel(text: 'trackContainer'.tr, route: RouteHelper.getContainers),
      DrawerModel(
          text: 'shippingCostDaily'.tr, route: RouteHelper.shippingCostDaily),
      DrawerModel(
        text: 'changeLan'.tr,
      ),
      DrawerModel(
        text: 'logOut'.tr,
      ),
    ];

    drawerWidget() {
      return Drawer(
          backgroundColor: Colors.black,
          child: Column(
            children: [
              Expanded(
                  child: Container(
                width: 100.w,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Stack(
                        children: [
                          Image.asset(AppImages.profile, height: 10.h),
                          Positioned(
                            bottom: 0.h,
                            right: 0.w,
                            child: Image.asset(
                              AppImages.camera,
                              height: 4.h,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Text(
                        SharedPreferenceClass.getString(AppStrings.userName),
                        //  'userName'.tr,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.sp,
                            overflow: TextOverflow.ellipsis),
                      ),
                      Text(
                        SharedPreferenceClass.getString(AppStrings.name),
                        //  'userAddress'.tr,
                        style: TextStyle(
                            fontSize: 10.sp,
                            color: Colors.white,
                            overflow: TextOverflow.ellipsis),
                      )
                    ]),
              )),
              Expanded(
                  child: Container(
                    //color: Colors.brown,
                    child: ListView.builder(
                      itemCount: drawerModel.length,
                      itemBuilder: ((context, index) {
                        return Column(
                          children: [
                            (index != drawerModel.length - 2)
                                ? listTileWidget(
                                    color: _selectedIndex == index
                                        ? Colors.red.shade200
                                        : Colors.black,
                                    text: drawerModel[index].text,
                                    onTap: () {
                                      setState(() {
                                        _selectedIndex = index;
                                      });

                                      if (index == drawerModel.length - 1) {
                                        return _showLogOutDialog();
                                      } else {
                                        Get.back();
                                        Get.toNamed(drawerModel[index]
                                            .route
                                            .toString());
                                      }
                                    })
                                : ExpansionTile(
                                    leading: Icon(Icons.list_alt,
                                        color: Colors.red, size: 7.w),
                                    expandedAlignment: Alignment.centerLeft,
                                    title: Text(
                                      drawerModel[index].text ?? '',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 14.sp),
                                    ),
                                    children: [
                                      ListView.builder(
                                          shrinkWrap: true,
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          itemCount: locale.length,
                                          itemBuilder: ((context, index) {
                                            return expansionTile(
                                                color: _selectedIndex == index
                                                    ? Colors.red.shade200
                                                    : Colors.black,
                                                text: locale[index]['name'],
                                                onTap: () {
                                                  setState(() {
                                                    _selectedIndex = index;

                                                    Get.back();
                                                    SharedPreferenceClass.setString(
                                                        AppStrings.localCode,
                                                        '${locale[index]['locale']}');
                                                    Get.updateLocale(Locale(
                                                        locale[index]['locale']
                                                            .toString()));
                                                  });
                                                });
                                          }))
                                    ],
                                  ),
                            Divider(
                              color: Colors.red.shade900,
                              thickness: 1,
                            ),
                          ],
                        );
                      }),
                    ),
                  ),
                  flex: 2),
            ],
          ),
          width: 80.w);
    }

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return SafeArea(
      child: Scaffold(
          key: _scaffoldKey,
          drawer: drawerWidget(),
          endDrawer: drawerWidget(),
          body: BlocConsumer<GetNewsBloc, GetNewsState>(
            listener: ((context, state) {
              if (state is GetNewsInitial) {
                setState(() {
                  loading = state.loading;
                });
              } else if (state is GetNewsLoaded) {
                setState(() {
                  newsModel = state.newsModel;
                  print(state.newsModel?.data?.length);
                  if (newsModel?.data?.length != 0) {
                    print('IF Cond');
                    for (int i = 0; i < newsModel!.data!.length; i++) {
                      if (newsModel?.data?[i].imageVideoType == 'Video') {
                        setState(() {
                          if (newsModel?.data?[i].imageVideo
                                  .toString()
                                  .isNotEmpty ==
                              true) {
                            videoList.add(newsModel!.data![i]);
                          }
                        });
                      } else {
                        print('Iamge ${newsModel?.data?[i].imageVideo}');
                        setState(() {
                          if (newsModel?.data?[i].imageVideo
                                  .toString()
                                  .isNotEmpty ==
                              true) {
                            imageList.add(newsModel!.data![i]);
                            print(imageList.length);
                          }
                        });
                      }
                    }
                  }
                });
              }
            }),
            builder: ((context, state) {
              return loading == true
                  ? AppWidget.circularIndicator()
                  : Container(
                      width: 100.w,
                      height: 100.h,
                      child: Column(children: [
                        Container(
                          height: 8.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.vertical(
                                bottom: Radius.circular(8.w)),
                            color: Colors.orange.shade900,
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 6.w),
                            child: SharedPreferenceClass.getBool(
                                    AppStrings.isLogin, false)
                                ? SharedPreferenceClass.getString(
                                          AppStrings.localCode,
                                        ) ==
                                        'ckb'
                                    ? Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                            Container(
                                              child: Image.asset(
                                                AppImages.logo,
                                                color: Colors.white,
                                                height: 6.h,
                                              ),
                                              alignment: Alignment.centerLeft,
                                            ),
                                            GestureDetector(
                                                child: Image.asset(
                                                  AppImages.menu,
                                                  color: Colors.white,
                                                  width: 6.w,
                                                ),
                                                onTap: () {
                                                  print('Hello');
                                                  _scaffoldKey.currentState
                                                      ?.openEndDrawer();
                                                }),
                                          ])
                                    : Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                            GestureDetector(
                                              child: Image.asset(
                                                AppImages.menu,
                                                color: Colors.white,
                                                width: 6.w,
                                              ),
                                              onTap: () => _scaffoldKey
                                                  .currentState
                                                  ?.openDrawer(),
                                            ),
                                            Container(
                                              child: Image.asset(
                                                AppImages.logo,
                                                color: Colors.white,
                                                height: 6.h,
                                              ),
                                              alignment: Alignment.centerLeft,
                                            )
                                          ])
                                : Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                        Expanded(
                                          child: Container(
                                            padding: EdgeInsets.only(left: 3.w),
                                            child: Image.asset(
                                              AppImages.logo,
                                              color: Colors.white,
                                              height: 6.h,
                                            ),
                                            alignment: Alignment.centerLeft,
                                          ),
                                        ),
                                        Expanded(
                                            child: GestureDetector(
                                          onTap: () => Get.offAllNamed(
                                              RouteHelper.logIn),
                                          child: Container(
                                            child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Text(
                                                    'logIn'.tr,
                                                    style: TextStyle(
                                                        fontSize: 14.sp,
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                  SizedBox(
                                                    width: 2.w,
                                                  ),
                                                  Icon(Icons.login,
                                                      color: Colors.white,
                                                      size: 4.h),
                                                  // onPressed: () =>
                                                  //     Get.offAllNamed(RouteHelper.logIn),
                                                ]),
                                          ),
                                        )),
                                      ]),
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Expanded(
                            child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 3.w),
                          child: GestureDetector(
                            onTap: () => _showDialogForMainText(),
                            // onTap: () =>
                            //     Get.toNamed(RouteHelper.blackMarlinDes),
                            child: Material(
                              elevation: 2,
                              borderRadius: BorderRadius.circular(4.w),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4.w),
                                    color: AppColors.lightGrey),
                                child: Row(children: [
                                  Flexible(
                                      child: Container(
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 3.w,
                                          ),
                                          child: Container(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 2.w),
                                            child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'mainTitleText'.tr,
                                                    style: TextStyle(
                                                        fontSize: 16.sp,
                                                        color: Colors
                                                            .orange.shade900,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  SizedBox(
                                                    height: 1.h,
                                                  ),
                                                  Flexible(
                                                    child: Text(
                                                      'blackMarlinDes'.tr,
                                                      style: TextStyle(
                                                        fontSize: 8.sp,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                  )
                                                ]),
                                          ),
                                        ),
                                      ),
                                      flex: 5),
                                  Expanded(
                                      child: Container(
                                    child: Icon(
                                        Icons.keyboard_arrow_right_outlined,
                                        color: Colors.grey,
                                        size: 12.w),
                                  )),
                                ]),
                              ),
                            ),
                          ),
                        )),
                        SizedBox(
                          height: 2.h,
                        ),
                        Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 3.w),
                              child: Material(
                                elevation: 2,
                                borderRadius: BorderRadius.circular(4.w),
                                child: videoList.length == 0
                                    ? AppWidget.circularIndicator()
                                    : Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(4.w),
                                            color: AppColors.lightGrey),
                                        child: CarouselSlider.builder(
                                            itemCount: videoList.length,
                                            itemBuilder:
                                                ((context, index, realIndex) {
                                              return Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Stack(
                                                  children: [
                                                    Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: [
                                                        Padding(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      3.w),
                                                          child: ClipRRect(
                                                            child: videoList[
                                                                        index]
                                                                    .imageVideo
                                                                    .toString()
                                                                    .contains(
                                                                        'www.youtube.com')
                                                                ? YoutubePlayer(
                                                                    bottomActions: [
                                                                        CurrentPosition(),
                                                                        ProgressBar(
                                                                            isExpanded:
                                                                                true),
                                                                      ],
                                                                    // bottomActions: [
                                                                    //   SizedBox(
                                                                    //       width:
                                                                    //           14.0),
                                                                    //   CurrentPosition(),
                                                                    //   SizedBox(
                                                                    //       width:
                                                                    //           8.0),
                                                                    //   ProgressBar(),
                                                                    //   RemainingDuration(),
                                                                    //   PlaybackSpeedButton(),
                                                                    // ],
                                                                    controller:
                                                                        YoutubePlayerController(
                                                                      initialVideoId:
                                                                          YoutubePlayer.convertUrlToId(
                                                                              '${videoList[index].imageVideo}')!,
                                                                      flags:
                                                                          YoutubePlayerFlags(
                                                                        autoPlay:
                                                                            false,
                                                                        mute:
                                                                            false,
                                                                        disableDragSeek:
                                                                            false,
                                                                      ),
                                                                    ))
                                                                : FlickVideoPlayer(
                                                                    // preferredDeviceOrientation: const [
                                                                    //   DeviceOrientation
                                                                    //       .portraitUp,
                                                                    //   DeviceOrientation
                                                                    //       .portraitDown,
                                                                    //   // DeviceOrientation.landscapeRight,
                                                                    //   // DeviceOrientation.landscapeLeft,
                                                                    // ],
                                                                    wakelockEnabled:
                                                                        true,
                                                                    wakelockEnabledFullscreen:
                                                                        false,
                                                                    preferredDeviceOrientationFullscreen: [
                                                                      DeviceOrientation
                                                                          .portraitUp,
                                                                      DeviceOrientation
                                                                          .portraitDown,
                                                                    ],
                                                                    preferredDeviceOrientation: [
                                                                      DeviceOrientation
                                                                          .portraitUp,
                                                                      DeviceOrientation
                                                                          .portraitDown,
                                                                    ],

                                                                    flickManager:
                                                                        FlickManager(
                                                                      autoInitialize:
                                                                          true,
                                                                      autoPlay:
                                                                          false,
                                                                      videoPlayerController: VideoPlayerController.network(
                                                                          // "https://firebasestorage.googleapis.com/v0/b/preschool-6611d.appspot.com/o/how%20to%20integrate%20downloading%20feature%20in%20flutter%20application.mp4?alt=media&token=3b5e5b77-f6a0-4249-839c-7f1fe7db90e3"
                                                                          '${videoList[index].imageVideo}'),
                                                                    ),

                                                                    flickVideoWithControls:
                                                                        const FlickVideoWithControls(
                                                                      backgroundColor:
                                                                          Colors
                                                                              .black87,
                                                                      iconThemeData:
                                                                          IconThemeData(
                                                                              color: Colors.white),
                                                                      videoFit:
                                                                          BoxFit
                                                                              .contain,
                                                                      closedCaptionTextStyle:
                                                                          TextStyle(
                                                                              fontSize: 8),
                                                                      controls:
                                                                          FlickPortraitControls(),
                                                                    ),
                                                                    flickVideoWithControlsFullscreen:
                                                                        const FlickVideoWithControls(
                                                                      controls:
                                                                          FlickPortraitControls(),
                                                                    ),
                                                                  ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        4.w),
                                                          ),
                                                        ),
                                                        Flexible(
                                                          child: Text(
                                                              videoList[index]
                                                                      .content ??
                                                                  '',
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      8.sp),
                                                              maxLines: 2),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              );
                                            }),
                                            options: CarouselOptions(
                                                height: 80.h,
                                                autoPlay: false,
                                                enableInfiniteScroll: false)),
                                      ),
                              ),
                            ),
                            flex: 2),
                        SizedBox(
                          height: 2.h,
                        ),
                        Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 3.w, vertical: 1.h),
                              child: ListView.builder(
                                  itemCount: imageList.length,
                                  shrinkWrap: true,
                                  itemBuilder: ((context, index) {
                                    return Column(
                                      children: [
                                        GestureDetector(
                                          onTap: () => _showDialogForImage(
                                              id: imageList[index].id,
                                              des: imageList[index].content,
                                              image:
                                                  'https://blackmarlinco.com/sys/${imageList[index].imageVideo}'),

                                          // onTap: () => Get.toNamed(
                                          //     RouteHelper.fullScreenImage,
                                          //     arguments: [
                                          //       imageList[index].id,
                                          //       imageList[index].content,
                                          //       'https://hemndb85.com/logistic2/uploads/${imageList[index].imageVideo.toString().substring(
                                          //             7,
                                          //           )}'
                                          //     ]),
                                          child: Container(
                                            width: 100.w,
                                            height: 23.h,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(4.w),
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: Colors.black26,
                                                      spreadRadius: 1,
                                                      blurRadius: 1,
                                                      offset: Offset(0, 2.5))
                                                ],
                                                image: DecorationImage(
                                                    image: NetworkImage(
                                                        'https://blackmarlinco.com/sys/${imageList[index].imageVideo}'),
                                                    fit: BoxFit.fill)),
                                            // child: Padding(
                                            //   padding: EdgeInsets.symmetric(
                                            //       horizontal: 3.w,
                                            //       vertical: 2.w),
                                            //   child: Column(
                                            //       mainAxisAlignment:
                                            //           MainAxisAlignment.end,
                                            //       crossAxisAlignment:
                                            //           CrossAxisAlignment.start,
                                            //       children: [
                                            //         Text(
                                            //           imageList[index].id ?? '',
                                            //           style: TextStyle(
                                            //               fontSize: 16.sp,
                                            //               color: Colors.white,
                                            //               fontWeight:
                                            //                   FontWeight.bold),
                                            //         ),
                                            //         Text(
                                            //           imageList[index]
                                            //                   .content ??
                                            //               '',
                                            //           maxLines: 1,
                                            //           overflow:
                                            //               TextOverflow.ellipsis,
                                            //           style: TextStyle(
                                            //               fontSize: 8.sp,
                                            //               color: Colors.white),
                                            //         )
                                            //       ]),
                                            // ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 2.h,
                                        ),
                                      ],
                                    );
                                  })),
                            ),
                            flex: 3),
                      ]),
                    );
            }),
          )),
    );
  }

  listTileWidget({String? text, void Function()? onTap, Color? color}) =>
      ListTile(
        onTap: onTap,
        tileColor: color,
        title: Text(
          text.toString(),
          style: TextStyle(color: Colors.white, fontSize: 14.sp),
        ),
        leading: Icon(Icons.list_alt, color: Colors.red, size: 7.w),
      );

  expansionTile({String? text, VoidCallback? onTap, Color? color}) => Column(
        children: [
          GestureDetector(
            onTap: onTap,
            child: Container(
              width: 100.w,
              color: color,
              padding: EdgeInsets.only(left: 18.w, right: 18.w),
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 1.h,
                  ),
                  Text(
                    text.toString(),
                    style: TextStyle(color: Colors.white, fontSize: 14.sp),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                ],
              ),
            ),
          ),
        ],
      );

  _showLogOutDialog() {
    return showDialog(
        context: context,
        builder: ((context) {
          return AlertDialog(
            title: Text('sureToLogOutText'.tr,
                style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.w400)),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      SharedPreferenceClass.setBool(AppStrings.isLogin, false);
                      SharedPreferenceClass.getUserData().then((value) {
                        Map<String, dynamic> data = jsonDecode(value);
                        data.clear();
                      });
                      Get.back();
                      Get.offAllNamed(RouteHelper.mainScreen);
                    });
                  },
                  child: Text(
                    'yes'.tr,
                    style: TextStyle(fontSize: 12.sp),
                  ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange.shade900)),
              ElevatedButton(
                  onPressed: () => Get.back(),
                  child: Text(
                    'no'.tr,
                    style: TextStyle(fontSize: 12.sp),
                  ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange.shade900)),
            ],
          );
        }));
  }

  _showDialogForMainText() {
    return showDialog(
        context: context,
        builder: ((context) {
          return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4.w),
              ),
              elevation: 4,
              clipBehavior: Clip.hardEdge,
              content: Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w),
                child: Container(
                  width: 100.w,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: GestureDetector(
                                  onTap: () => Get.back(),
                                  child: Icon(
                                    Icons.arrow_back_ios,
                                    size: 6.w,
                                  )),
                            ),
                            Flexible(
                                flex: 2,
                                child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Image.asset(AppImages.logo,
                                        height: 8.h))),
                          ],
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        Text('mainTitleText'.tr,
                            style: TextStyle(fontSize: 14.sp)),
                        SizedBox(
                          height: 2.h,
                        ),
                        Text(
                          'blackMarlinDes'.tr,
                          style: TextStyle(fontSize: 12.sp),
                          textAlign: TextAlign.justify,
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                      ],
                    ),
                  ),
                ),
              ));
        }));
  }

  _showDialogForImage({String? image, String? des, String? id}) {
    return showDialog(
        context: context,
        builder: ((context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4.w),
            ),
            elevation: 4,
            clipBehavior: Clip.hardEdge,
            content: Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: GestureDetector(
                              onTap: () => Get.back(),
                              child: Icon(
                                Icons.arrow_back_ios,
                                size: 6.w,
                              )),
                        ),
                        Flexible(
                            flex: 2,
                            child: Align(
                                alignment: Alignment.centerLeft,
                                child:
                                    Image.asset(AppImages.logo, height: 8.h))),
                      ],
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    Container(
                        height: 20.h,
                        width: 100.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.w),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black26,
                                spreadRadius: 1,
                                blurRadius: 1,
                                offset: Offset(0, 2.5))
                          ],
                          image: DecorationImage(
                              image: NetworkImage(image.toString()),
                              fit: BoxFit.fill),
                        )),
                    SizedBox(
                      height: 4.h,
                    ),
                    Text(
                      des.toString(),
                      textDirection: TextDirection.rtl,
                      style: TextStyle(fontSize: 12.sp),
                    ),
                  ],
                ),
              ),
            ),
          );
        }));
  }
}
