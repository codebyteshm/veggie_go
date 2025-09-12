class UploadDocumentResponse {
  int? status;
  String? message;
  Payload? payload;

  UploadDocumentResponse({this.status, this.message, this.payload});

  UploadDocumentResponse.fromJson(Map<String, dynamic> json) {
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
  int? fileId;

  Payload({this.fileId});

  Payload.fromJson(Map<String, dynamic> json) {
    fileId = json['fileId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fileId'] = this.fileId;
    return data;
  }
}
