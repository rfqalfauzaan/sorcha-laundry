import 'shop_model.dart';
import 'user_model.dart';

class LaundryModel {
  LaundryModel({
    required this.id,
    required this.userId,
    required this.shopId,
    required this.weight,
  
    required this.pickupAddress,
    required this.deliveryAddress,
    required this.total,
    required this.description,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.user,
    required this.shop,
  });

  int id;
  int userId;
  int shopId;
  double weight;
  String pickupAddress;
  String deliveryAddress;
  double total;
  String description;
  String status;
  DateTime createdAt;
  DateTime updatedAt;
  UserModel user;
  ShopModel shop;

  factory LaundryModel.fromJson(Map<String, dynamic> json) => LaundryModel(
        id: json["id"],
        userId: json["user_id"],
        shopId: json["shop_id"],
        weight: json["weight"]?.toDouble(),

        pickupAddress: json["pickup_address"],
        deliveryAddress: json["delivery_address"],
        total: json["total"]?.toDouble(),
        description: json["description"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]).toLocal(),
        updatedAt: DateTime.parse(json["updated_at"]).toLocal(),
        user: UserModel.fromJson(json["user"]),
        shop: ShopModel.fromJson(json["shop"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "shop_id": shopId,
        "weight": weight,
        "pickup_address": pickupAddress,
        "delivery_address": deliveryAddress,
        "total": total,
        "description": description,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "user": user.toJson(),
        "shop": shop.toJson(),
      };
}
