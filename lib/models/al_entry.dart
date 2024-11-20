// To parse this JSON data, do
//
//     final alEntry = alEntryFromJson(jsonString);

import 'dart:convert';

List<AlEntry> alEntryFromJson(String str) => List<AlEntry>.from(json.decode(str).map((x) => AlEntry.fromJson(x)));

String alEntryToJson(List<AlEntry> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AlEntry {
    final String model;
    final String pk;
    final Fields fields;

    AlEntry({
        required this.model,
        required this.pk,
        required this.fields,
    });

    factory AlEntry.fromJson(Map<String, dynamic> json) => AlEntry(
        model: json["model"],
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
    );

    Map<String, dynamic> toJson() => {
        "model": model,
        "pk": pk,
        "fields": fields.toJson(),
    };
}

class Fields {
    final int user;
    final DateTime time;
    final String name;
    final int price;
    final String description;

    Fields({
        required this.user,
        required this.time,
        required this.name,
        required this.price,
        required this.description,
    });

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        user: json["user"],
        time: DateTime.parse(json["time"]),
        name: json["name"],
        price: json["price"],
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "user": user,
        "time": "${time.year.toString().padLeft(4, '0')}-${time.month.toString().padLeft(2, '0')}-${time.day.toString().padLeft(2, '0')}",
        "name": name,
        "price": price,
        "description": description,
    };
}
