// class LoginResponse {
//   String? id;
//   String? title;
//   String? firstName;
//   String? lastName;
//   String? userName;
//   String? countryCode;
//   String? phoneNumber;
//   String? zipCode;
//   String? role;
//   String? created;
//   bool? isVerified;
//   String? jwtToken;
//
//   LoginResponse(
//       {this.id,
//         this.title,
//         this.firstName,
//         this.lastName,
//         this.userName,
//         this.countryCode,
//         this.phoneNumber,
//         this.zipCode,
//         this.role,
//         this.created,
//         this.isVerified,
//         this.jwtToken});
//
//   LoginResponse.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     title = json['title'];
//     firstName = json['firstName'];
//     lastName = json['lastName'];
//     userName = json['userName'];
//     countryCode = json['countryCode'];
//     phoneNumber = json['phoneNumber'];
//     zipCode = json['zipCode'];
//     role = json['role'];
//     created = json['created'];
//     isVerified = json['isVerified'];
//     jwtToken = json['jwtToken'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['title'] = this.title;
//     data['firstName'] = this.firstName;
//     data['lastName'] = this.lastName;
//     data['userName'] = this.userName;
//     data['countryCode'] = this.countryCode;
//     data['phoneNumber'] = this.phoneNumber;
//     data['zipCode'] = this.zipCode;
//     data['role'] = this.role;
//     data['created'] = this.created;
//     data['isVerified'] = this.isVerified;
//     data['jwtToken'] = this.jwtToken;
//     return data;
//   }
// }