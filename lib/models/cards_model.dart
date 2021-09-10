// To parse this JSON data, do
//
//     final cards = cardsFromMap(jsonString);

import 'dart:convert';

class Cards {
    Cards({
        required this.message,
        required this.name,
        this.picture,
    });

    String message;
    String name;
    String? picture;
    String? id;

    factory Cards.fromJson(String str) => Cards.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Cards.fromMap(Map<String, dynamic> json) => Cards(
        message: json["message"],
        name: json["name"],
        picture: json["picture"],
    );

    Map<String, dynamic> toMap() => {
        "message": message,
        "name": name,
        "picture": picture,
    };
}
