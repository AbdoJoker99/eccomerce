import 'ProductResponse.dart';
import 'categoryOrBrandResponse.dart';

class GetProductCartResponse {
  GetProductCartResponse({
    this.status,
    this.statusMsg,
    this.message,
    this.numOfCartItems,
    this.cartId,
    this.data,
  });

  GetProductCartResponse.fromJson(dynamic json) {
    status = json['status'];
    statusMsg = json['statusMsg'];
    message = json['message'];
    numOfCartItems = json['numOfCartItems'];
    cartId = json['cartId'];
    data = json['data'] != null ? GetCartData.fromJson(json['data']) : null;
  }
  String? status;
  num? numOfCartItems;
  String? cartId;
  GetCartData? data;
  String? statusMsg;
  String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['numOfCartItems'] = numOfCartItems;
    map['cartId'] = cartId;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }
}

class GetCartData {
  GetCartData({
    this.id,
    this.cartOwner,
    this.products,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.totalCartPrice,
  });

  GetCartData.fromJson(dynamic json) {
    id = json['_id'];
    cartOwner = json['cartOwner'];
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products?.add(GetProductCart.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
    totalCartPrice = json['totalCartPrice'];
  }
  String? id;
  String? cartOwner;
  List<GetProductCart>? products;
  String? createdAt;
  String? updatedAt;
  num? v;
  num? totalCartPrice;

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

class GetProductCart {
  GetProductCart({
    this.count,
    this.id,
    this.product,
    this.price,
  });

  GetProductCart.fromJson(dynamic json) {
    count = json['count'];
    id = json['_id'];
    product =
        json['product'] != null ? GetProduct.fromJson(json['product']) : null;
    price = json['price'];
  }
  num? count;
  String? id;
  GetProduct? product;
  num? price;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['count'] = count;
    map['_id'] = id;
    if (product != null) {
      map['product'] = product?.toJson();
    }
    map['price'] = price;
    return map;
  }
}

class GetProduct {
  GetProduct({
    this.subcategory,
    this.id,
    this.title,
    this.quantity,
    this.imageCover,
    this.category,
    this.brand,
    this.ratingsAverage,
  });

  GetProduct.fromJson(dynamic json) {
    if (json['subcategory'] != null) {
      subcategory = [];
      json['subcategory'].forEach((v) {
        subcategory?.add(Subcategory.fromJson(v));
      });
    }
    id = json['_id'];
    title = json['title'];
    quantity = json['quantity'];
    imageCover = json['imageCover'];
    category = json['category'] != null
        ? CategoryOrBrand.fromJson(json['category'])
        : null;
    brand =
        json['brand'] != null ? CategoryOrBrand.fromJson(json['brand']) : null;
    ratingsAverage = json['ratingsAverage'];
    id = json['id'];
  }
  List<Subcategory>? subcategory;
  String? id;
  String? title;
  num? quantity;
  String? imageCover;
  CategoryOrBrand? category;
  CategoryOrBrand? brand;
  num? ratingsAverage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (subcategory != null) {
      map['subcategory'] = subcategory?.map((v) => v.toJson()).toList();
    }
    map['_id'] = id;
    map['title'] = title;
    map['quantity'] = quantity;
    map['imageCover'] = imageCover;
    if (category != null) {
      map['category'] = category?.toJson();
    }
    if (brand != null) {
      map['brand'] = brand?.toJson();
    }
    map['ratingsAverage'] = ratingsAverage;
    map['id'] = id;
    return map;
  }
}
