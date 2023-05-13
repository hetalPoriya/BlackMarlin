import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'package:synram_practical/bloc/order/get_order_bloc.dart';
import 'package:synram_practical/model/getOrder_model.dart';
import 'package:synram_practical/utils/app_string.dart';
import 'package:synram_practical/utils/app_widget.dart';
import 'package:synram_practical/utils/shared_pref.dart';

class OrderReport extends StatefulWidget {
  const OrderReport({Key? key}) : super(key: key);

  @override
  State<OrderReport> createState() => _OrderReportState();
}

class _OrderReportState extends State<OrderReport> {
  GetOrderBloc getOrderBloc = GetOrderBloc();
  GetOrderModel? getOrderModel;
  List<GetOrderListData>? getOrderList;
  bool? loading;

  @override
  void initState() {
    getOrderBloc = BlocProvider.of<GetOrderBloc>(context);
    print(SharedPreferenceClass.getString(AppStrings.userId));
    getOrderBloc.add(GetOrderDataEvent(
        userId: SharedPreferenceClass.getString(AppStrings.userId),
        search: '',
        year: ''));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
          width: 100.w,
          height: 100.h,
          child: Column(
            children: [
              AppWidget.appBarWidget(text: 'orderDetails'.tr),
              Expanded(
                  child: BlocConsumer<GetOrderBloc, GetOrderState>(
                listener: ((context, state) {
                  if (state is GetOrderInitial) {
                    setState(() {
                      loading = state.loading;
                    });
                  } else if (state is GetOrderLoaded) {
                    setState(() {
                      getOrderModel = state.getOrderModel;
                      getOrderList = getOrderModel?.data;
                    });
                  }
                }),
                builder: ((context, state) {
                  return (loading == true)
                      ? AppWidget.circularIndicator()
                      : getOrderModel?.status == 'false'
                          ? Center(
                              child: Text('noDataFound'.tr),
                            )
                          : ListView.builder(
                              itemCount: getOrderList?.length,
                              itemBuilder: ((context, index) {
                                return Container(
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 6.w, vertical: 2.h),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              child: Text(
                                                ' ${'orderNo'.tr} - ${getOrderList?[index].id} ',
                                                style: TextStyle(
                                                    fontSize: 10.sp,
                                                    color: Colors.white),
                                              ),
                                              padding: EdgeInsets.all(1.w),
                                              decoration: BoxDecoration(
                                                  color:
                                                      Colors.lightBlue.shade400,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          1.w)),
                                            ),
                                            Container(
                                                padding: EdgeInsets.all(1.w),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            1.w),
                                                    border: Border.all(
                                                      color: Colors.lightBlue,
                                                    )),
                                                child: Row(
                                                  children: [
                                                    Icon(
                                                        Icons
                                                            .calendar_today_outlined,
                                                        color: Colors.black54,
                                                        size: 3.w),
                                                    SizedBox(
                                                      width: 1.w,
                                                    ),
                                                    Text(
                                                      '${getOrderList?[index].date}',
                                                      style: TextStyle(
                                                          color: Colors.black54,
                                                          fontSize: 6.sp),
                                                    )
                                                  ],
                                                ))
                                          ],
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                        ),
                                        SizedBox(
                                          height: 2.h,
                                        ),
                                        Material(
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: Colors.white38,
                                                borderRadius:
                                                    BorderRadius.circular(4.w),
                                                border: Border.all(
                                                  color:
                                                      Colors.lightBlue.shade100,
                                                )),
                                            //margin: EdgeInsets.all(4.w),
                                            child: Padding(
                                              padding: EdgeInsets.all(4.w),
                                              child: Column(children: [
                                                _textWidget(
                                                    text: 'shopNo'.tr,
                                                    price: '104'),
                                                _divide(),
                                                _textWidget(
                                                    text: 'amount'.tr,
                                                    price: getOrderList?[index]
                                                        .amount),
                                                _divide(),
                                                _textWidget(
                                                    text: 'currencyType'.tr,
                                                    price: getOrderList?[index]
                                                        .typeOfCurrency),
                                                _divide(),
                                                _textWidget(
                                                    text: 'rate'.tr,
                                                    price: getOrderList?[index]
                                                        .rate),
                                                _divide(),
                                                _textWidget(
                                                    text: 'commission'.tr,
                                                    price: getOrderList?[index]
                                                        .companyCommission),
                                                _divide(),
                                                _textWidget(
                                                    text: 'depositAmount'.tr,
                                                    price: getOrderList?[index]
                                                        .depositeamount),
                                                _divide(),
                                                _textWidget(
                                                    text: 'depositBy'.tr,
                                                    price: getOrderList?[index]
                                                        .depositeamountby),
                                                _divide(),
                                                _textWidget(
                                                    text: 'cmb'.tr,
                                                    price: getOrderList?[index]
                                                        .cbm),
                                                _divide(),
                                                _textWidget(
                                                    text: 'ctn'.tr,
                                                    price: getOrderList?[index]
                                                        .ctn),
                                                _divide(),
                                              ]),
                                            ),
                                          ),
                                          elevation: 4.w,
                                          borderRadius:
                                              BorderRadius.circular(4.w),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              }));
                }),
              ))
            ],
          )),
    ));
  }

  _textWidget({String? text, String? price}) => Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.w),
        child: Row(
          children: [
            Text(
              text.toString(),
              style: TextStyle(color: Colors.black, fontSize: 12.sp),
            ),
            Text(
              price.toString(),
              style: TextStyle(color: Colors.orange.shade600, fontSize: 12.sp),
            )
          ],
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
        ),
      );

  _divide() => Divider(
        color: Colors.black,
      );
}
