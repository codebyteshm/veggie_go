class UpdateUserRequestModel {
  String? firstName;
  String? id;
  String? lastName;
  String? email;
  String? phone;
  String? profileImage;

  UpdateUserRequestModel(
      {this.firstName,
        this.lastName,
        this.id,
        this.email,
        this.phone,
        this.profileImage});

  UpdateUserRequestModel.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    phone = json['phone'];
    profileImage = json['profileImage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['profileImage'] = this.profileImage;
    return data;
  }
}



class ImageUploadResponse {
  bool? status;
  String? message;
  Data? data;

  ImageUploadResponse({this.status, this.message, this.data});

  ImageUploadResponse.fromJson(Map<String, dynamic> json) {
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
  String? path;
  String? url;

  Data({this.path, this.url});

  Data.fromJson(Map<String, dynamic> json) {
    path = json['path'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['path'] = this.path;
    data['url'] = this.url;
    return data;
  }
}
