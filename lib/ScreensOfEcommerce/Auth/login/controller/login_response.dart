class LoginResponse {
  bool? status;
  String? message;
  Data? data;

  LoginResponse({this.status, this.message, this.data});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? token;
  User? user;

  Data({this.token, this.user});

  Data.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  String? id;
  String? phone;
  String? firstName;
  String? lastName;
  String? email;
  int? loginCount;
  String? profileImage;
  String? referredByCode;
  String? referralCode;
  String? role;
  String? fcmToken;
  String? deviceId;
  String? platform;
  bool? isActive;
  bool? isVerified;
  String? createdAt;
  String? updatedAt;

  User(
      {this.id,
        this.phone,
        this.firstName,
        this.lastName,
        this.email,
        this.loginCount,
        this.profileImage,
        this.referredByCode,
        this.referralCode,
        this.role,
        this.fcmToken,
        this.deviceId,
        this.platform,
        this.isActive,
        this.isVerified,
        this.createdAt,
        this.updatedAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    phone = json['phone'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    loginCount = json['loginCount'];
    profileImage = json['profileImage'];
    referredByCode = json['referredByCode'];
    referralCode = json['referralCode'];
    role = json['role'];
    fcmToken = json['fcmToken'];
    deviceId = json['deviceId'];
    platform = json['platform'];
    isActive = json['isActive'];
    isVerified = json['isVerified'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['phone'] = this.phone;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['email'] = this.email;
    data['loginCount'] = this.loginCount;
    data['profileImage'] = this.profileImage;
    data['referredByCode'] = this.referredByCode;
    data['referralCode'] = this.referralCode;
    data['role'] = this.role;
    data['fcmToken'] = this.fcmToken;
    data['deviceId'] = this.deviceId;
    data['platform'] = this.platform;
    data['isActive'] = this.isActive;
    data['isVerified'] = this.isVerified;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}



class SendOtpModelResponse {
  bool? status;
  String? message;
  OtpData? data;

  SendOtpModelResponse({this.status, this.message, this.data});

  SendOtpModelResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new OtpData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class OtpData {
  String? otp;

  OtpData({this.otp});

  OtpData.fromJson(Map<String, dynamic> json) {
    otp = json['otp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['otp'] = this.otp;
    return data;
  }
}
