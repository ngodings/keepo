class Company {
  String? permit;
  String? partner;
  String? partnerSelfie;
  String? directors;
  String? letterOfRepresent;

  Company(
      {this.permit,
      this.partner,
      this.partnerSelfie,
      this.directors,
      this.letterOfRepresent});

  Company.fromJson(Map<String, dynamic> json) {
    permit = json['permit'];
    partner = json['partner'];
    partnerSelfie = json['partner_selfie'];
    directors = json['directors'];
    letterOfRepresent = json['letter_of_represent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['permit'] = permit;
    data['partner'] = partner;
    data['partner_selfie'] = partnerSelfie;
    data['directors'] = directors;
    data['letter_of_represent'] = letterOfRepresent;
    return data;
  }
}
