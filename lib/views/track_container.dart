import 'dart:async';
import 'package:flutter_animarker/flutter_map_marker_animation.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sizer/sizer.dart';
import 'package:synram_practical/bloc/ship/ship_bloc.dart';
import 'package:synram_practical/model/shipping_model.dart';
import 'package:synram_practical/utils/app_images.dart';
import 'package:synram_practical/utils/app_widget.dart';

class TrackContainer extends StatefulWidget {
  String? containerStr;

  TrackContainer({Key? key, this.containerStr}) : super(key: key);

  @override
  State<TrackContainer> createState() => _TrackContainerState();
}

class _TrackContainerState extends State<TrackContainer> {
  ShipBloc shipBloc = ShipBloc();
  ShippingModel? shippingModel;
  bool? loading;
  var data = Get.arguments;

  //late GoogleMapController mapController;

  // void _onMapCreated(GoogleMapController controller) {
  //   mapController = controller;
  // }

  late GoogleMapController mapController;
  List<Marker> markers = [];
  double? late;
  double? lng;
  String? containerStr;
  int? number;

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  void initState() {
    print('Get.parameters[0] ${data[0]}');

    shipBloc = BlocProvider.of<ShipBloc>(context);
    shipBloc.add(GetShipEventData(
        api_key: 'YLBW-52S4-VU7Z-KNPO-QJIE', number: data[0], sealine: 'auto'));

    // markers.add(Marker(
    //   //add start location marker
    //   markerId: MarkerId(LatLng(27.6683619, 85.3101895).toString()),
    //   position: LatLng(27.6683619, 85.3101895), //position of marker
    //   infoWindow: InfoWindow(
    //     //popup info
    //     title: 'Starting Point ',
    //     snippet: 'Start Marker',
    //   ),
    //   icon: BitmapDescriptor.defaultMarker, //Icon for Marker
    // ));
    //
    // markers.add(Marker(
    //   //add distination location marker
    //   markerId: MarkerId(LatLng(27.6688312, 85.3077329).toString()),
    //   position: LatLng(27.6688312, 85.3077329), //position of marker
    //   infoWindow: InfoWindow(
    //     //popup info
    //     title: 'Destination Point ',
    //     snippet: 'Destination Marker',
    //   ),
    //   icon: BitmapDescriptor.defaultMarker, //Icon for Marker
    // ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: 100.h,
          width: 100.w,
          child: BlocConsumer<ShipBloc, ShipState>(listener: ((context, state) {
            if (state is ShipInitial) {
              setState(() {
                loading = state.loading;
              });
            } else if (state is ShipDataLoaded) {
              shippingModel = state.shippingModel;
              late = shippingModel?.data?.locations?[0].lat;
              lng = shippingModel?.data?.locations?[0].lng;
              containerStr = shippingModel?.data?.container?.number.toString();

              if (late != null && lng != null) {
                markers = <Marker>[
                  RippleMarker(
                      markerId: MarkerId('1'),
                      position: LatLng(late!, lng!),
                      ripple: true,
                      visible: true,
                      infoWindow: InfoWindow(
                        title:
                            '${shippingModel?.data?.locations?[0].name.toString()} , ${shippingModel?.data?.locations?[0].state.toString()} , ${shippingModel?.data?.locations?[0].country.toString()}',
                      )),
                ];
              }
              setState(() {});
            }
          }), builder: ((context, state) {
            final controller = Completer<GoogleMapController>();
            return Container(
              height: 100.h,
              width: 100.w,
              child: Column(
                children: [
                  AppWidget.appBarWidget(text: data[0]),
                  Expanded(
                    // child: Center(
                    //     child: Text(
                    //   'comingSoon'.tr,
                    //   style:
                    //       TextStyle(fontSize: 20.sp, color: Colors.orange.shade900),
                    // )),
                    child: loading == true
                        ? AppWidget.circularIndicator()
                        : shippingModel?.message != 'OK'
                            ? Center(child: Text('noDataFound'.tr))
                            : Column(children: [
                                SizedBox(
                                  height: 2.h,
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 4.w),
                                  child: Container(
                                    height: 15.h,
                                    width: 100.w,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(2.w),
                                        border: Border.all(
                                            color: Colors.lightBlue.shade200,
                                            width: 2)),
                                    child: Row(children: [
                                      Flexible(
                                          child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 2.w),
                                        child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                shippingModel?.data?.container
                                                        ?.number ??
                                                    '',
                                                style: TextStyle(
                                                    fontSize: 10.sp,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              SizedBox(
                                                height: 1.h,
                                              ),
                                              Image.asset(AppImages.container,
                                                  height: 5.h,
                                                  fit: BoxFit.fill),
                                            ]),
                                      )),
                                      VerticalDivider(color: Colors.grey),
                                      Flexible(
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 2.w, vertical: 1.w),
                                            child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                          shippingModel
                                                                  ?.data
                                                                  ?.locations?[
                                                                      1]
                                                                  .name ??
                                                              '',
                                                          style: TextStyle(
                                                              fontSize: 11.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500)),
                                                      Text(
                                                          shippingModel
                                                                  ?.data
                                                                  ?.locations?[
                                                                      0]
                                                                  .name ??
                                                              '',
                                                          style: TextStyle(
                                                              fontSize: 11.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500)),
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                          DateFormat.yMMMd()
                                                              .format(
                                                                  shippingModel!
                                                                      .data!
                                                                      .container!
                                                                      .events![
                                                                          0]
                                                                      .date!),
                                                          style: TextStyle(
                                                            fontSize: 8.sp,
                                                          )),
                                                      Text(
                                                          DateFormat.yMMMd().format(shippingModel!
                                                              .data!
                                                              .container!
                                                              .events![(shippingModel
                                                                      ?.data
                                                                      ?.container
                                                                      ?.events
                                                                      ?.length)! -
                                                                  1]
                                                              .date!),
                                                          style: TextStyle(
                                                            fontSize: 8.sp,
                                                          )),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 2.h,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Container(
                                                        height: 3.h,
                                                        width: 6.w,
                                                        decoration: BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                            border: Border.all(
                                                                color: Colors
                                                                    .green
                                                                    .shade200,
                                                                width: 2)),
                                                      ),
                                                      Expanded(
                                                        child: Divider(
                                                          color: Colors
                                                              .green.shade200,
                                                          thickness: 2,
                                                        ),
                                                      ),
                                                      Container(
                                                        height: 4.h,
                                                        width: 7.w,
                                                        decoration:
                                                            BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          color: Colors
                                                              .green.shade200,
                                                          border: Border.all(
                                                              color: Colors
                                                                  .green
                                                                  .shade200,
                                                              width: 2),
                                                        ),
                                                        child: Image.asset(
                                                          AppImages.ship,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ]),
                                          ),
                                          flex: 2),
                                    ]),
                                  ),
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                Expanded(
                                  child: Container(
                                    // child: SfMaps(
                                    //   layers: [
                                    //     MapTileLayer(
                                    //       initialFocalLatLng:
                                    //           MapLatLng(30.0362, 47.91951),
                                    //       initialZoomLevel: 14,
                                    //       initialMarkersCount: 1,
                                    //       urlTemplate: '',
                                    //       markerBuilder:
                                    //           (BuildContext context, int index) {
                                    //         return MapMarker(
                                    //           latitude: 30.0362,
                                    //           longitude: 47.91951,
                                    //           child: Icon(
                                    //             Icons.location_on,
                                    //             color: Colors.red[800],
                                    //           ),
                                    //           size: Size(20, 20),
                                    //         );
                                    //       },
                                    //     ),
                                    //   ],
                                    // ),
                                    child: GoogleMap(
                                      mapType: MapType.normal,
                                      myLocationEnabled: true,
                                      markers: Set<Marker>.of(markers),
                                      mapToolbarEnabled: true,
                                      circles: Set.from([
                                        Circle(
                                            circleId: CircleId('1'),
                                            center: LatLng(late!, lng!),
                                            fillColor: Colors.red,
                                            strokeColor: Colors.red,
                                            radius: 500)
                                      ]),
                                      compassEnabled: true,
                                      zoomControlsEnabled: true,
                                      zoomGesturesEnabled: true,
                                      initialCameraPosition: CameraPosition(
                                          target: LatLng(late!, lng!),
                                          zoom: 10),
                                      onMapCreated: _onMapCreated,
                                    ),
                                  ),
                                )
                              ]),
                  ),
                ],
              ),
            );
          })),
        ),
      ),
    );
  }
}
