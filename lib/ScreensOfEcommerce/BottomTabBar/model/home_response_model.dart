class HomeResponseModel {
  bool? status;
  String? message;
  Data? data;

  HomeResponseModel({this.status, this.message, this.data});

  HomeResponseModel.fromJson(Map<String, dynamic> json) {
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
  List<String>? bannerImage;
  List<Categories>? categories;
  List<BestSellingProducts>? bestSellingProducts;

  Data({this.bannerImage, this.categories, this.bestSellingProducts});

  Data.fromJson(Map<String, dynamic> json) {
    bannerImage = json['bannerImage'].cast<String>();
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(new Categories.fromJson(v));
      });
    }
    if (json['bestSellingProducts'] != null) {
      bestSellingProducts = <BestSellingProducts>[];
      json['bestSellingProducts'].forEach((v) {
        bestSellingProducts!.add(new BestSellingProducts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['bannerImage'] = this.bannerImage;
    if (this.categories != null) {
      data['categories'] = this.categories!.map((v) => v.toJson()).toList();
    }
    if (this.bestSellingProducts != null) {
      data['bestSellingProducts'] =
          this.bestSellingProducts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Categories {
  String? id;
  String? name;
  String? description;
  String? imageUrl;
  bool? isActive;
  String? createdAt;
  String? updatedAt;

  Categories(
      {this.id,
        this.name,
        this.description,
        this.imageUrl,
        this.isActive,
        this.createdAt,
        this.updatedAt});

  Categories.fromJson(Map<String, dynamic> json) {
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

class BestSellingProducts {
  String? id;
  String? name;
  String? description;
  String? imageUrl;
  String? categoryId;
  bool? isActive;
  String? createdAt;
  String? updatedAt;
  Categories? category;
  List<Gallery>? gallery;
  List<Variation>? variation;

  BestSellingProducts(
      {this.id,
        this.name,
        this.description,
        this.imageUrl,
        this.categoryId,
        this.isActive,
        this.createdAt,
        this.updatedAt,
        this.category,
        this.gallery,
        this.variation});

  BestSellingProducts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    imageUrl = json['imageUrl'];
    categoryId = json['categoryId'];
    isActive = json['isActive'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    category = json['category'] != null
        ? new Categories.fromJson(json['category'])
        : null;
    if (json['gallery'] != null) {
      gallery = <Gallery>[];
      json['gallery'].forEach((v) {
        gallery!.add(new Gallery.fromJson(v));
      });
    }
    if (json['variation'] != null) {
      variation = <Variation>[];
      json['variation'].forEach((v) {
        variation!.add(new Variation.fromJson(v));
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
    data['isActive'] = this.isActive;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    if (this.gallery != null) {
      data['gallery'] = this.gallery!.map((v) => v.toJson()).toList();
    }
    if (this.variation != null) {
      data['variation'] = this.variation!.map((v) => v.toJson()).toList();
    }
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

class Variation {
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

  Variation(
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

  Variation.fromJson(Map<String, dynamic> json) {
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
