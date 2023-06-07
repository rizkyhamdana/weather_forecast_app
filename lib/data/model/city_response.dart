// To parse this JSON data, do
//
//     final cityResponse = cityResponseFromJson(jsonString);

import 'dart:convert';

List<CityResponse> cityResponseFromJson(String str) => List<CityResponse>.from(json.decode(str).map((x) => CityResponse.fromJson(x)));

String cityResponseToJson(List<CityResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CityResponse {
  final String name;
  final Map<String, String> localNames;
  final double lat;
  final double lon;
  final String country;
  final String state;

  CityResponse({
    required this.name,
    required this.localNames,
    required this.lat,
    required this.lon,
    required this.country,
    required this.state,
  });

  factory CityResponse.fromJson(Map<String, dynamic> json) => CityResponse(
    name: json["name"],
    localNames: Map.from(json["local_names"]).map((k, v) => MapEntry<String, String>(k, v)),
    lat: json["lat"]?.toDouble(),
    lon: json["lon"]?.toDouble(),
    country: json["country"],
    state: json["state"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "local_names": Map.from(localNames).map((k, v) => MapEntry<String, dynamic>(k, v)),
    "lat": lat,
    "lon": lon,
    "country": country,
    "state": state,
  };
}
