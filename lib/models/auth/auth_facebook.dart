class FacebookLogin {
  int? id;
  String? name;
  String? email;
  Picture? picture;

  FacebookLogin({this.id, this.name, this.email, this.picture});

  FacebookLogin.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    picture =
        json['picture'] != null ? Picture.fromJson(json['picture']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    if (picture != null) {
      data['picture'] = picture!.toJson();
    }
    return data;
  }
}

class Picture {
  Data? data;

  Picture({this.data});

  Picture.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  // int? height;
  // String? isSilhouette;
  String? url;
  // int? width;

  Data({
    // this.height,
    // this.isSilhouette,
    this.url,
    //this.width,
  });

  Data.fromJson(Map<String, dynamic> json) {
    // height = json['height'];
    // isSilhouette = json['is_silhouette'];
    url = json['url'];
    // width = json['width'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    // data['height'] = height;
    // data['is_silhouette'] = isSilhouette;
    data['url'] = url;
    // data['width'] = width;
    return data;
  }
}
