class PrivacyModel {
  String? id;
  String? type;
  List<String>? interest;
  List<String>? profession;
  List<String>? personality;
  List<String>? visitCity;
  List<String>? language;
  List<String>? renTier;
  List<String>? gender;
  List<String>? race;
  List<String>? horoscope;
  List<String>? zodiac;
  List<String>? currentCity;
  bool? withPictures;
  Item? age;
  Item? height;
  Item? weight;
  ShoeSize? shoeSize;
  Item? waistSize;
  Item? hipSize;
  ChestSize? chestSize;
  String? lastEditAt;
  String? createdAt;

  PrivacyModel(
      {this.id,
      this.type,
      this.interest,
      this.profession,
      this.personality,
      this.visitCity,
      this.language,
      this.renTier,
      this.gender,
      this.race,
      this.horoscope,
      this.zodiac,
      this.currentCity,
      this.withPictures,
      this.age,
      this.height,
      this.weight,
      this.shoeSize,
      this.waistSize,
      this.hipSize,
      this.chestSize,
      this.lastEditAt,
      this.createdAt});

  PrivacyModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    interest = json["interest"] == null
        ? null
        : List<String>.from(json["interest"].map((x) => x));
    profession = json["profession"] == null
        ? null
        : List<String>.from(json["profession"].map((x) => x));
    personality = json["personality"] == null
        ? null
        : List<String>.from(json["personality"].map((x) => x));
    visitCity = json["visit_city"] == null
        ? null
        : List<String>.from(json["visit_city"].map((x) => x));
    language = json["language"] == null
        ? null
        : List<String>.from(json["language"].map((x) => x));
    renTier = json["ren_tier"] == null
        ? null
        : List<String>.from(json["ren_tier"].map((x) => x));
    gender = json["gender"] == null
        ? null
        : List<String>.from(json["gender"].map((x) => x));
    race = json["race"] == null
        ? null
        : List<String>.from(json["race"].map((x) => x));
    horoscope = json["horoscrope"] == null
        ? null
        : List<String>.from(json["horoscrope"].map((x) => x));
    zodiac = json["zodiac"] == null
        ? null
        : List<String>.from(json["zodiac"].map((x) => x));
    currentCity = json["current_city"] == null
        ? null
        : List<String>.from(json["current_city"].map((x) => x));
    withPictures = json['with_pictures'];
    age = json['age'] != null ? Item.fromJson(json['age']) : null;
    height = json['height'] != null ? Item.fromJson(json['height']) : null;
    weight = json['weight'] != null ? Item.fromJson(json['weight']) : null;
    shoeSize =
        json['shoe_size'] != null ? ShoeSize.fromJson(json['shoe_size']) : null;
    waistSize =
        json['waist_size'] != null ? Item.fromJson(json['waist_size']) : null;
    hipSize = json['hip_size'] != null ? Item.fromJson(json['hip_size']) : null;
    chestSize = json['chest_size'] != null
        ? ChestSize.fromJson(json['chest_size'])
        : null;
    lastEditAt = json['lastEditAt'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['type'] = type;
    data['interest'] = interest;
    data['profession'] = profession;
    data['personality'] = personality;
    data['visit_city'] = visitCity;
    data['language'] = language;
    data['ren_tier'] = renTier;
    data['gender'] = gender;
    data['race'] = race;
    data['horoscope'] = horoscope;
    data['zodiac'] = zodiac;
    data['current_city'] = currentCity;
    data['with_pictures'] = withPictures;
    if (age != null) {
      data['age'] = age!.toJson();
    }
    if (height != null) {
      data['height'] = height!.toJson();
    }
    if (weight != null) {
      data['weight'] = weight!.toJson();
    }
    if (shoeSize != null) {
      data['shoe_size'] = shoeSize!.toJson();
    }
    if (waistSize != null) {
      data['waist_size'] = waistSize!.toJson();
    }
    if (hipSize != null) {
      data['hip_size'] = hipSize!.toJson();
    }
    if (chestSize != null) {
      data['chest_size'] = chestSize!.toJson();
    }
    data['lastEditAt'] = lastEditAt;
    data['createdAt'] = createdAt;
    return data;
  }
}

class Item {
  double? min;
  double? max;

  Item({this.min, this.max});

  Item.fromJson(Map<String, dynamic> json) {
    min = json['min'] is double ? json['min'] : json['min']?.toDouble();
    max = json['max'] is double ? json['max'] : json['max']?.toDouble();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['min'] = min;
    data['max'] = max;
    return data;
  }
}

class ShoeSize {
  String? unit;
  double? min;
  double? max;

  ShoeSize({this.unit, this.min, this.max});

  ShoeSize.fromJson(Map<String, dynamic> json) {
    unit = json['unit'];
    min = json['min'] is double ? json['min'] : json['min']?.toDouble();
    max = json['max'] is double ? json['max'] : json['max']?.toDouble();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['unit'] = unit;
    data['min'] = min;
    data['max'] = max;
    return data;
  }
}

class ChestSize {
  String? minUnit;
  String? maxUnit;
  int? min;
  int? max;

  ChestSize({this.minUnit, this.maxUnit, this.min, this.max});

  ChestSize.fromJson(Map<String, dynamic> json) {
    minUnit = json['min_unit'];
    maxUnit = json['max_unit'];
    min = json['min'];
    max = json['max'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['min_unit'] = minUnit;
    data['max_unit'] = maxUnit;
    data['min'] = min;
    data['max'] = max;
    return data;
  }
}

class ResetPrivacyModel {
  String? id;
  String? type;
  List<String>? interest;
  List<String>? profession;
  List<String>? personality;
  List<String>? visitCity;
  List<String>? language;
  List<String>? renTier;
  List<String>? gender;
  List<String>? race;
  List<String>? horoscope;
  List<String>? zodiac;
  List<String>? currentCity;
  bool? withPictures;
  Object? age;
  Object? height;
  Object? weight;
  Object? shoeSize;
  Object? waistSize;
  Object? hipSize;
  Object? chestSize;
  String? lastEditAt;
  String? createdAt;

  ResetPrivacyModel(
      {this.id,
      this.type,
      this.interest,
      this.profession,
      this.personality,
      this.visitCity,
      this.language,
      this.renTier,
      this.gender,
      this.race,
      this.horoscope,
      this.zodiac,
      this.currentCity,
      this.withPictures,
      this.age,
      this.height,
      this.weight,
      this.shoeSize,
      this.waistSize,
      this.hipSize,
      this.chestSize,
      this.lastEditAt,
      this.createdAt});
}
