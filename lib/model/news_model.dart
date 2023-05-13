import 'package:flutter/material.dart';

// To parse this JSON data, do
//
//     final news = newsFromMap(jsonString);

import 'dart:convert';

NewsModel newsFromMap(String str) => NewsModel.fromMap(json.decode(str));

String newsToMap(NewsModel data) => json.encode(data.toMap());

class NewsModel {
  NewsModel({
    this.status,
    this.data,
  });

  bool? status;
  List<NewsModelList>? data;

  factory NewsModel.fromMap(Map<String, dynamic> json) => NewsModel(
    status: json["Status"] == null ? null : json["Status"],
    data: json["Data"] == null ? null : List<NewsModelList>.from(json["Data"].map((x) => NewsModelList.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "Status": status == null ? null : status,
    "Data": data == null ? null : List<dynamic>.from(data!.map((x) => x.toMap())),
  };
}

class NewsModelList {
  NewsModelList({
    this.id,
    this.title,
    this.imageVideoType,
    this.imageVideo,
    this.content,
    this.active,
    this.date,
  });

  String? id;
  String? title;
  String? imageVideoType;
  String? imageVideo;
  String? content;
  String? active;
  DateTime? date;

  factory NewsModelList.fromMap(Map<String, dynamic> json) => NewsModelList(
    id: json["id"] == null ? null : json["id"],
    title: json["title"] == null ? null : json["title"],
    imageVideoType: json["image_video_type"] == null ? null : json["image_video_type"],
    imageVideo: json["image_video"] == null ? null : json["image_video"],
    content: json["content"] == null ? null : json["content"],
    active: json["active"] == null ? null : json["active"],
    date: json["date"] == null ? null : DateTime.parse(json["date"]),
  );

  Map<String, dynamic> toMap() => {
    "id": id == null ? null : id,
    "title": title == null ? null : title,
    "image_video_type": imageVideoType == null ? null : imageVideoType,
    "image_video": imageVideo == null ? null : imageVideo,
    "content": content == null ? null : content,
    "active": active == null ? null : active,
    "date": date == null ? null : "${date?.year.toString().padLeft(4, '0')}-${date?.month.toString().padLeft(2, '0')}-${date?.day.toString().padLeft(2, '0')}",
  };
}
