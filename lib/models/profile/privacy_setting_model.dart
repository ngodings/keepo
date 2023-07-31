import 'dart:convert';

List<PrivacySetting> privacySettingFromJson(String str) =>
    List<PrivacySetting>.from(
        json.decode(str).map((x) => PrivacySetting.fromJson(x)));

String privacySettingToJson(List<PrivacySetting> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PrivacySetting {
  PrivacySetting({
    this.name,
    this.selected,
    this.contactAllow,
    this.contactNever,
  });

  final String? name;
  final String? selected;

  final List<dynamic>? contactAllow;
  final List<dynamic>? contactNever;

  factory PrivacySetting.fromJson(Map<String, dynamic> json) => PrivacySetting(
        name: json["name"],
        selected: json["selected"],
        contactAllow: List<dynamic>.from(json["contact_allow"].map((x) => x)),
        contactNever: List<dynamic>.from(json["contact_never"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "selected": selected,
        "contact_allow": List<dynamic>.from(contactAllow!.map((x) => x)),
        "contact_never": List<dynamic>.from(contactNever!.map((x) => x)),
      };
}

class KeywordPrivacySetting {
  KeywordPrivacySetting(
      {this.name,
      this.selected,
      this.contactAllow,
      this.contactNever,
      this.title});

  final String? name;
  final String? selected;
  final List<dynamic>? contactAllow;
  final List<dynamic>? contactNever;
  final String? title;

  factory KeywordPrivacySetting.fromJson(Map<String, dynamic> json) =>
      KeywordPrivacySetting(
        name: json["name"],
        selected: json["selected"],
        contactAllow: List<dynamic>.from(json["contact_allow"].map((x) => x)),
        contactNever: List<dynamic>.from(json["contact_never"].map((x) => x)),
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "selected": selected,
        "contact_allow": List<dynamic>.from(contactAllow!.map((x) => x)),
        "contact_never": List<dynamic>.from(contactNever!.map((x) => x)),
        "title": title
      };
}
