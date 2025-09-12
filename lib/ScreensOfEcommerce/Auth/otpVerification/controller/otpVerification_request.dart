class OtpRequestModel {
  String? otp;


  OtpRequestModel({this.otp});

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = <dynamic, dynamic>{};
    data['otp'] = otp;

    return data;
  }
}
