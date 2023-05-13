// To parse this JSON data, do
//
//     final getOrderModel = getOrderModelFromMap(jsonString);

import 'dart:convert';

GetOrderModel getOrderModelFromMap(String str) => GetOrderModel.fromMap(json.decode(str));

String getOrderModelToMap(GetOrderModel data) => json.encode(data.toMap());

class GetOrderModel {
  GetOrderModel({
    this.status,
    this.data,
  });

  bool? status;
  List<GetOrderListData>? data;

  factory GetOrderModel.fromMap(Map<String, dynamic> json) => GetOrderModel(
    status: json["Status"] == null ? null : json["Status"],
    data: json["Data"] == null ? null : List<GetOrderListData>.from(json["Data"].map((x) => GetOrderListData.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "Status": status == null ? null : status,
    "Data": data == null ? null : List<dynamic>.from(data!.map((x) => x.toMap())),
  };
}

class GetOrderListData {
  GetOrderListData({
    this.id,
    this.merchantId,
    this.orderNo,
    this.amount,
    this.typeOfCurrency,
    this.comment,
    this.date,
    this.cbm,
    this.ctn,
    this.kg,
    this.createdby,
    this.status,
    this.currentyear,
    this.confirm,
    this.shopName,
    this.filename,
    this.companyCommission,
    this.depositeamount,
    this.depositeamountby,
    this.translatorby,
    this.rate,
    this.chinawarehousestatus,
    this.merchantname,
    this.marka,
    this.translatorname,
    this.typeofcompanyaccountname,
  });

  String? id;
  String? merchantId;
  String? orderNo;
  String? amount;
  String? typeOfCurrency;
  String? comment;
  String? date;
  String? cbm;
  String? ctn;
  String? kg;
  String? createdby;
  String? status;
  String? currentyear;
  String? confirm;
  String? shopName;
  String? filename;
  String? companyCommission;
  String? depositeamount;
  String? depositeamountby;
  String? translatorby;
  String? rate;
  String? chinawarehousestatus;
  String? merchantname;
  String? marka;
  String? translatorname;
  String? typeofcompanyaccountname;

  factory GetOrderListData.fromMap(Map<String?, dynamic> json) => GetOrderListData(
    id: json["id"] == null ? null : json["id"],
    merchantId: json["merchant_id"] == null ? null : json["merchant_id"],
    orderNo: json["order_no"] == null ? null : json["order_no"],
    amount: json["amount"] == null ? null : json["amount"],
    typeOfCurrency: json["type_of_currency"] == null ? null : json["type_of_currency"],
    comment: json["comment"] == null ? null : json["comment"],
    date: json["date"] == null ? null : json["date"],
    cbm: json["cbm"] == null ? null : json["cbm"],
    ctn: json["ctn"] == null ? null : json["ctn"],
    kg: json["kg"] == null ? null : json["kg"],
    createdby: json["createdby"] == null ? null : json["createdby"],
    status: json["status"] == null ? null : json["status"],
    currentyear: json["currentyear"] == null ? null : json["currentyear"],
    confirm: json["confirm"] == null ? null : json["confirm"],
    shopName: json["shop_name"] == null ? null : json["shop_name"],
    filename: json["filename"] == null ? null : json["filename"],
    companyCommission: json["company_commission"] == null ? null : json["company_commission"],
    depositeamount: json["depositeamount"] == null ? null : json["depositeamount"],
    depositeamountby: json["depositeamountby"] == null ? null : json["depositeamountby"],
    translatorby: json["translatorby"] == null ? null : json["translatorby"],
    rate: json["rate"] == null ? null : json["rate"],
    chinawarehousestatus: json["chinawarehousestatus"] == null ? null : json["chinawarehousestatus"],
    merchantname: json["merchantname"] == null ? null : json["merchantname"],
    marka: json["marka"] == null ? null : json["marka"],
    translatorname: json["translatorname"] == null ? null : json["translatorname"],
    typeofcompanyaccountname: json["typeofcompanyaccountname"] == null ? null : json["typeofcompanyaccountname"],
  );

  Map<String, dynamic> toMap() => {
    "id": id == null ? null : id,
    "merchant_id": merchantId == null ? null : merchantId,
    "order_no": orderNo == null ? null : orderNo,
    "amount": amount == null ? null : amount,
    "type_of_currency": typeOfCurrency == null ? null : typeOfCurrency,
    "comment": comment == null ? null : comment,
    "date": date == null ? null : date,
    "cbm": cbm == null ? null : cbm,
    "ctn": ctn == null ? null : ctn,
    "kg": kg == null ? null : kg,
    "createdby": createdby == null ? null : createdby,
    "status": status == null ? null : status,
    "currentyear": currentyear == null ? null : currentyear,
    "confirm": confirm == null ? null : confirm,
    "shop_name": shopName == null ? null : shopName,
    "filename": filename == null ? null : filename,
    "company_commission": companyCommission == null ? null : companyCommission,
    "depositeamount": depositeamount == null ? null : depositeamount,
    "depositeamountby": depositeamountby == null ? null : depositeamountby,
    "translatorby": translatorby == null ? null : translatorby,
    "rate": rate == null ? null : rate,
    "chinawarehousestatus": chinawarehousestatus == null ? null : chinawarehousestatus,
    "merchantname": merchantname == null ? null : merchantname,
    "marka": marka == null ? null : marka,
    "translatorname": translatorname == null ? null : translatorname,
    "typeofcompanyaccountname": typeofcompanyaccountname == null ? null : typeofcompanyaccountname,
  };
}
