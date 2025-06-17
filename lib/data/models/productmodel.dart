import 'package:taskelevate/domain/entity/productentity.dart';


class Productmodel extends ProductEntity {
  Productmodel({required super.title, required super.price, required super.description, required super.category, required super.image, required super.rate, required super.count});

factory Productmodel.fromJson(Map<String, dynamic> json) {
    return Productmodel(
      title: json['title'],
      price: (json['price'] as num).toDouble(),
      description: json['description'],
      category: json['category'],
      image: json['image'],
      rate: (json['rating']['rate'] as num).toDouble(),
      count: json['rating']['count'],
    );
  }
}