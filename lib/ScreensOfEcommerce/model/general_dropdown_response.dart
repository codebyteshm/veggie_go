class GeneralDropdownResponse {
  int? status;
  String? message;
  Payload? payload;

  GeneralDropdownResponse({this.status, this.message, this.payload});

  GeneralDropdownResponse.fromJson(Map<String, dynamic> json) {
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
  List<BusinessDomain>? businessDomain;
  List<BusinessType>? businessType;
  List<BusinessCategory>? businessCategory;
  List<BusinessSubCategory>? businessSubCategory;
  List<Countries>? countries;
  List<ChildCategory>? childCategory;
  List<Seller>? seller;
  List<Brands>? brands;

  Payload(
      {this.businessDomain,
      this.businessType,
      this.businessCategory,
      this.businessSubCategory,
      this.countries,
      this.childCategory,
      this.seller,
      this.brands});

  Payload.fromJson(Map<String, dynamic> json) {
    if (json['business_domain'] != null) {
      businessDomain = <BusinessDomain>[];
      json['business_domain'].forEach((v) {
        businessDomain!.add(new BusinessDomain.fromJson(v));
      });
    }
    if (json['business_type'] != null) {
      businessType = <BusinessType>[];
      json['business_type'].forEach((v) {
        businessType!.add(new BusinessType.fromJson(v));
      });
    }
    if (json['business_category'] != null) {
      businessCategory = <BusinessCategory>[];
      json['business_category'].forEach((v) {
        businessCategory!.add(new BusinessCategory.fromJson(v));
      });
    }
    if (json['business_sub_category'] != null) {
      businessSubCategory = <BusinessSubCategory>[];
      json['business_sub_category'].forEach((v) {
        businessSubCategory!.add(new BusinessSubCategory.fromJson(v));
      });
    }
    if (json['countries'] != null) {
      countries = <Countries>[];
      json['countries'].forEach((v) {
        countries!.add(new Countries.fromJson(v));
      });
    }
    if (json['childCategory'] != null) {
      childCategory = <ChildCategory>[];
      json['childCategory'].forEach((v) {
        childCategory!.add(new ChildCategory.fromJson(v));
      });
    }
    if (json['seller'] != null) {
      seller = <Seller>[];
      json['seller'].forEach((v) {
        seller!.add(new Seller.fromJson(v));
      });
    }
    if (json['brands'] != null) {
      brands = <Brands>[];
      json['brands'].forEach((v) {
        brands!.add(new Brands.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.businessDomain != null) {
      data['business_domain'] =
          this.businessDomain!.map((v) => v.toJson()).toList();
    }
    if (this.businessType != null) {
      data['business_type'] =
          this.businessType!.map((v) => v.toJson()).toList();
    }
    if (this.businessCategory != null) {
      data['business_category'] =
          this.businessCategory!.map((v) => v.toJson()).toList();
    }
    if (this.businessSubCategory != null) {
      data['business_sub_category'] =
          this.businessSubCategory!.map((v) => v.toJson()).toList();
    }
    if (this.countries != null) {
      data['countries'] = this.countries!.map((v) => v.toJson()).toList();
    }
    if (this.childCategory != null) {
      data['childCategory'] =
          this.childCategory!.map((v) => v.toJson()).toList();
    }
    if (this.seller != null) {
      data['seller'] = this.seller!.map((v) => v.toJson()).toList();
    }
    if (this.brands != null) {
      data['brands'] = this.brands!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BusinessDomain {
  int? id;
  String? businessDomain;
  String? status;
  List<BusinessTypes>? businessTypes;
  // Null? created;
  // Null? updated;

  BusinessDomain(
      {this.id, this.businessDomain, this.status, this.businessTypes});

  BusinessDomain.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    businessDomain = json['business_domain'];
    status = json['status'];
    if (json['business_types'] != null) {
      businessTypes = <BusinessTypes>[];
      json['business_types'].forEach((v) {
        businessTypes!.add(new BusinessTypes.fromJson(v));
      });
    }
    // created = json['created'];
    // updated = json['updated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['business_domain'] = this.businessDomain;
    data['status'] = this.status;
    if (this.businessTypes != null) {
      data['business_types'] =
          this.businessTypes!.map((v) => v.toJson()).toList();
    }
    // data['created'] = this.created;
    // data['updated'] = this.updated;
    return data;
  }
}

class BusinessTypes {
  int? id;
  String? businessType;
  String? status;
  // Null? created;
  // Null? updated;
  int? businessDomainId;

  BusinessTypes(
      {this.id,
      this.businessType,
      this.status,
      // this.created,
      // this.updated,
      this.businessDomainId});

  BusinessTypes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    businessType = json['business_type'];
    status = json['status'];
    // created = json['created'];
    // updated = json['updated'];
    businessDomainId = json['business_domain_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['business_type'] = this.businessType;
    data['status'] = this.status;
    // data['created'] = this.created;
    // data['updated'] = this.updated;
    data['business_domain_id'] = this.businessDomainId;
    return data;
  }
}

class BusinessType {
  int? id;
  String? businessType;
  String? status;

  // Null? created;
  // Null? updated;
  int? businessDomainId;
  BusinessDomain? businessDomain;

  BusinessType(
      {this.id,
      this.businessType,
      this.status,
      // this.created,
      // this.updated,
      this.businessDomainId,
      this.businessDomain});

  BusinessType.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    businessType = json['business_type'];
    status = json['status'];
    // created = json['created'];
    // updated = json['updated'];
    businessDomainId = json['business_domain_id'];
    businessDomain = json['business_domain'] != null
        ? new BusinessDomain.fromJson(json['business_domain'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['business_type'] = this.businessType;
    data['status'] = this.status;
    // data['created'] = this.created;
    // data['updated'] = this.updated;
    data['business_domain_id'] = this.businessDomainId;
    if (this.businessDomain != null) {
      data['business_domain'] = this.businessDomain!.toJson();
    }
    return data;
  }
}

class BusinessCategory {
  int? id;
  String? businessCatogory;
  String? status;
  dynamic categoryImg;

  // Null? created;
  // Null? updated;
  File? file;

  BusinessCategory(
      {this.id,
      this.businessCatogory,
      this.status,
      this.categoryImg,
      // this.created,
      // this.updated,
      this.file});

  BusinessCategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    businessCatogory = json['business_catogory'];
    status = json['status'];
    categoryImg = json['category_img'];
    // created = json['created'];
    // updated = json['updated'];
    file = json['file'] != null ? new File.fromJson(json['file']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['business_catogory'] = this.businessCatogory;
    data['status'] = this.status;
    data['category_img'] = this.categoryImg;
    // data['created'] = this.created;
    // data['updated'] = this.updated;
    if (this.file != null) {
      data['file'] = this.file!.toJson();
    }
    return data;
  }
}

class File {
  String? slug;
  int? id;

  File({this.slug, this.id});

  File.fromJson(Map<String, dynamic> json) {
    slug = json['slug'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['slug'] = this.slug;
    data['id'] = this.id;
    return data;
  }
}

class BusinessSubCategory {
  int? id;
  String? businessSubCatogory;
  String? status;

  // Null? created;
  // Null? updated;
  int? businessCategoryId;
  BusinessCategory1? businessCategory;

  BusinessSubCategory(
      {this.id,
      this.businessSubCatogory,
      this.status,
      // this.created,
      // this.updated,
      this.businessCategoryId,
      this.businessCategory});

  BusinessSubCategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    businessSubCatogory = json['business_sub_catogory'];
    status = json['status'];
    // created = json['created'];
    // updated = json['updated'];
    businessCategoryId = json['business_category_id'];
    businessCategory = json['business_category'] != null
        ? new BusinessCategory1.fromJson(json['business_category'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['business_sub_catogory'] = this.businessSubCatogory;
    data['status'] = this.status;
    // data['created'] = this.created;
    // data['updated'] = this.updated;
    data['business_category_id'] = this.businessCategoryId;
    if (this.businessCategory != null) {
      data['business_category'] = this.businessCategory!.toJson();
    }
    return data;
  }
}

class BusinessCategory1 {
  int? id;
  String? businessCatogory;
  String? status;
  dynamic categoryImg;

  // Null? created;
  // Null? updated;

  BusinessCategory1({
    this.id,
    this.businessCatogory,
    this.status,
    this.categoryImg,
  });

  BusinessCategory1.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    businessCatogory = json['business_catogory'];
    status = json['status'];
    categoryImg = json['category_img'];
    // created = json['created'];
    // updated = json['updated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['business_catogory'] = this.businessCatogory;
    data['status'] = this.status;
    data['category_img'] = this.categoryImg;
    // data['created'] = this.created;
    // data['updated'] = this.updated;
    return data;
  }
}

class Countries {
  CountryObj? country;

  Countries({this.country});

  Countries.fromJson(Map<String, dynamic> json) {
    country = json['Country'] != null
        ? new CountryObj.fromJson(json['Country'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.country != null) {
      data['Country'] = this.country!.toJson();
    }
    return data;
  }
}

class CountryObj {
  int? id;
  String? name;
  String? currency;
  String? isoCode;
  File? file;

  CountryObj({this.id, this.name, this.currency, this.isoCode, this.file});

  CountryObj.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    currency = json['currency'];
    isoCode = json['iso_code'];
    file = json['file'] != null ? new File.fromJson(json['file']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['currency'] = this.currency;
    data['iso_code'] = this.isoCode;
    if (this.file != null) {
      data['file'] = this.file!.toJson();
    }
    return data;
  }
}

class ChildCategory {
  int? id;
  String? businessChildCatogory;
  int? businessSubCategoryId;
  int? businessCategoryId;
  String? businessSubCatogory;
  String? businessCatogory;

  ChildCategory(
      {this.id,
      this.businessChildCatogory,
      this.businessSubCategoryId,
      this.businessCategoryId,
      this.businessSubCatogory,
      this.businessCatogory});

  ChildCategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    businessChildCatogory = json['business_child_catogory'];
    businessSubCategoryId = json['business_sub_category_id'];
    businessCategoryId = json['business_category_id'];
    businessSubCatogory = json['business_sub_catogory'];
    businessCatogory = json['business_catogory'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['business_child_catogory'] = this.businessChildCatogory;
    data['business_sub_category_id'] = this.businessSubCategoryId;
    data['business_category_id'] = this.businessCategoryId;
    data['business_sub_catogory'] = this.businessSubCatogory;
    data['business_catogory'] = this.businessCatogory;
    return data;
  }
}

class Seller {
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  dynamic profileImgID;
  String? role;
  File? file;

  Seller(
      {this.id,
      this.firstName,
      this.lastName,
      this.email,
      this.profileImgID,
      this.role,
      this.file});

  Seller.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    profileImgID = json['profile_img_ID'];
    role = json['role'];
    file = json['file'] != null ? new File.fromJson(json['file']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['email'] = this.email;
    data['profile_img_ID'] = this.profileImgID;
    data['role'] = this.role;
    if (this.file != null) {
      data['file'] = this.file!.toJson();
    }
    return data;
  }
}

class Brands {
  int? id;
  String? name;
  dynamic brandImgId;
  File? file;

  Brands({this.id, this.name, this.brandImgId, this.file});

  Brands.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    brandImgId = json['brand_img_id'];
    file = json['file'] != null ? new File.fromJson(json['file']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['brand_img_id'] = this.brandImgId;
    if (this.file != null) {
      data['file'] = this.file!.toJson();
    }
    return data;
  }
}
