class AllMedia {
  List<DataMedia>? media;
  List<DataMedia>? file;
  List<DataMedia>? audio;
  List<String>? link;

  AllMedia({this.media, this.file, this.audio, this.link});

  AllMedia.fromJson(Map<String, dynamic> json) {
    if (json['media'] != null) {
      media = <DataMedia>[];
      json['media'].forEach((v) {
        media!.add(DataMedia.fromJson(v));
      });
    }
    if (json['file'] != null) {
      file = <DataMedia>[];
      json['file'].forEach((v) {
        file!.add(DataMedia.fromJson(v));
      });
    }
    if (json['audio'] != null) {
      audio = <DataMedia>[];
      json['audio'].forEach((v) {
        audio!.add(DataMedia.fromJson(v));
      });
    }
    link = json['link'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (media != null) {
      data['media'] = media!.map((v) => v.toJson()).toList();
    }
    if (file != null) {
      data['file'] = file!.map((v) => v.toJson()).toList();
    }
    if (audio != null) {
      data['audio'] = audio!.map((v) => v.toJson()).toList();
    }
    data['link'] = link;
    return data;
  }
}

class DataMedia {
  String? url;
  String? size;
  String? mime;
  String? msgChat;
  DateTime? date;
  String? name;

  DataMedia({
    this.url,
    this.size,
    this.date,
    this.name,
    this.msgChat,
    this.mime,
  });

  DataMedia.fromJson(Map<String, dynamic> json) {
    url = json['file_url'];
    size = json['size'];
    date = json["date"] == null ? null : DateTime.parse(json["date"]);
    name = json['file_name'];
    mime = json['file_mime'];
    msgChat = json['msgChat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['file_url'] = url;
    data['size'] = size;
    data['date'] = date?.toIso8601String();
    data['file_name'] = name;
    data['file_mime'] = mime;
    data['msgChat'] = msgChat;
    return data;
  }
}
