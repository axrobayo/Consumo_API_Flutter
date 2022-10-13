// To parse this JSON data, do
//
//     final chuck = chuckFromJson(jsonString);

import 'dart:convert';

Chuck chuckFromJson(String str) => Chuck.fromJson(json.decode(str));

String chuckToJson(Chuck data) => json.encode(data.toJson());

class Chuck {
    Chuck({
        this.createdAt,
        this.iconUrl,
        this.id,
        this.url,
        this.value,
    });

    DateTime? createdAt;
    String? iconUrl;
    String? id;
    String? url;
    String? value;

    factory Chuck.fromJson(Map<String, dynamic> json) => Chuck(
        createdAt: DateTime.parse(json["created_at"]),
        iconUrl: json["icon_url"],
        id: json["id"],
        url: json["url"],
        value: json["value"],
    );

    Map<String, dynamic> toJson() => {
        "created_at": createdAt.toString(),
        "icon_url": iconUrl,
        "id": id,
        "url": url,
        "value": value,
    };
}
