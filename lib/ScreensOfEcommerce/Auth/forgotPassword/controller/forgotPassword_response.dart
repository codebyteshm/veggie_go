class ForgotRespnse {
  int? status;
  String? message;
  Payload? payload;

  ForgotRespnse({this.status, this.message, this.payload});

  ForgotRespnse.fromJson(Map<String, dynamic> json) {
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
  int? id;
  int? otp;

  Payload({this.id, this.otp});

  Payload.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    otp = json['otp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['otp'] = this.otp;
    return data;
  }
}
