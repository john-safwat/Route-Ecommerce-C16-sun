class ProductsResponseDto {
  ProductsResponseDto({this.results, this.metadata, this.productDto});

  ProductsResponseDto.fromJson(dynamic json) {
    results = json['results'];
    metadata =
        json['metadata'] != null ? Metadata.fromJson(json['metadata']) : null;
    if (json['data'] != null) {
      productDto = [];
      json['data'].forEach((v) {
        productDto?.add(ProductDto.fromJson(v));
      });
    }
  }

  num? results;
  Metadata? metadata;
  List<ProductDto>? productDto;

  ProductsResponseDto copyWith({
    num? results,
    Metadata? metadata,
    List<ProductDto>? productDto,
  }) => ProductsResponseDto(
    results: results ?? this.results,
    metadata: metadata ?? this.metadata,
    productDto: productDto ?? this.productDto,
  );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['results'] = results;
    if (metadata != null) {
      map['metadata'] = metadata?.toJson();
    }
    if (productDto != null) {
      map['data'] = productDto?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class ProductDto {
  ProductDto({
    this.sold,
    this.images,
    this.subcategory,
    this.ratingsQuantity,
    this.id,
    this.title,
    this.slug,
    this.description,
    this.quantity,
    this.price,
    this.priceAfterDiscount,
    this.imageCover,
    this.category,
    this.brand,
    this.ratingsAverage,
    this.createdAt,
    this.updatedAt,
  });

  ProductDto.fromJson(dynamic json) {
    sold = json['sold'];
    images = json['images'] != null ? json['images'].cast<String>() : [];
    if (json['subcategory'] != null) {
      subcategory = [];
      json['subcategory'].forEach((v) {
        subcategory?.add(Subcategory.fromJson(v));
      });
    }
    ratingsQuantity = json['ratingsQuantity'];
    id = json['_id'];
    title = json['title'];
    slug = json['slug'];
    description = json['description'];
    quantity = json['quantity'];
    price = json['price'];
    priceAfterDiscount = json['priceAfterDiscount'];
    imageCover = json['imageCover'];
    category =
        json['category'] != null ? Category.fromJson(json['category']) : null;
    brand = json['brand'] != null ? Brand.fromJson(json['brand']) : null;
    ratingsAverage = json['ratingsAverage'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  num? sold;
  List<String>? images;
  List<Subcategory>? subcategory;
  num? ratingsQuantity;
  String? id;
  String? title;
  String? slug;
  String? description;
  num? quantity;
  num? price;
  num? priceAfterDiscount;
  String? imageCover;
  Category? category;
  Brand? brand;
  num? ratingsAverage;
  String? createdAt;
  String? updatedAt;

  ProductDto copyWith({
    num? sold,
    List<String>? images,
    List<Subcategory>? subcategory,
    num? ratingsQuantity,
    String? id,
    String? title,
    String? slug,
    String? description,
    num? quantity,
    num? price,
    num? priceAfterDiscount,
    String? imageCover,
    Category? category,
    Brand? brand,
    num? ratingsAverage,
    String? createdAt,
    String? updatedAt,
  }) => ProductDto(
    sold: sold ?? this.sold,
    images: images ?? this.images,
    subcategory: subcategory ?? this.subcategory,
    ratingsQuantity: ratingsQuantity ?? this.ratingsQuantity,
    id: id ?? this.id,
    title: title ?? this.title,
    slug: slug ?? this.slug,
    description: description ?? this.description,
    quantity: quantity ?? this.quantity,
    price: price ?? this.price,
    priceAfterDiscount: priceAfterDiscount ?? this.priceAfterDiscount,
    imageCover: imageCover ?? this.imageCover,
    category: category ?? this.category,
    brand: brand ?? this.brand,
    ratingsAverage: ratingsAverage ?? this.ratingsAverage,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['sold'] = sold;
    map['images'] = images;
    if (subcategory != null) {
      map['subcategory'] = subcategory?.map((v) => v.toJson()).toList();
    }
    map['ratingsQuantity'] = ratingsQuantity;
    map['_id'] = id;
    map['title'] = title;
    map['slug'] = slug;
    map['description'] = description;
    map['quantity'] = quantity;
    map['price'] = price;
    map['priceAfterDiscount'] = priceAfterDiscount;
    map['imageCover'] = imageCover;
    if (category != null) {
      map['category'] = category?.toJson();
    }
    if (brand != null) {
      map['brand'] = brand?.toJson();
    }
    map['ratingsAverage'] = ratingsAverage;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['id'] = id;
    return map;
  }
}

class Brand {
  Brand({this.id, this.name, this.slug, this.image});

  Brand.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
  }

  String? id;
  String? name;
  String? slug;
  String? image;

  Brand copyWith({String? id, String? name, String? slug, String? image}) =>
      Brand(
        id: id ?? this.id,
        name: name ?? this.name,
        slug: slug ?? this.slug,
        image: image ?? this.image,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['name'] = name;
    map['slug'] = slug;
    map['image'] = image;
    return map;
  }
}

class Category {
  Category({this.id, this.name, this.slug, this.image});

  Category.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
  }

  String? id;
  String? name;
  String? slug;
  String? image;

  Category copyWith({String? id, String? name, String? slug, String? image}) =>
      Category(
        id: id ?? this.id,
        name: name ?? this.name,
        slug: slug ?? this.slug,
        image: image ?? this.image,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['name'] = name;
    map['slug'] = slug;
    map['image'] = image;
    return map;
  }
}

class Subcategory {
  Subcategory({this.id, this.name, this.slug, this.category});

  Subcategory.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    category = json['category'];
  }

  String? id;
  String? name;
  String? slug;
  String? category;

  Subcategory copyWith({
    String? id,
    String? name,
    String? slug,
    String? category,
  }) => Subcategory(
    id: id ?? this.id,
    name: name ?? this.name,
    slug: slug ?? this.slug,
    category: category ?? this.category,
  );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['name'] = name;
    map['slug'] = slug;
    map['category'] = category;
    return map;
  }
}

class Metadata {
  Metadata({this.currentPage, this.numberOfPages, this.limit});

  Metadata.fromJson(dynamic json) {
    currentPage = json['currentPage'];
    numberOfPages = json['numberOfPages'];
    limit = json['limit'];
  }

  num? currentPage;
  num? numberOfPages;
  num? limit;

  Metadata copyWith({num? currentPage, num? numberOfPages, num? limit}) =>
      Metadata(
        currentPage: currentPage ?? this.currentPage,
        numberOfPages: numberOfPages ?? this.numberOfPages,
        limit: limit ?? this.limit,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['currentPage'] = currentPage;
    map['numberOfPages'] = numberOfPages;
    map['limit'] = limit;
    return map;
  }
}
