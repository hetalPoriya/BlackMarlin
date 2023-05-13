// To parse this JSON data, do
//
//     final merchantReportModel = merchantReportModelFromMap(jsonString);

import 'dart:convert';

MerchantReportModel merchantReportModelFromMap(String str) => MerchantReportModel.fromMap(json.decode(str));

String merchantReportModelToMap(MerchantReportModel data) => json.encode(data.toMap());

class MerchantReportModel {
  MerchantReportModel({
    this.status,
    this.data,
  });

  bool? status;
  MerchantReportData? data;

  factory MerchantReportModel.fromMap(Map<String, dynamic> json) => MerchantReportModel(
    status: json["Status"] == null ? null : json["Status"],
    data: json["Data"] == null ? null : MerchantReportData.fromMap(json["Data"]),
  );

  Map<String, dynamic> toMap() => {
    "Status": status == null ? null : status,
    "MerchantReportData": data == null ? null : data!.toMap(),
  };
}

class MerchantReportData {
  MerchantReportData({
    this.finalTotal,
    this.merchantReport,
    this.beforeFromDate,
    this.fromTo,
    this.recivedMoney,
    this.spentMoney,
    this.totalTable,
  });

  BeforeFromDate? finalTotal;
  MerchantReport? merchantReport;
  BeforeFromDate? beforeFromDate;
  BeforeFromDate? fromTo;
  List<RecivedMoney>? recivedMoney;
  List<SpentMoney>? spentMoney;
  List<TotalTable>? totalTable;

  factory MerchantReportData.fromMap(Map<String, dynamic> json) => MerchantReportData(
    finalTotal: json["Final_Total"] == null ? null : BeforeFromDate.fromMap(json["Final_Total"]),
    merchantReport: json["Merchant_Report"] == null ? null : MerchantReport.fromMap(json["Merchant_Report"]),
    beforeFromDate: json["Before_From_Date"] == null ? null : BeforeFromDate.fromMap(json["Before_From_Date"]),
    fromTo: json["From_To"] == null ? null : BeforeFromDate.fromMap(json["From_To"]),
    recivedMoney: json["Recived_Money"] == null ? null : List<RecivedMoney>.from(json["Recived_Money"].map((x) => RecivedMoney.fromMap(x))),
    spentMoney: json["Spent_Money"] == null ? null : List<SpentMoney>.from(json["Spent_Money"].map((x) => SpentMoney.fromMap(x))),
    totalTable: json["TotalTable"] == null ? null : List<TotalTable>.from(json["TotalTable"].map((x) => TotalTable.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "Final_Total": finalTotal == null ? null : finalTotal?.toMap(),
    "Merchant_Report": merchantReport == null ? null : merchantReport?.toMap(),
    "Before_From_Date": beforeFromDate == null ? null : beforeFromDate?.toMap(),
    "From_To": fromTo == null ? null : fromTo?.toMap(),
    "Recived_Money": recivedMoney == null ? null : List<dynamic>.from(recivedMoney!.map((x) => x.toMap())),
    "Spent_Money": spentMoney == null ? null : List<dynamic>.from(spentMoney!.map((x) => x.toMap())),
    "TotalTable": totalTable == null ? null : List<dynamic>.from(totalTable!.map((x) => x.toMap())),
  };
}

class BeforeFromDate {
  BeforeFromDate({
    this.usd,
    this.rmb,
  });

  String? usd;
  String? rmb;

  factory BeforeFromDate.fromMap(Map<String, dynamic> json) => BeforeFromDate(
    usd: json["USD"] == null ? null : json["USD"],
    rmb: json["RMB"] == null ? null : json["RMB"],
  );

  Map<String, dynamic> toMap() => {
    "USD": usd == null ? null : usd,
    "RMB": rmb == null ? null : rmb,
  };
}

class MerchantReport {
  MerchantReport({
    this.marka,
    this.merchant,
    this.date,
  });

  String? marka;
  String? merchant;
  String? date;

  factory MerchantReport.fromMap(Map<String, dynamic> json) => MerchantReport(
    marka: json["Marka"] == null ? null : json["Marka"],
    merchant: json["Merchant"] == null ? null : json["Merchant"],
    date: json["Date"] == null ? null : json["Date"],
  );

  Map<String, dynamic> toMap() => {
    "Marka": marka == null ? null : marka,
    "Merchant": merchant == null ? null : merchant,
    "Date": date == null ? null : date,
  };
}

class RecivedMoney {
  RecivedMoney({
    this.sNo,
    this.date,
    this.subject,
    this.recivedRmb,
    this.recivedUsd,
    this.description,
    this.currencyType,
  });

  //int? sNo;
  dynamic sNo;
  String? date;
  String? subject;
  String? recivedRmb;
  String? recivedUsd;
  String? description;
  String? currencyType;

  factory RecivedMoney.fromMap(Map<String, dynamic> json) => RecivedMoney(
    sNo: json["S No"] == null ? null : json["S No"],
    date: json["Date"] == null ? null : json["Date"],
    subject: json["Subject"] == null ? null : json["Subject"],
    recivedRmb: json["Recived_RMB"] == null ? null : json["Recived_RMB"],
    recivedUsd: json["Recived_USD"] == null ? null : json["Recived_USD"],
    description: json["Description"] == null ? null : json["Description"],
    currencyType: json["Currency_Type"] == null ? null : json["Currency_Type"],
  );

  Map<String, dynamic> toMap() => {
    "S No": sNo == null ? null : sNo,
    "Date": date == null ? null : date,
    "Subject": subject == null ? null : subject,
    "Recived_RMB": recivedRmb == null ? null : recivedRmb,
    "Recived_USD": recivedUsd == null ? null : recivedUsd,
    "Description": description == null ? null : description,
    "Currency_Type": currencyType == null ? null : currencyType,
  };
}

class SpentMoney {
  SpentMoney({
    this.sNo,
    this.date,
    this.subject,
    this.spentRmb,
    this.spentUsd,
    this.description,
    this.currencyType,
  });

  dynamic sNo;
  String? date;
  String? subject;
  String? spentRmb;
  String? spentUsd;
  String? description;
  String? currencyType;

  factory SpentMoney.fromMap(Map<String, dynamic> json) => SpentMoney(
    sNo: json["S_No"],
    date: json["Date"] == null ? null : json["Date"],
    subject: json["Subject"] == null ? null : json["Subject"],
    spentRmb: json["Spent_RMB"] == null ? null : json["Spent_RMB"],
    spentUsd: json["Spent_USD"] == null ? null : json["Spent_USD"],
    description: json["Description"] == null ? null : json["Description"],
    currencyType: json["Currency_Type"] == null ? null : json["Currency_Type"],
  );

  Map<String, dynamic> toMap() => {
    "S_No": sNo,
    "Date": date == null ? null : date,
    "Subject": subject == null ? null : subject,
    "Spent_RMB": spentRmb == null ? null : spentRmb,
    "Spent_USD": spentUsd == null ? null : spentUsd,
    "Description": description == null ? null : description,
    "Currency_Type": currencyType == null ? null : currencyType,
  };
}

class TotalTable {
  TotalTable({
    this.subject,
    this.totalRmb,
    this.totalUsd,
  });

  String? subject;
  String? totalRmb;
  String? totalUsd;

  factory TotalTable.fromMap(Map<String, dynamic> json) => TotalTable(
    subject: json["Subject"] == null ? null : json["Subject"],
    totalRmb: json["Total_RMB"] == null ? null : json["Total_RMB"],
    totalUsd: json["Total_USD"] == null ? null : json["Total_USD"],
  );

  Map<String, dynamic> toMap() => {
    "Subject": subject == null ? null : subject,
    "Total_RMB": totalRmb == null ? null : totalRmb,
    "Total_USD": totalUsd == null ? null : totalUsd,
  };
}
