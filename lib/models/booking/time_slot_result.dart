class TimeSlot {
  String? day;

  String? startTime;
  String? endTime;

  TimeSlot({
    this.day,
    this.startTime,
    this.endTime,
  });

  TimeSlot.fromJson(Map<String, dynamic> json) {
    day = json['day'];
    startTime = json['start_time'];
    endTime = json['end_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['day'] = day;
    data['start_time'] = startTime;
    data['end_time'] = endTime;
    return data;
  }
}

// class TimeSlot {
//   String? day;

//   List<Availability>? availability;

//   TimeSlot({
//     this.day,
//     this.availability,
//   });

//   TimeSlot.fromJson(Map<String, dynamic> json) {
//     day = json['day'];
//     availability = json['availability'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['day'] = day;
//     data['availability'] = availability;
//     return data;
//   }
// }

// class Availability {
//   String? startTime;
//   String? endTime;

//   Availability({
//     this.startTime,
//     this.endTime,
//   });

//   Availability.fromJson(Map<String, dynamic> json) {
//     startTime = json['start_time'];
//     endTime = json['end_time'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['start_time'] = startTime;
//     data['end_time'] = endTime;
//     return data;
//   }
// }
