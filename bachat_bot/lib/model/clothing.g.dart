// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clothing.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClothingModel _$ClothingModelFromJson(Map<String, dynamic> json) =>
    ClothingModel(
      name: json['name'],
      norm_prices: json['norm_prices'],
      disc_prices: json['disc_prices'],
      product_url: json['product_url'],
      image_url: json['image_url'],
      description: json['description'],
    );

Map<String, dynamic> _$ClothingModelToJson(ClothingModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'norm_prices': instance.norm_prices,
      'disc_prices': instance.disc_prices,
      'product_url': instance.product_url,
      'image_url': instance.image_url,
      'description': instance.description,
    };
