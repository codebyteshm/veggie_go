class LoginResponse {
  int? status;
  String? message;
  Payload? payload;

  LoginResponse({this.status, this.message, this.payload});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    payload =
        json['payload'] != null ? new Payload.fromJson(json['payload']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.payload != null) {
      data['payload'] = this.payload!.toJson();
    }
    return data;
  }
}

class Payload {
  String? refreshToken;
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? role;
  String? created;
  String? updated;
  bool? isVerified;
  String? jwtToken;

  Payload(
      {this.refreshToken,
      this.id,
      this.firstName,
      this.lastName,
      this.email,
      this.role,
      this.created,
      this.updated,
      this.isVerified,
      this.jwtToken});

  Payload.fromJson(Map<String, dynamic> json) {
    refreshToken = json['refreshToken'];
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    role = json['role'];
    created = json['created'];
    updated = json['updated'];
    isVerified = json['isVerified'];
    jwtToken = json['jwtToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['refreshToken'] = this.refreshToken;
    data['id'] = this.id;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['email'] = this.email;
    data['role'] = this.role;
    data['created'] = this.created;
    data['updated'] = this.updated;
    data['isVerified'] = this.isVerified;
    data['jwtToken'] = this.jwtToken;
    return data;
  }
}
