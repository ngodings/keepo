import 'socials_model.dart';

class Settings {
  String? visiblePublic;
  String? notification;
  String? language;
  Socials? socials;

  Settings(
      {String? visiblePublic,
      String? notification,
      String? language,
      Socials? socials}) {
    if (visiblePublic != null) {
      visiblePublic = visiblePublic;
    }
    if (notification != null) {
      notification = notification;
    }
    if (language != null) {
      language = language;
    }
    if (socials != null) {
      socials = socials;
    }
  }

  Settings.fromJson(Map<String, dynamic> json) {
    visiblePublic = json['visible_public'];
    notification = json['notification'];
    language = json['language'];
    socials =
        json['socials'] != null ? Socials.fromJson(json['socials']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['visible_public'] = visiblePublic;
    data['notification'] = notification;
    data['language'] = language;
    if (socials != null) {
      data['socials'] = socials!.toJson();
    }
    return data;
  }
}
