class BuyerModel {
  String? id;
  String? thumbnail;
  String? name;
  String? firstName;

  BuyerModel({
    this.id,
    this.thumbnail,
    this.name,
    this.firstName,
  });

  BuyerModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    thumbnail = json['thumbnail'];
    name = json['name'];
    firstName = json['first_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['thumbnail'] = thumbnail;
    data['name'] = name;
    data['first_name'] = firstName;
    return data;
  }
}
