import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:synram_practical/api/api_services.dart';
import 'package:synram_practical/bloc/get_container_bloc.dart';
import 'package:synram_practical/helper/route_helper.dart';
import 'package:synram_practical/model/get_container_model.dart';
import 'package:synram_practical/utils/app_colors.dart';
import 'package:synram_practical/utils/app_images.dart';
import 'package:synram_practical/utils/app_string.dart';
import 'package:synram_practical/utils/app_widget.dart';
import 'package:synram_practical/utils/shared_pref.dart';

class GetContainers extends StatefulWidget {
  const GetContainers({Key? key}) : super(key: key);

  @override
  State<GetContainers> createState() => _GetContainersState();
}

class _GetContainersState extends State<GetContainers> {
  GetContainerModel? response;
  bool? loading;
  GetContainerBloc getContainerBloc = GetContainerBloc();

  @override
  void initState() {
    getContainerBloc = BlocProvider.of<GetContainerBloc>(context);
    getContainerBloc.add(onGetContainerEventData(
        userId: SharedPreferenceClass.getString(AppStrings.userId)));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
          height: double.infinity,
          width: double.infinity,
          child: BlocConsumer<GetContainerBloc, GetContainerState>(
            builder: ((context, state) {
              return Stack(
                children: [
                  Column(
                    children: [
                      AppWidget.appBarWidget(text: 'Containers'),
                      SizedBox(
                        height: 4.h,
                      ),
                      loading == true
                          ? Container()
                          : response?.status == true
                              ? Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 8.w),
                                  child: ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: response?.data?.length,
                                      itemBuilder: ((context, index) {
                                        return Column(
                                          children: [
                                            SizedBox(
                                              height: 1.h,
                                            ),
                                            GestureDetector(
                                              onTap: () => {
                                                print(
                                                  response!
                                                      .data![index].containerNo
                                                      .toString(),
                                                ),
                                                Get.toNamed(
                                                    RouteHelper.trackContainer,
                                                    arguments: [
                                                      response!.data![index]
                                                          .containerNo
                                                          .toString(),
                                                    ]),
                                              },
                                              child: Material(
                                                elevation: 2,
                                                borderRadius:
                                                    BorderRadius.circular(3.w),
                                                child: Container(
                                                  height: 8.h,
                                                  width: 100.w,
                                                  alignment: Alignment.center,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            3.w),
                                                    color: Colors.red.shade100,
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Expanded(
                                                        child: Container(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      2.w),
                                                          child: Image.asset(
                                                            AppImages.container,
                                                            height: 6.h,
                                                            width: 80.w,
                                                            fit: BoxFit.fill,
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        flex: 2,
                                                        child: Container(
                                                          width: 100.w,
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      1.w),
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          child: Text(
                                                            response!
                                                                .data![index]
                                                                .containerNo
                                                                .toString(),
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            style: TextStyle(
                                                                fontSize: 12.sp,
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 1.h,
                                            ),
                                          ],
                                        );
                                      })),
                                )
                              : Expanded(
                                  child: Center(child: Text('noDataFound'.tr))),
                    ],
                  ),
                  if (loading == true)
                    Container(
                      color: Colors.white60,
                      child: AppWidget.circularIndicator(),
                    )
                ],
              );
            }),
            listener: (context, state) {
              if (state is GetContainerInitial) {
                setState(() {
                  loading = state.loading;
                });
              } else if (state is GetContainerLoaded) {
                setState(() {
                  response = state.getContainerModel;
                  print('MY $response');
                });
              }
            },
          )),
    ));
  }
}
