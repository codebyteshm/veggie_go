class RegisterRequestModel {
  String? phone;
  String? firstName;
  String? lastName;
  String? email;
  String? role;
  String? referredByCode;

  RegisterRequestModel(
      {this.phone,
        this.firstName,
        this.lastName,
        this.email,
        this.role,
        this.referredByCode});

  RegisterRequestModel.fromJson(Map<String, dynamic> json) {
    phone = json['phone'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    role = json['role'];
    referredByCode = json['referredByCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['phone'] = this.phone;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['email'] = this.email;
    data['role'] = this.role;
    data['referredByCode'] = this.referredByCode;
    return data;
  }
}
