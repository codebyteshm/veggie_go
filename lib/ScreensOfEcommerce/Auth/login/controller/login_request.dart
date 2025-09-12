class LoginRequestModel {
  String? countryCode;
  String? phoneNumber;
  String? password;
  String deviceId;
  String deviceType;
  String pushToken;

  LoginRequestModel({
    this.countryCode,
    this.phoneNumber,
    this.password,
    required this.deviceType,
    required this.deviceId,
    required this.pushToken,
  });

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = <dynamic, dynamic>{};
    data['countryCode'] = countryCode;
    data['phoneNumber'] = phoneNumber;
    data['password'] = password;
    data['device_id'] = deviceId;
    data['device_type'] = deviceType;
    data['push_token'] = pushToken;
    return data;
  }
}
