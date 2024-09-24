class ProfileResponse {
  ProfileResponse({
    this.status,
    this.statusMsg,
    this.message,
    this.data,
  });

  ProfileResponse.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(UserProfile.fromJson(v));
      });
    }
  }
  String? status;
  String? statusMsg;
  String? message;
  List<UserProfile>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class UserProfile {
  UserProfile({
    this.id,
    this.name,
    this.email,
    this.avatarUrl,
    this.details,
    this.phone,
    this.city,
  });

  UserProfile.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    details = json['details'];
    phone = json['phone'];
    city = json['city'];
  }
  String? id;
  String? name;
  String? email;
  String? avatarUrl;
  String? details;
  String? phone;
  String? city;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['name'] = name;
    map['avatarUrl'] = avatarUrl;
    map['email'] = email;
    map['details'] = details;
    map['phone'] = phone;
    map['city'] = city;
    return map;
  }
}
