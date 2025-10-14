// class ProductListResponseModel {
//   bool? status;
//   String? message;
//   Data? data;
//
//   ProductListResponseModel({this.status, this.message, this.data});
//
//   ProductListResponseModel.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     message = json['message'];
//     data = json['data'] != null ? new Data.fromJson(json['data']) : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['status'] = this.status;
//     data['message'] = this.message;
//     if (this.data != null) {
//       data['data'] = this.data!.toJson();
//     }
//     return data;
//   }
// }
//
// class Data {
//   Pagination? pagination;
//   List<ProductList>? list;
//   List<Categories>? categories;
//
//   Data({this.pagination, this.list, this.categories});
//
//   Data.fromJson(Map<String, dynamic> json) {
//     pagination = json['pagination'] != null
//         ? new Pagination.fromJson(json['pagination'])
//         : null;
//     if (json['list'] != null) {
//       list = <ProductList>[];
//       json['list'].forEach((v) {
//         list!.add(new ProductList.fromJson(v));
//       });
//     }
//     if (json['categories'] != null) {
//       categories = <Categories>[];
//       json['categories'].forEach((v) {
//         categories!.add(new Categories.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.pagination != null) {
//       data['pagination'] = this.pagination!.toJson();
//     }
//     if (this.list != null) {
//       data['list'] = this.list!.map((v) => v.toJson()).toList();
//     }
//     if (this.categories != null) {
//       data['categories'] = this.categories!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
//
// class Pagination {
//   int? total;
//   int? page;
//   int? limit;
//   int? totalPages;
//
//   Pagination({this.total, this.page, this.limit, this.totalPages});
//
//   Pagination.fromJson(Map<String, dynamic> json) {
//     total = json['total'];
//     page = json['page'];
//     limit = json['limit'];
//     totalPages = json['totalPages'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['total'] = this.total;
//     data['page'] = this.page;
//     data['limit'] = this.limit;
//     data['totalPages'] = this.totalPages;
//     return data;
//   }
// }
//
// class ProductList {
//   String? id;
//   String? name;
//   String? description;
//   String? imageUrl;
//   String? categoryId;
//   String? unit;
//   bool? isActive;
//   String? createdAt;
//   String? updatedAt;
//   Category? category;
//   List<Gallery>? gallery;
//   List<Variants>? variants;
//   String? stockStatus;
//   List<CartProduct>? cart;
//
//   List(
//       {this.id,
//         this.name,
//         this.description,
//         this.imageUrl,
//         this.categoryId,
//         this.unit,
//         this.isActive,
//         this.createdAt,
//         this.updatedAt,
//         this.category,
//         this.gallery,
//         this.variants,
//         this.stockStatus,
//         this.cart});
//
//   List.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     description = json['description'];
//     imageUrl = json['imageUrl'];
//     categoryId = json['categoryId'];
//     unit = json['unit'];
//     isActive = json['isActive'];
//     createdAt = json['createdAt'];
//     updatedAt = json['updatedAt'];
//     category = json['category'] != null
//         ? new Category.fromJson(json['category'])
//         : null;
//     if (json['gallery'] != null) {
//       gallery = <Gallery>[];
//       json['gallery'].forEach((v) {
//         gallery!.add(new Gallery.fromJson(v));
//       });
//     }
//     if (json['variants'] != null) {
//       variants = <Variants>[];
//       json['variants'].forEach((v) {
//         variants!.add(new Variants.fromJson(v));
//       });
//     }
//     stockStatus = json['stockStatus'];
//     if (json['cart'] != null) {
//       cart = <CartProduct>[];
//       json['cart'].forEach((v) {
//         cart!.add(new CartProduct.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     data['description'] = this.description;
//     data['imageUrl'] = this.imageUrl;
//     data['categoryId'] = this.categoryId;
//     data['unit'] = this.unit;
//     data['isActive'] = this.isActive;
//     data['createdAt'] = this.createdAt;
//     data['updatedAt'] = this.updatedAt;
//     if (this.category != null) {
//       data['category'] = this.category!.toJson();
//     }
//     if (this.gallery != null) {
//       data['gallery'] = this.gallery!.map((v) => v.toJson()).toList();
//     }
//     if (this.variants != null) {
//       data['variants'] = this.variants!.map((v) => v.toJson()).toList();
//     }
//     data['stockStatus'] = this.stockStatus;
//     if (this.cart != null) {
//       data['cart'] = this.cart!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
//
// class Category {
//   String? id;
//   String? name;
//   String? description;
//   String? imageUrl;
//   bool? isActive;
//   String? createdAt;
//   String? updatedAt;
//
//   Category(
//       {this.id,
//         this.name,
//         this.description,
//         this.imageUrl,
//         this.isActive,
//         this.createdAt,
//         this.updatedAt});
//
//   Category.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     description = json['description'];
//     imageUrl = json['imageUrl'];
//     isActive = json['isActive'];
//     createdAt = json['createdAt'];
//     updatedAt = json['updatedAt'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     data['description'] = this.description;
//     data['imageUrl'] = this.imageUrl;
//     data['isActive'] = this.isActive;
//     data['createdAt'] = this.createdAt;
//     data['updatedAt'] = this.updatedAt;
//     return data;
//   }
// }
//
// class Gallery {
//   String? id;
//   String? productId;
//   String? imageUrl;
//   String? createdAt;
//
//   Gallery({this.id, this.productId, this.imageUrl, this.createdAt});
//
//   Gallery.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     productId = json['productId'];
//     imageUrl = json['imageUrl'];
//     createdAt = json['createdAt'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['productId'] = this.productId;
//     data['imageUrl'] = this.imageUrl;
//     data['createdAt'] = this.createdAt;
//     return data;
//   }
// }
//
// class Variants {
//   String? id;
//   String? productId;
//   String? weight;
//   int? price;
//   int? salePrice;
//   int? stock;
//   String? sku;
//   bool? isActive;
//   String? createdAt;
//   String? updatedAt;
//   String? stockStatus;
//   List<CartProduct>? cart;
//
//   Variants(
//       {this.id,
//         this.productId,
//         this.weight,
//         this.price,
//         this.salePrice,
//         this.stock,
//         this.sku,
//         this.isActive,
//         this.createdAt,
//         this.updatedAt,
//         this.stockStatus,
//         this.cart});
//
//   Variants.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     productId = json['productId'];
//     weight = json['weight'];
//     price = json['price'];
//     salePrice = json['salePrice'];
//     stock = json['stock'];
//     sku = json['sku'];
//     isActive = json['isActive'];
//     createdAt = json['createdAt'];
//     updatedAt = json['updatedAt'];
//     stockStatus = json['stockStatus'];
//     if (json['cart'] != null) {
//       cart = <CartProduct>[];
//       json['cart'].forEach((v) {
//         cart!.add(new CartProduct.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['productId'] = this.productId;
//     data['weight'] = this.weight;
//     data['price'] = this.price;
//     data['salePrice'] = this.salePrice;
//     data['stock'] = this.stock;
//     data['sku'] = this.sku;
//     data['isActive'] = this.isActive;
//     data['createdAt'] = this.createdAt;
//     data['updatedAt'] = this.updatedAt;
//     data['stockStatus'] = this.stockStatus;
//     if (this.cart != null) {
//       data['cart'] = this.cart!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
//
// class CartProduct {
//   String? id;
//   String? userId;
//   String? variantId;
//   int? quantity;
//   String? createdAt;
//   String? updatedAt;
//   Variant? variant;
//
//   CartProduct(
//       {this.id,
//         this.userId,
//         this.variantId,
//         this.quantity,
//         this.createdAt,
//         this.updatedAt,
//         this.variant});
//
//   CartProduct.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     userId = json['userId'];
//     variantId = json['variantId'];
//     quantity = json['quantity'];
//     createdAt = json['createdAt'];
//     updatedAt = json['updatedAt'];
//     variant =
//     json['variant'] != null ? new Variant.fromJson(json['variant']) : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['userId'] = this.userId;
//     data['variantId'] = this.variantId;
//     data['quantity'] = this.quantity;
//     data['createdAt'] = this.createdAt;
//     data['updatedAt'] = this.updatedAt;
//     if (this.variant != null) {
//       data['variant'] = this.variant!.toJson();
//     }
//     return data;
//   }
// }
//
// class Variant {
//   String? id;
//   String? weight;
//   int? price;
//   int? salePrice;
//   int? stock;
//   String? sku;
//   String? productId;
//
//   Variant(
//       {this.id,
//         this.weight,
//         this.price,
//         this.salePrice,
//         this.stock,
//         this.sku,
//         this.productId});
//
//   Variant.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     weight = json['weight'];
//     price = json['price'];
//     salePrice = json['salePrice'];
//     stock = json['stock'];
//     sku = json['sku'];
//     productId = json['productId'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['weight'] = this.weight;
//     data['price'] = this.price;
//     data['salePrice'] = this.salePrice;
//     data['stock'] = this.stock;
//     data['sku'] = this.sku;
//     data['productId'] = this.productId;
//     return data;
//   }
// }
