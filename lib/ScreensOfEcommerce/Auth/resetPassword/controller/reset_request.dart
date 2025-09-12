class ResetPassRequestModel {
  int? id;
  String? password;
  String? confirmPassword;

  ResetPassRequestModel({this.id, this.password, this.confirmPassword});

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = <dynamic, dynamic>{};
    data['id'] = id;
    data['password'] = password;
    data['confirmPassword'] = confirmPassword;
    return data;
  }
}
