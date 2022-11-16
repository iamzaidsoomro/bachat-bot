import 'package:json_annotation/json_annotation.dart';

part 'clothing.g.dart';

@JsonSerializable()
class ClothingModel {
  var name;
  var norm_prices;
  var disc_prices;
  var product_url;
  var image_url;
  var description;

  ClothingModel({
    required this.name,
    required this.norm_prices,
    required this.disc_prices,
    required this.product_url,
    required this.image_url,
    required this.description,
  });

  factory ClothingModel.fromJson(Map<String, dynamic> json) =>
      _$ClothingModelFromJson(json);
  Map<String, dynamic> toJson() => _$ClothingModelToJson(this);
}
