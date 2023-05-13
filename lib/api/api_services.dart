import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:get/route_manager.dart';
import 'package:synram_practical/helper/route_helper.dart';
import 'package:synram_practical/model/getOrder_model.dart';
import 'package:synram_practical/model/get_container_model.dart';
import 'package:synram_practical/model/merchant_balance_model.dart';
import 'package:synram_practical/model/merchat_report_model.dart';
import 'package:synram_practical/model/news_model.dart';
import 'package:synram_practical/model/shippingCost_model.dart';
import 'package:synram_practical/model/shipping_model.dart';
import 'package:synram_practical/utils/app_string.dart';
import 'package:synram_practical/utils/shared_pref.dart';

class ApiServices {
  Dio _dio = Dio();

  // static String baseUrl = 'https://hemndb85.com/logistic2/ApiController/';
  static String baseUrl = 'https://blackmarlinco.com/sys/ApiController/';

  loginApi({String? username, String? password}) async {
    try {
      var formData =
          FormData.fromMap({'username': username, 'password': password});
      var response = await _dio.post(
        baseUrl + AppStrings.loginUrl,
        data: formData,
      );
      if (response.data['Status'] == true) {
        var data = jsonEncode(response.data);
        Map<String, dynamic> data1 = jsonDecode(data);
        print(data1);
        SharedPreferenceClass.setUserData(jsonEncode(response.data));
        SharedPreferenceClass.setBool(AppStrings.isLogin, true);
        SharedPreferenceClass.setString(AppStrings.localCode, 'en_US');
        SharedPreferenceClass.setString(
            AppStrings.userId, data1['Data'][0]['userID']);
        SharedPreferenceClass.setString(
            AppStrings.userName, data1['Data'][0]['username']);
        SharedPreferenceClass.setString(
            AppStrings.name, data1['Data'][0]['name']);

        Get.offAllNamed(RouteHelper.mainScreen);
      } else {
        Fluttertoast.showToast(msg: 'invalidCred'.tr);
      }
    } on DioError catch (e) {
      print('Error ${e.response?.data['Data']}');
    }
  }

  Future<ShippingDailyCostModel?> shippingCostDailyApi({String? date}) async {
    ShippingDailyCostModel shippingDailyCostData;
    print('GET ${baseUrl + '${AppStrings.shippingCostDailyUrl}?date=$date'}');
    try {
      var response = await _dio.get(
        baseUrl + '${AppStrings.shippingCostDailyUrl}?date=$date',
      );
      if (response.data['Status'] == true) {
        shippingDailyCostData = ShippingDailyCostModel.fromMap(response.data);
        return shippingDailyCostData;
      }
    } on SocketException catch (e) {
      Fluttertoast.showToast(msg: 'checkConnection'.tr);
      throw SocketException(e.toString());
    } on DioError catch (e) {
      Fluttertoast.showToast(msg: 'Something went wrong');
    }
  }

  Future<NewsModel?> getNewsApiData() async {
    NewsModel newsModel = NewsModel();
    try {
      var response = await _dio.get(
        baseUrl + AppStrings.newsUrl,
      );
      if (response.data['Status'] == true) {
        newsModel = NewsModel.fromMap(response.data);
        return newsModel;
      }
    } on SocketException catch (e) {
      Fluttertoast.showToast(msg: 'checkConnection'.tr);
      throw SocketException(e.toString());
    } on DioError catch (e) {
      print('Error ${e.response?.data['Data']}');
    }
  }

  Future<GetOrderModel?> getOrderApiData(
      {String? userId, String? search, String? year}) async {
    GetOrderModel? getOrderModel;
    try {
      var response = await _dio.get(
        baseUrl +
            '${AppStrings.ordersUrl}?userID=$userId&search=$search&year=$year',
      );
      print(
        baseUrl +
            '${AppStrings.ordersUrl}?userID=$userId&search=${search.toString()}&year=${year.toString()}',
      );
      if (response.data['Status'] == true) {
        getOrderModel = GetOrderModel.fromMap(response.data);
        return getOrderModel;
      }
    } on SocketException catch (e) {
      Fluttertoast.showToast(msg: 'checkConnection'.tr);
      throw SocketException(e.toString());
    } on DioError catch (e) {
      print('Error ${e.response?.data['Data']}');
    }
  }

  Future<MerchantBalanceModel?> getMerchantBalApiData({String? userID}) async {
    MerchantBalanceModel? merchantBalanceModel;
    try {
      var response = await _dio.get(
        baseUrl + '${AppStrings.merchantBalanceUrl}?userID=$userID',
      );
      if (response.data['Status'] == true) {
        print('Response succenss ${response.data}');
        merchantBalanceModel = MerchantBalanceModel.fromMap(response.data);
        print('getMode ${response.data}');
        return merchantBalanceModel;
      }
    } on SocketException catch (e) {
      Fluttertoast.showToast(msg: 'checkConnection'.tr);
      throw SocketException(e.toString());
    } on DioError catch (e) {
      print('Error ${e.response?.data['Data']}');
    }
  }

  Future<MerchantReportModel?> getMerchantReportApiData(
      {String? userID}) async {
    MerchantReportModel? merchantReportModel;
    try {
      var response = await _dio.get(
        baseUrl + '${AppStrings.merchantAccountReportUrl}?userID=$userID',
      );
      if (response.data['Status'] == true) {
        print('Response succenss ${response.data}');
        merchantReportModel = MerchantReportModel.fromMap(response.data);
        print('getMode ${merchantReportModel.data}');
        return merchantReportModel;
      }
    } on SocketException catch (e) {
      Fluttertoast.showToast(msg: 'checkConnection'.tr);
      throw SocketException(e.toString());
    } on DioError catch (e) {
      print('Error ${e.response?.data['Data']}');
    }
  }

  Future<ShippingModel?> shipDataApi(
      {String? number, String? sealine, String? api_key}) async {
    ShippingModel? shippingModel;

    print('SEe $sealine');
    print('SEe $number');
    print('SEe $api_key');

    try {
      var response = await _dio.get(
        'https://tracking.searates.com/container?number=$number&sealine=$sealine&api_key=$api_key',
      );

      print('Response ${response.data}');
      if (response.data['status'] == 'success') {
        shippingModel = ShippingModel.fromMap(response.data);
        return ShippingModel.fromMap(response.data);
      }
      return shippingModel;
    } on SocketException catch (e) {
      Fluttertoast.showToast(msg: 'checkConnection'.tr);
      throw SocketException(e.toString());
    } on DioError catch (e) {
      print('Error ${e.response?.data['Data']}');
    }
  }

  Future<GetContainerModel?> getContainersApi({String? userID}) async {
    GetContainerModel? getContainerModel;
    try {
      // print('DATA ${'https://hemndb85.com/logistic2/ApiController/' +
      //     '${AppStrings.getContainers}?userID=$userID'}');
      // 'https://hemndb85.com/logistic2/ApiController/' +
      //     '${AppStrings.getContainers}?userID=$userID',
      print('${baseUrl + '${AppStrings.getContainers}?userID=$userID'}');
      var response = await _dio
          .get(baseUrl + '${AppStrings.getContainers}?userID=$userID');
      // https://blackmarlinco.com/sys/ApiController/getContainers?userID=2129
      print('Response ${response.data}');
      if (response.data['Status'] == true) {
        getContainerModel = GetContainerModel.fromMap(response.data);
        return getContainerModel;
      }
      return GetContainerModel.fromMap(response.data);
    } on SocketException catch (e) {
      Fluttertoast.showToast(msg: 'checkConnection'.tr);
      throw SocketException(e.toString());
    } on DioError catch (e) {
      print('Error ${e.response?.data['Data']}');
    }
  }
}
