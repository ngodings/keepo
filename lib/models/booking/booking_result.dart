import 'dart:convert';

import 'package:keepo/models/booking/image_result.dart';
import 'package:keepo/models/booking/time_slot_result.dart';
import 'package:keepo/models/privacy/privacy_model.dart';
import 'package:keepo/models/profile/profile_details.dart';

class ServiceProduct {
  String? id;
  String? image;
  List<ImageResult>? images;
  String? name;
  String? type;
  String? price;
  String? description;
  List<String>? keywords;
  List<TimeSlot>? timeSlot;
  String? status;
  bool? deleted;
  String? lastEditAt;
  String? createdAt;
  ProfileDetails? profile;
  String? owner;
  String? ownerId;
  String? ownerThubnail;
  PrivacyModel? privacyModel;

  ServiceProduct({
    this.id,
    this.image,
    this.images,
    this.name,
    this.type,
    this.price,
    this.description,
    this.keywords,
    this.timeSlot,
    this.status,
    this.deleted,
    this.lastEditAt,
    this.createdAt,
    this.profile,
    this.owner,
    this.ownerThubnail,
    this.privacyModel,
  });

  ServiceProduct.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['images'] == null
        ? null
        : json['images'] is String
            ? json['images']
            // : json["images"].isNotEmpty
            //     ? ImageResult.fromJson(json["images"][0]).url
            : null;
    images = json['images'] == null
        ? null
        : json['images'] is String
            ? null
            : List<ImageResult>.from(
                json["images"].map((x) => ImageResult.fromJson(x)),
              );
    name = json['name'];
    type = json['type'];
    price = json['price'] is String ? json['price'] : json['price'].toString();
    description = json['description'];
    try {
      keywords = json["keywords"] == null
          ? null
          : List<String>.from(json["keywords"].map((x) => x));
    } catch (e) {
      keywords = json["keywords"] == null
          ? null
          : List<String>.from(jsonDecode(json["keywords"]).map((x) => x));
    }
    // json["keywords"] == null ? null : List<String>.from(json["keywords"]);
    try {
      timeSlot = json["time_slot"] == null
          ? null
          : List<TimeSlot>.from(
              json["time_slot"].map((x) => TimeSlot.fromJson(x)));
    } catch (e) {
      timeSlot = json["time_slot"] == null
          ? null
          : List<TimeSlot>.from(
              jsonDecode(json["time_slot"]).map((x) => TimeSlot.fromJson(x)));
    }
    status = json['status'];
    deleted = json['deleted'];
    lastEditAt = json['lastEditAt'];
    createdAt = json['createdAt'];
    // profile = json['profile'] == null
    //     ? null
    //     : ProfileDetails.fromJson(json['profile']);
    owner = json['owner'];
    ownerId = json['ownerId'];
    ownerThubnail = json['owner_thumbnail'];
    privacyModel = json['privacyModel'] == null
        ? null
        : PrivacyModel.fromJson(json['privacyModel']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['images'] = images;
    data['name'] = name;
    data['type'] = type;
    data['price'] = price;
    data['description'] = description;
    data['keywords'] = keywords;
    data['time_slot'] = timeSlot;
    data['status'] = status;
    data['deleted'] = deleted;
    data['lastEditAt'] = lastEditAt;
    data['createdAt'] = createdAt;
    data['profile'] = profile?.toJson();
    data['owner'] = owner;
    data['ownerId'] = ownerId;
    data['owner_thumbnail'] = ownerThubnail;
    data['privacyModel'] = privacyModel;
    return data;
  }
}
