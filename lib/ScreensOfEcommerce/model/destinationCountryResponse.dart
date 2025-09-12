class DestinationCountryResponse {
  int? status;
  String? message;
  List<Payload>? payload;

  DestinationCountryResponse({this.status, this.message, this.payload});

  DestinationCountryResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['payload'] != null) {
      payload = <Payload>[];
      json['payload'].forEach((v) {
        payload!.add(new Payload.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.payload != null) {
      data['payload'] = this.payload!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Payload {
  int? id;
  String? destinationCountryName;

  Payload({this.id, this.destinationCountryName});

  Payload.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    destinationCountryName = json['destination_country_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['destination_country_name'] = this.destinationCountryName;
    return data;
  }
}
