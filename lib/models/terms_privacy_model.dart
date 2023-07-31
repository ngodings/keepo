class TermsPrivacy {
  TermsPrivacy({
    this.id,
    this.name,
    this.description,
    this.enabled,
    this.lastEditAt,
    this.createdAt,
  });

  final String? id;
  final String? name;
  final String? description;
  final bool? enabled;
  final dynamic lastEditAt;
  final DateTime? createdAt;

  factory TermsPrivacy.fromJson(Map<String, dynamic> json) => TermsPrivacy(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        enabled: json["enabled"],
        lastEditAt: json["lastEditAt"],
        createdAt: DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "enabled": enabled,
        "lastEditAt": lastEditAt,
        "createdAt": createdAt!.toIso8601String(),
      };
}
