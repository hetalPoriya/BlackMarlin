// To parse this JSON data, do
//
//     final getMerchnatBalanceModel = getMerchnatBalanceModelFromMap(jsonString);

import 'dart:convert';

MerchantBalanceModel getMerchnatBalanceModelFromMap(String str) => MerchantBalanceModel.fromMap(json.decode(str));

String getMerchnatBalanceModelToMap(MerchantBalanceModel data) => json.encode(data.toMap());

class MerchantBalanceModel {
  MerchantBalanceModel({
    this.status,
    this.data,
  });

  bool? status;
  List<MerchantBalanceDataList>? data;

  factory MerchantBalanceModel.fromMap(Map<String, dynamic> json) => MerchantBalanceModel(
    status: json["Status"] == null ? null : json["Status"],
    data: json["Data"] == null ? null : List<MerchantBalanceDataList>.from(json["Data"].map((x) => MerchantBalanceDataList.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "Status": status == null ? null : status,
    "Data": data == null ? null : List<dynamic>.from(data!.map((x) => x.toMap())),
  };
}

class MerchantBalanceDataList {
  MerchantBalanceDataList({
    this.subject,
    this.spentRmb,
    this.recivedRmb,
    this.remindRmb,
    this.spentUsd,
    this.recivedUsd,
    this.remindUsd,
  });

  String? subject;
  String? spentRmb;
  dynamic recivedRmb;
  String? remindRmb;
  String? spentUsd;
  dynamic recivedUsd;
  String? remindUsd;

  factory MerchantBalanceDataList.fromMap(Map<String, dynamic> json) => MerchantBalanceDataList(
    subject: json["Subject"] == null ? null : json["Subject"],
    spentRmb: json["Spent_RMB"] == null ? null : json["Spent_RMB"],
    recivedRmb: json["Recived_RMB"],
    remindRmb: json["Remind_RMB"] == null ? null : json["Remind_RMB"],
    spentUsd: json["Spent_USD"] == null ? null : json["Spent_USD"],
    recivedUsd: json["Recived_USD"],
    remindUsd: json["Remind_USD"] == null ? null : json["Remind_USD"],
  );

  Map<String, dynamic> toMap() => {
    "Subject": subject == null ? null : subject,
    "Spent_RMB": spentRmb == null ? null : spentRmb,
    "Recived_RMB": recivedRmb,
    "Remind_RMB": remindRmb == null ? null : remindRmb,
    "Spent_USD": spentUsd == null ? null : spentUsd,
    "Recived_USD": recivedUsd,
    "Remind_USD": remindUsd == null ? null : remindUsd,
  };
}
