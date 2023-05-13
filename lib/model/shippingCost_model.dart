// To parse this JSON data, do
//
//     final shippingDaildCost = shippingDaildCostFromMap(jsonString);

import 'dart:convert';

ShippingDailyCostModel shippingDaildCostFromMap(String str) => ShippingDailyCostModel.fromMap(json.decode(str));

String shippingDaildCostToMap(ShippingDailyCostModel data) => json.encode(data.toMap());

class ShippingDailyCostModel {
  ShippingDailyCostModel({
    this.status,
    this.data,
  });

  bool? status;
  List<ShippingDailyCostList>? data;

  factory ShippingDailyCostModel.fromMap(Map<String, dynamic> json) => ShippingDailyCostModel(
    status: json["Status"] == null ? null : json["Status"],
    data:List<ShippingDailyCostList>.from(json["Data"].map((x) => ShippingDailyCostList.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "Status": status == null ? null : status,
    "Data": data == null ? null : List<dynamic>.from(data!.map((x) => x.toMap())),
  };
}

class ShippingDailyCostList {
  ShippingDailyCostList({
    this.id,
    this.date,
    this.cbm,
    this.container,
    this.cbmHealthProduct,
    this.cbmCopyProduct,
    this.edate,
    this.status,
  });

  String? id;
  DateTime? date;
  String? cbm;
  String? container;
  String? cbmHealthProduct;
  String? cbmCopyProduct;
  DateTime? edate;
  String? status;

  factory ShippingDailyCostList.fromMap(Map<String, dynamic> json) => ShippingDailyCostList(
    id: json["id"] == null ? null : json["id"],
    date: json["date"] == null ? null : DateTime.parse(json["date"]),
    cbm: json["cbm"] == null ? null : json["cbm"],
    container: json["container"] == null ? null : json["container"],
    cbmHealthProduct: json["cbm_health_product"] == null ? null : json["cbm_health_product"],
    cbmCopyProduct: json["cbm_copy_product"] == null ? null : json["cbm_copy_product"],
    edate: json["edate"] == null ? null : DateTime.parse(json["edate"]),
    status: json["status"] == null ? null : json["status"],
  );

  Map<String, dynamic> toMap() => {
    "id": id == null ? null : id,
    "date": date == null ? null : "${date?.year.toString().padLeft(4, '0')}-${date?.month.toString().padLeft(2, '0')}-${date?.day.toString().padLeft(2, '0')}",
    "cbm": cbm == null ? null : cbm,
    "container": container == null ? null : container,
    "cbm_health_product": cbmHealthProduct == null ? null : cbmHealthProduct,
    "cbm_copy_product": cbmCopyProduct == null ? null : cbmCopyProduct,
    "edate": edate == null ? null : "${edate?.year.toString().padLeft(4, '0')}-${edate?.month.toString().padLeft(2, '0')}-${edate?.day.toString().padLeft(2, '0')}",
    "status": status == null ? null : status,
  };
}
