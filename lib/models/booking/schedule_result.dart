class Schedule {
  String? id;
  String? bookingDate;
  String? bookingTime;
  String? requestedBy;
  String? status;
  String? createdAt;

  Schedule({
    this.id,
    this.bookingDate,
    this.bookingTime,
    this.requestedBy,
    this.status,
    this.createdAt,
  });

  Schedule.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bookingDate = json['booking_date'];
    bookingTime = json['booking_time'];
    requestedBy = json['requestedBy'];
    status = json['status'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['booking_date'] = bookingDate;
    data['booking_time'] = bookingTime;
    data['requestedBy'] = requestedBy;
    data['status'] = status;
    data['createdAt'] = createdAt;
    return data;
  }
}
