import 'dart:convert';

Empty emptyFromJson(String str) => Empty.fromJson(json.decode(str));
// List<Empty> emptyFromJson(String str) => List<Empty>.from(json.decode(str).map((x) => Empty.fromJson(x)));

// List<Meme> emptyFromJson(String str) => List<Meme>.from(json.decode(str).map((x) => Meme.fromJson(x)));
String emptyToJson(Empty data) => json.encode(data.toJson());

class Empty {
  Empty({this.success, this.data});

  bool? success;
    Data? data;

  factory Empty.fromJson(Map<String, dynamic> json) => Empty(
    success: json["success"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": data!.toJson(),
  };
}

class Data {
  Data({this.memes});

  List<Meme>? memes;

  factory Data.fromJson(Map<String, dynamic> json) => Data(memes: List<Meme>.from(json["memes"].map((x) => Meme.fromJson(x))));

  Map<String, dynamic> toJson() => {
    "memes": List<dynamic>.from(memes!.map((x) => x.toJson())),
  };
}

class Meme {
  Meme({this.id, this.name, this.url, this.width, this.height, this.boxCount});

  String? id,name,url;
  int? width,height,boxCount;

  factory Meme.fromJson(Map<String, dynamic> json) => Meme(
    id: json["id"],
    name: json["name"],
    url: json["url"],
    width: json["width"],
    height: json["height"],
    boxCount: json["box_count"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "url": url,
    "width": width,
    "height": height,
    "box_count": boxCount,
  };
}
