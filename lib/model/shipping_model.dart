// To parse this JSON data, do
//
//     final shippingModel = shippingModelFromMap(jsonString);

import 'dart:convert';

ShippingModel shippingModelFromMap(String str) =>
    ShippingModel.fromMap(json.decode(str));

String shippingModelToMap(ShippingModel data) => json.encode(data.toMap());

class ShippingModel {
  ShippingModel({
    this.status,
    this.message,
    this.data,
  });

  String? status;
  String? message;
  Data? data;

  factory ShippingModel.fromMap(Map<String, dynamic> json) => ShippingModel(
        status: json["status"] == null ? null : json["status"],
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null ? null : Data.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "status": status == null ? null : status,
        "message": message == null ? null : message,
        "data": data == null ? null : data!.toMap(),
      };
}

class Data {
  Data({
    this.locations,
    this.route,
    this.vessels,
    this.container,
  });

  List<Location>? locations;
  Route? route;
  List<Vessel>? vessels;
  ContainerModel? container;

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        locations: json["locations"] == null
            ? null
            : List<Location>.from(
                json["locations"].map((x) => Location.fromMap(x))),
        route: json["route"] == null ? null : Route.fromMap(json["route"]),
        vessels: json["vessels"] == null
            ? null
            : List<Vessel>.from(json["vessels"].map((x) => Vessel.fromMap(x))),
        container: json["container"] == null
            ? null
            : ContainerModel.fromMap(json["container"]),
      );

  Map<String, dynamic> toMap() => {
        "locations": locations == null
            ? null
            : List<dynamic>.from(locations!.map((x) => x.toMap())),
        "route": route == null ? null : route?.toMap(),
        "vessels": vessels == null
            ? null
            : List<dynamic>.from(vessels!.map((x) => x.toMap())),
        "container": container == null ? null : container?.toMap(),
      };
}

class ContainerModel {
  ContainerModel({
    this.number,
    this.isoCode,
    this.events,
  });

  String? number;
  String? isoCode;
  List<Event>? events;

  factory ContainerModel.fromMap(Map<String, dynamic> json) => ContainerModel(
        number: json["number"] == null ? null : json["number"],
        isoCode: json["iso_code"] == null ? null : json["iso_code"],
        events: json["events"] == null
            ? null
            : List<Event>.from(json["events"].map((x) => Event.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "number": number == null ? null : number,
        "iso_code": isoCode == null ? null : isoCode,
        "events": events == null
            ? null
            : List<dynamic>.from(events!.map((x) => x.toMap())),
      };
}

class Event {
  Event({
    this.location,
    this.description,
    this.status,
    this.date,
    this.actual,
    this.type,
    this.vessel,
    this.voyage,
  });

  int? location;
  String? description;
  String? status;
  DateTime? date;
  bool? actual;
  String? type;
  int? vessel;
  String? voyage;

  factory Event.fromMap(Map<String, dynamic> json) => Event(
        location: json["location"] == null ? null : json["location"],
        description: json["description"] == null ? null : json["description"],
        status: json["status"] == null ? null : json["status"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        actual: json["actual"] == null ? null : json["actual"],
        type: json["type"] == null ? null : json["type"],
        vessel: json["vessel"] == null ? null : json["vessel"],
        voyage: json["voyage"] == null ? null : json["voyage"],
      );

  Map<String, dynamic> toMap() => {
        "location": location == null ? null : location,
        "description": description == null ? null : description,
        "status": status == null ? null : status,
        "date": date == null ? null : date?.toIso8601String(),
        "actual": actual == null ? null : actual,
        "type": type == null ? null : type,
        "vessel": vessel == null ? null : vessel,
        "voyage": voyage == null ? null : voyage,
      };
}

class Location {
  Location({
    this.id,
    this.name,
    this.state,
    this.country,
    this.countryCode,
    this.locode,
    this.lat,
    this.lng,
  });

  int? id;
  String? name;
  String? state;
  String? country;
  String? countryCode;
  String? locode;
  double? lat;
  double? lng;

  factory Location.fromMap(Map<String, dynamic> json) => Location(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        state: json["state"] == null ? null : json["state"],
        country: json["country"] == null ? null : json["country"],
        countryCode: json["country_code"] == null ? null : json["country_code"],
        locode: json["locode"] == null ? null : json["locode"],
        lat: json["lat"] == null ? null : json["lat"].toDouble(),
        lng: json["lng"] == null ? null : json["lng"].toDouble(),
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "state": state == null ? null : state,
        "country": country == null ? null : country,
        "country_code": countryCode == null ? null : countryCode,
        "locode": locode == null ? null : locode,
        "lat": lat == null ? null : lat,
        "lng": lng == null ? null : lng,
      };
}

class Route {
  Route({
    this.prepol,
    this.pol,
    this.pod,
    this.postpod,
  });

  Pod? prepol;
  Pod? pol;
  Pod? pod;
  Pod? postpod;

  factory Route.fromMap(Map<String, dynamic> json) => Route(
        prepol: json["prepol"] == null ? null : Pod.fromMap(json["prepol"]),
        pol: json["pol"] == null ? null : Pod.fromMap(json["pol"]),
        pod: json["pod"] == null ? null : Pod.fromMap(json["pod"]),
        postpod: json["postpod"] == null ? null : Pod.fromMap(json["postpod"]),
      );

  Map<String, dynamic> toMap() => {
        "prepol": prepol == null ? null : prepol?.toMap(),
        "pol": pol == null ? null : pol?.toMap(),
        "pod": pod == null ? null : pod?.toMap(),
        "postpod": postpod == null ? null : postpod?.toMap(),
      };
}

class Pod {
  Pod({
    this.location,
    this.date,
    this.actual,
  });

  int? location;
  DateTime? date;
  bool? actual;

  factory Pod.fromMap(Map<String, dynamic> json) => Pod(
        location: json["location"] == null ? null : json["location"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        actual: json["actual"] == null ? null : json["actual"],
      );

  Map<String, dynamic> toMap() => {
        "location": location == null ? null : location,
        "date": date == null ? null : date?.toIso8601String(),
        "actual": actual == null ? null : actual,
      };
}

class Vessel {
  Vessel({
    this.id,
    this.name,
    this.imo,
    this.callSign,
    this.mmsi,
    this.flag,
  });

  int? id;
  String? name;
  int? imo;
  String? callSign;
  int? mmsi;
  String? flag;

  factory Vessel.fromMap(Map<String, dynamic> json) => Vessel(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        imo: json["imo"] == null ? null : json["imo"],
        callSign: json["call_sign"] == null ? null : json["call_sign"],
        mmsi: json["mmsi"] == null ? null : json["mmsi"],
        flag: json["flag"] == null ? null : json["flag"],
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "imo": imo == null ? null : imo,
        "call_sign": callSign == null ? null : callSign,
        "mmsi": mmsi == null ? null : mmsi,
        "flag": flag == null ? null : flag,
      };
}
