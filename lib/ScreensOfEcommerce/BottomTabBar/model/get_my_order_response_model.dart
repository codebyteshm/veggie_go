class GetMyOrderResponse {
  bool? status;
  String? message;
  Data? data;

  GetMyOrderResponse({this.status, this.message, this.data});

  GetMyOrderResponse.fromJson(Map<String, dynamic> json) {
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
  List<Orders>? orders;
  Pagination? pagination;

  Data({this.orders, this.pagination});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['orders'] != null) {
      orders = <Orders>[];
      json['orders'].forEach((v) {
        orders!.add(new Orders.fromJson(v));
      });
    }
    pagination = json['pagination'] != null
        ? new Pagination.fromJson(json['pagination'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.orders != null) {
      data['orders'] = this.orders!.map((v) => v.toJson()).toList();
    }
    if (this.pagination != null) {
      data['pagination'] = this.pagination!.toJson();
    }
    return data;
  }
}

class Orders {
  String? id;
  String? orderNumber;
  String? userId;
  int? totalAmount;
  String? status;
  String? paymentType;
  String? deliveryAddress;
  Null? deliveryPartnerId;
  String? notes;
  bool? paymentStatus;
  String? paymentId;
  String? transactionId;
  String? shippingAddressId;
  bool? onHold;
  String? otp;
  String? createdAt;
  String? updatedAt;
  List<Items>? items;
  Null? deliveryPartner;

  Orders(
      {this.id,
        this.orderNumber,
        this.userId,
        this.totalAmount,
        this.status,
        this.paymentType,
        this.deliveryAddress,
        this.deliveryPartnerId,
        this.notes,
        this.paymentStatus,
        this.paymentId,
        this.transactionId,
        this.shippingAddressId,
        this.onHold,
        this.otp,
        this.createdAt,
        this.updatedAt,
        this.items,
        this.deliveryPartner});

  Orders.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderNumber = json['orderNumber'];
    userId = json['userId'];
    totalAmount = json['totalAmount'];
    status = json['status'];
    paymentType = json['paymentType'];
    deliveryAddress = json['deliveryAddress'];
    deliveryPartnerId = json['deliveryPartnerId'];
    notes = json['notes'];
    paymentStatus = json['paymentStatus'];
    paymentId = json['paymentId'];
    transactionId = json['transactionId'];
    shippingAddressId = json['shippingAddressId'];
    onHold = json['onHold'];
    otp = json['otp'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
    deliveryPartner = json['deliveryPartner'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['orderNumber'] = this.orderNumber;
    data['userId'] = this.userId;
    data['totalAmount'] = this.totalAmount;
    data['status'] = this.status;
    data['paymentType'] = this.paymentType;
    data['deliveryAddress'] = this.deliveryAddress;
    data['deliveryPartnerId'] = this.deliveryPartnerId;
    data['notes'] = this.notes;
    data['paymentStatus'] = this.paymentStatus;
    data['paymentId'] = this.paymentId;
    data['transactionId'] = this.transactionId;
    data['shippingAddressId'] = this.shippingAddressId;
    data['onHold'] = this.onHold;
    data['otp'] = this.otp;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    data['deliveryPartner'] = this.deliveryPartner;
    return data;
  }
}

class Items {
  String? id;
  String? orderId;
  String? variantId;
  int? quantity;
  int? unitPrice;
  int? totalPrice;
  String? createdAt;
  Variant? variant;

  Items(
      {this.id,
        this.orderId,
        this.variantId,
        this.quantity,
        this.unitPrice,
        this.totalPrice,
        this.createdAt,
        this.variant});

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderId = json['orderId'];
    variantId = json['variantId'];
    quantity = json['quantity'];
    unitPrice = json['unitPrice'];
    totalPrice = json['totalPrice'];
    createdAt = json['createdAt'];
    variant =
    json['variant'] != null ? new Variant.fromJson(json['variant']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['orderId'] = this.orderId;
    data['variantId'] = this.variantId;
    data['quantity'] = this.quantity;
    data['unitPrice'] = this.unitPrice;
    data['totalPrice'] = this.totalPrice;
    data['createdAt'] = this.createdAt;
    if (this.variant != null) {
      data['variant'] = this.variant!.toJson();
    }
    return data;
  }
}

class Variant {
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
  Product? product;

  Variant(
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
        this.product});

  Variant.fromJson(Map<String, dynamic> json) {
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
    product =
    json['product'] != null ? new Product.fromJson(json['product']) : null;
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
    if (this.product != null) {
      data['product'] = this.product!.toJson();
    }
    return data;
  }
}

class Product {
  String? name;
  String? imageUrl;
  List<Gallery>? gallery;

  Product({this.name, this.imageUrl, this.gallery});

  Product.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    imageUrl = json['imageUrl'];
    if (json['gallery'] != null) {
      gallery = <Gallery>[];
      json['gallery'].forEach((v) {
        gallery!.add(new Gallery.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['imageUrl'] = this.imageUrl;
    if (this.gallery != null) {
      data['gallery'] = this.gallery!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Gallery {
  String? imageUrl;

  Gallery({this.imageUrl});

  Gallery.fromJson(Map<String, dynamic> json) {
    imageUrl = json['imageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['imageUrl'] = this.imageUrl;
    return data;
  }
}

class Pagination {
  int? page;
  int? limit;
  int? total;
  int? totalPages;

  Pagination({this.page, this.limit, this.total, this.totalPages});

  Pagination.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    limit = json['limit'];
    total = json['total'];
    totalPages = json['totalPages'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['page'] = this.page;
    data['limit'] = this.limit;
    data['total'] = this.total;
    data['totalPages'] = this.totalPages;
    return data;
  }
}
