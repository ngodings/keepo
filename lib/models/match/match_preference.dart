import '../profile/profile_details.dart';

class MatchPreference {
  MatchPreference({
    this.gender,
    this.age,
    this.height,
    this.weight,
    this.horoscope,
    this.zodiac,
    this.race,
    this.shoeSize,
    this.chestSize,
    this.waistSize,
    this.hipSize,
    this.language,
    this.renTiers,
    this.personality,
    this.profession,
    this.interest,
    this.visitCity,
    this.currentCity,
  });

  final List<String>? gender;
  final MinMaxUnit? age;
  final MinMaxUnit? height;
  final MinMaxUnit? weight;
  final List<String>? horoscope;
  final List<String>? zodiac;
  final List<String>? race;
  final MinMaxUnit? shoeSize;
  final MinMaxUnit? chestSize;
  final MinMaxUnit? waistSize;
  final MinMaxUnit? hipSize;
  final List<String>? language;

  final List<String>? renTiers;
  final List<String>? personality;
  final List<String>? profession;
  final List<String>? interest;
  final List<VisitCity>? visitCity;
  final List<VisitCity>? currentCity;

  factory MatchPreference.fromJson(Map<String, dynamic> json) =>
      MatchPreference(
        gender: json["gender"],
        age: json["age"],
        height:
            json["height"] == null ? null : MinMaxUnit.fromJson(json['height']),
        weight:
            json["weight"] == null ? null : MinMaxUnit.fromJson(json['weight']),
        horoscope: json['horoscope'],
        zodiac: json['zodiac'],
        race: json['race'],
        shoeSize: json['shoe_size'] == null
            ? null
            : MinMaxUnit.fromJson(json['shoe_size']),
        chestSize: json['chest_size'] == null
            ? null
            : MinMaxUnit.fromJson(json['chest_size']),
        waistSize: json['waist_size'] == null
            ? null
            : MinMaxUnit.fromJson(json['waist_size']),
        hipSize: json['hip_size'] == null
            ? null
            : MinMaxUnit.fromJson(json['hip_size']),
        language: json["language"] == null
            ? null
            : List<String>.from(json["language"].map((x) => x)),
        personality: json["personality"] == null
            ? null
            : List<String>.from(json["personality"].map((x) => x)),
        profession: json["profession"] == null
            ? null
            : List<String>.from(json["profession"].map((x) => x)),
        interest: json["interest"] == null
            ? null
            : List<String>.from(json["interest"].map((x) => x)),
        visitCity: json["visit_city"] == null
            ? null
            : List<VisitCity>.from(json["visit_city"].map(
                (x) => VisitCity.fromJson(x),
              )),
        currentCity: json["current_city"] == null
            ? null
            : List<VisitCity>.from(json["current_city"].map(
                (x) => VisitCity.fromJson(x),
              )),
        renTiers: json["matching"] == null
            ? null
            : List<String>.from(json["matching"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "gender": gender,
        "age": age,
        "height": height,
        "weight": weight,
        "horoscope": horoscope,
        "zodiac": zodiac,
        "race": race,
        "shoeSize": shoeSize,
        "chestSize": chestSize,
        "waistSize": waistSize,
        "hipSize": hipSize,
        "language": language,
        "interest": interest,
        "profession": profession,
        "personality": personality,
        "visitCity": visitCity == null
            ? null
            : List<VisitCity>.from(visitCity!.map((x) => x.toJson())),
        "currentCity": currentCity == null
            ? null
            : List<VisitCity>.from(currentCity!.map((x) => x.toJson())),
        "matching": renTiers == null
            ? null
            : List<dynamic>.from(renTiers!.map((x) => x)),
      };
}

class MinMaxUnit {
  double? min;
  double? max;
  String? minUnit;
  String? maxUnit;

  MinMaxUnit({
    this.min,
    this.max,
    this.minUnit,
    this.maxUnit,
  });

  MinMaxUnit.fromJson(Map<String, dynamic> json) {
    min = json['min'];
    max = json['max'];
    minUnit = json['min_unit'];
    maxUnit = json['max_unit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['min'] = min;
    data['max'] = max;
    data['min_unit'] = minUnit;
    data['max_unit'] = maxUnit;
    return data;
  }
}
