class DestinationPortResponse {
  int? status;
  String? message;
  List<Payload>? payload;

  DestinationPortResponse({this.status, this.message, this.payload});

  DestinationPortResponse.fromJson(Map<String, dynamic> json) {
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
  String? destinationPortName;
  int? destinationCountryId;

  Payload({this.id, this.destinationPortName, this.destinationCountryId});

  Payload.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    destinationPortName = json['destination_port_name'];
    destinationCountryId = json['destination_country_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['destination_port_name'] = this.destinationPortName;
    data['destination_country_id'] = this.destinationCountryId;
    return data;
  }
}
