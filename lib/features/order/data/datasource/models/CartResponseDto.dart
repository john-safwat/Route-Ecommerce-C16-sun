class CartResponseDto {
  CartResponseDto({
    this.status,
    this.message,
    this.numOfCartItems,
    this.cartId,
    this.data,
  });

  CartResponseDto.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    numOfCartItems = json['numOfCartItems'];
    cartId = json['cartId'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  String? status;
  String? message;
  num? numOfCartItems;
  String? cartId;
  Data? data;

  CartResponseDto copyWith({
    String? status,
    String? message,
    num? numOfCartItems,
    String? cartId,
    Data? data,
  }) => CartResponseDto(
    status: status ?? this.status,
    message: message ?? this.message,
    numOfCartItems: numOfCartItems ?? this.numOfCartItems,
    cartId: cartId ?? this.cartId,
    data: data ?? this.data,
  );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    map['numOfCartItems'] = numOfCartItems;
    map['cartId'] = cartId;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }
}

class Data {
  Data({
    this.id,
    this.cartOwner,
    this.products,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.totalCartPrice,
  });

  Data.fromJson(dynamic json) {
    id = json['_id'];
    cartOwner = json['cartOwner'];
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products?.add(Products.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
    totalCartPrice = json['totalCartPrice'];
  }

  String? id;
  String? cartOwner;
  List<Products>? products;
  String? createdAt;
  String? updatedAt;
  num? v;
  num? totalCartPrice;

  Data copyWith({
    String? id,
    String? cartOwner,
    List<Products>? products,
    String? createdAt,
    String? updatedAt,
    num? v,
    num? totalCartPrice,
  }) => Data(
    id: id ?? this.id,
    cartOwner: cartOwner ?? this.cartOwner,
    products: products ?? this.products,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    v: v ?? this.v,
    totalCartPrice: totalCartPrice ?? this.totalCartPrice,
  );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['cartOwner'] = cartOwner;
    if (products != null) {
      map['products'] = products?.map((v) => v.toJson()).toList();
    }
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['__v'] = v;
    map['totalCartPrice'] = totalCartPrice;
    return map;
  }
}

class Products {
  Products({this.count, this.id, this.product, this.price});

  Products.fromJson(dynamic json) {
    count = json['count'];
    id = json['_id'];
    product = (json['product']["id"] ?? json['product']).toString();
    price = json['price'];
  }

  num? count;
  String? id;
  String? product;
  num? price;

  Products copyWith({num? count, String? id, String? product, num? price}) =>
      Products(
        count: count ?? this.count,
        id: id ?? this.id,
        product: product ?? this.product,
        price: price ?? this.price,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['count'] = count;
    map['_id'] = id;
    map['product'] = product;
    map['price'] = price;
    return map;
  }
}
