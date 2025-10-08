class LoginRequestModel {
  String? phone;
  String? code;
  String? fcmToken;
  String? deviceId;
  String? platform;

  LoginRequestModel(
      {this.phone, this.code, this.fcmToken, this.deviceId, this.platform});

  LoginRequestModel.fromJson(Map<String, dynamic> json) {
    phone = json['phone'];
    code = json['code'];
    fcmToken = json['fcmToken'];
    deviceId = json['deviceId'];
    platform = json['platform'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['phone'] = this.phone;
    data['code'] = this.code;
    data['fcmToken'] = this.fcmToken;
    data['deviceId'] = this.deviceId;
    data['platform'] = this.platform;
    return data;
  }
}

