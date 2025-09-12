class ContractListResponse {
  int? status;
  String? message;
  List<Payload>? payload;

  ContractListResponse({this.status, this.message, this.payload});

  ContractListResponse.fromJson(Map<String, dynamic> json) {
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
  String? contractName;

  Payload({this.id, this.contractName});

  Payload.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    contractName = json['contract_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['contract_name'] = this.contractName;
    return data;
  }
}
