class ProductDetailResponse {
  bool? status;
  String? message;
  Data? data;

  ProductDetailResponse({this.status, this.message, this.data});

  ProductDetailResponse.fromJson(Map<String, dynamic> json) {
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
  Product? product;

  Data({this.product});

  Data.fromJson(Map<String, dynamic> json) {
    product =
    json['product'] != null ? new Product.fromJson(json['product']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.product != null) {
      data['product'] = this.product!.toJson();
    }
    return data;
  }
}

class Product {
  String? id;
  String? name;
  String? description;
  String? imageUrl;
  String? categoryId;
  String? unit;
  bool? isActive;
  String? createdAt;
  String? updatedAt;
  Category? category;
  List<Gallery>? gallery;
  List<Variants>? variants;

  Product(
      {this.id,
        this.name,
        this.description,
        this.imageUrl,
        this.categoryId,
        this.unit,
        this.isActive,
        this.createdAt,
        this.updatedAt,
        this.category,
        this.gallery,
        this.variants});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    imageUrl = json['imageUrl'];
    categoryId = json['categoryId'];
    unit = json['unit'];
    isActive = json['isActive'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    if (json['gallery'] != null) {
      gallery = <Gallery>[];
      json['gallery'].forEach((v) {
        gallery!.add(new Gallery.fromJson(v));
      });
    }
    if (json['variants'] != null) {
      variants = <Variants>[];
      json['variants'].forEach((v) {
        variants!.add(new Variants.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['imageUrl'] = this.imageUrl;
    data['categoryId'] = this.categoryId;
    data['unit'] = this.unit;
    data['isActive'] = this.isActive;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    if (this.gallery != null) {
      data['gallery'] = this.gallery!.map((v) => v.toJson()).toList();
    }
    if (this.variants != null) {
      data['variants'] = this.variants!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Category {
  String? id;
  String? name;
  String? description;
  String? imageUrl;
  bool? isActive;
  String? createdAt;
  String? updatedAt;

  Category(
      {this.id,
        this.name,
        this.description,
        this.imageUrl,
        this.isActive,
        this.createdAt,
        this.updatedAt});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    imageUrl = json['imageUrl'];
    isActive = json['isActive'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['imageUrl'] = this.imageUrl;
    data['isActive'] = this.isActive;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}

class Gallery {
  String? id;
  String? productId;
  String? imageUrl;
  String? createdAt;

  Gallery({this.id, this.productId, this.imageUrl, this.createdAt});

  Gallery.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['productId'];
    imageUrl = json['imageUrl'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['productId'] = this.productId;
    data['imageUrl'] = this.imageUrl;
    data['createdAt'] = this.createdAt;
    return data;
  }
}

class Variants {
  String? id;
  String? productId;
  String? weight;
  int? price;
  int? salePrice;
  int? stock;
  String? sku;
  bool? isActive;
  String? createdAt;
  String? updatedAt;
  String? stockStatus;

  Variants(
      {this.id,
        this.productId,
        this.weight,
        this.price,
        this.salePrice,
        this.stock,
        this.sku,
        this.isActive,
        this.createdAt,
        this.updatedAt,
        this.stockStatus});

  Variants.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['productId'];
    weight = json['weight'];
    price = json['price'];
    salePrice = json['salePrice'];
    stock = json['stock'];
    sku = json['sku'];
    isActive = json['isActive'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    stockStatus = json['stockStatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['productId'] = this.productId;
    data['weight'] = this.weight;
    data['price'] = this.price;
    data['salePrice'] = this.salePrice;
    data['stock'] = this.stock;
    data['sku'] = this.sku;
    data['isActive'] = this.isActive;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['stockStatus'] = this.stockStatus;
    return data;
  }
}
