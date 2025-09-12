class ForgotRequestModel {
  String? countryCode;
  String? phoneNumber;

  ForgotRequestModel({this.countryCode,this.phoneNumber});

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = <dynamic, dynamic>{};
    data['countryCode'] = countryCode;
    data['phoneNumber'] = phoneNumber;
    return data;
  }
}
