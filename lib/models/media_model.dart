class MediaModel {
  String? name;
  String? url;
  int? size;
  String? mimeType;

  MediaModel({this.name, this.url});

  MediaModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
    size = json['size'];
    mimeType = json['mimeType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['url'] = url;
    data['size'] = size;
    data['mimeType'] = mimeType;
    return data;
  }
}
