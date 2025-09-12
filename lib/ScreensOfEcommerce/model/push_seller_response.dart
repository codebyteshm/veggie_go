class PushSellerDetailsResponse {
  String? firstName;
  String? lastName;
  File? file;
  int? id;

  PushSellerDetailsResponse(
      {this.firstName, this.lastName, this.file, this.id});

  PushSellerDetailsResponse.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    file = json['file'] != null ? new File.fromJson(json['file']) : null;
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    if (this.file != null) {
      data['file'] = this.file!.toJson();
    }
    data['id'] = this.id;
    return data;
  }
}

class File {
  String? fileName;
  int? id;
  String? slug;
  String? uploadDate;

  File({this.fileName, this.id, this.slug, this.uploadDate});

  File.fromJson(Map<String, dynamic> json) {
    fileName = json['file_name'];
    id = json['id'];
    slug = json['slug'];
    uploadDate = json['upload_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['file_name'] = this.fileName;
    data['id'] = this.id;
    data['slug'] = this.slug;
    data['upload_date'] = this.uploadDate;
    return data;
  }
}