class GenreDM {
  GenreDM({this.genres, this.success, this.statusMessage, this.statusCode});

  GenreDM.fromJson(dynamic json) {
    if (json['genres'] != null) {
      genres = [];
      json['genres'].forEach((v) {
        genres?.add(Genre.fromJson(v));
      });
      statusCode = json['status_code'];
      statusMessage = json['status_message'];
      success = json['success'];
    }
  }

  List<Genre>? genres;
  int? statusCode;
  String? statusMessage;
  bool? success;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (genres != null) {
      map['genres'] = genres?.map((v) => v.toJson()).toList();
    }
    map['status_code'] = statusCode;
    map['status_message'] = statusMessage;
    map['success'] = success;
    return map;
  }
}

/// id : 28
/// name : "Action"

class Genre {
  Genre({
    this.id,
    this.name,
  });

  Genre.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
  }

  int? id;
  String? name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    return map;
  }
}
