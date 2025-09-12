class ProductDetailsResponse {
  int? status;
  String? message;
  ProductDetailsPayload? payload;

  ProductDetailsResponse({this.status, this.message, this.payload});

  ProductDetailsResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    // payload = json['payload'] != null
    //     ? new ProductDetailsPayload.fromJson(json['payload'])
    //     : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    // if (this.payload != null) {
    //   data['payload'] = this.payload!.toJson();
    // }
    return data;
  }
}

class ProductDetailsPayload{
  String? rr;
ProductDetailsPayload({this.rr});
}
