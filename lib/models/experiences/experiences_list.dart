class ExperiencesList {
  String? id;
  String? jobTitle;
  String? companyName;
  String? status;
  String? image;
  String? startDate;
  String? endDate;
  String? lastEditAt;

  ExperiencesList(
      {this.id,
      this.jobTitle,
      this.companyName,
      this.status,
      this.image,
      this.startDate,
      this.endDate,
      this.lastEditAt});

  ExperiencesList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    jobTitle = json['job_title'];
    companyName = json['company_name'];
    status = json['status'];
    image = json['image'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    lastEditAt = json['lastEditAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['job_title'] = jobTitle;
    data['company_name'] = companyName;
    data['status'] = status;
    data['image'] = image;
    data['start_date'] = startDate;
    data['end_date'] = endDate;
    data['lastEditAt'] = lastEditAt;
    return data;
  }
}
