// To parse this JSON data, do
//
//     final getContainerModel = getContainerModelFromMap(jsonString);

import 'dart:convert';

GetContainerModel getContainerModelFromMap(String str) =>
    GetContainerModel.fromMap(json.decode(str));

String getContainerModelToMap(GetContainerModel data) =>
    json.encode(data.toMap());

class GetContainerModel {
  GetContainerModel({
    this.status,
    this.data,
  });

  bool? status;
  List<GetContainerData>? data;

  factory GetContainerModel.fromMap(Map<String, dynamic> json) =>
      GetContainerModel(
        status: json["Status"] == null ? null : json["Status"],
        data: json["Data"] == null
            ? null
            : List<GetContainerData>.from(
                json["Data"].map((x) => GetContainerData.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "Status": status == null ? null : status,
        "Data": data == null
            ? null
            : List<dynamic>.from(data!.map((x) => x.toMap())),
      };
}

class GetContainerData {
  GetContainerData({
    this.containerNo,
  });

  String? containerNo;

  factory GetContainerData.fromMap(Map<String, dynamic> json) =>
      GetContainerData(
        containerNo: json["container_no"] == null ? null : json["container_no"],
      );

  Map<String, dynamic> toMap() => {
        "container_no": containerNo == null ? null : containerNo,
      };
}
