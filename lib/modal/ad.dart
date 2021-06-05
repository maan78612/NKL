class Ad {
  String itemName;
  String price;
  String description;
  Location location;
  String postedBy;
  String postedAt;
  String categoryId;
  List<String> images;

  Ad(
      {this.itemName,
      this.price,
      this.description,
      this.location,
      this.postedBy,
      this.postedAt,
      this.images});

  Ad.fromJson(dynamic json) {
    itemName = json["item_name"];
    price = json["price"];
    description = json["description"];
    location =
        json["location"] != null ? Location.fromJson(json["location"]) : null;
    postedBy = json["posted_by"];
    postedAt = json["posted_at"];
    categoryId = json["category_id"];
    images = json["images"] != null ? json["images"].cast<String>() : [];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["item_name"] = itemName;
    map["price"] = price;
    map["description"] = description;
    if (location != null) {
      map["location"] = location.toJson();
    }
    map["posted_by"] = postedBy;
    map["posted_at"] = postedAt;
    map["category_id"] = categoryId;
    map["images"] = images;
    return map;
  }
}

class Location {
  double lat;
  String lng;

  Location({this.lat, this.lng});

  Location.fromJson(dynamic json) {
    lat = json["lat"];
    lng = json["lng"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["lat"] = lat;
    map["lng"] = lng;
    return map;
  }
}
