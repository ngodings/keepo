class Default {
  AccountDef? account;
  ProfileDef? profile;

  Default({this.account, this.profile});

  Default.fromJson(Map<String, dynamic> json) {
    account =
        json['account'] != null ? AccountDef.fromJson(json['account']) : null;
    profile =
        json['profile'] != null ? ProfileDef.fromJson(json['profile']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (account != null) {
      data['account'] = account!.toJson();
    }
    if (profile != null) {
      data['profile'] = profile!.toJson();
    }
    return data;
  }
}

class AccountDef {
  String? username;
  String? id;

  AccountDef({this.username, this.id});

  AccountDef.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['username'] = username;
    data['id'] = id;
    return data;
  }
}

class ProfileDef {
  String? username;
  String? id;

  ProfileDef({this.username, this.id});

  ProfileDef.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['username'] = username;
    data['id'] = id;
    return data;
  }
}
