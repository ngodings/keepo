class ImageResult {
  String? id;
  String? url;

  ImageResult({
    this.id,
    this.url,
  });

  ImageResult.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['url'] = url;
    return data;
  }
}
