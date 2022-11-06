import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class UserModel {
  String? profilePicture;
  String? email;
  String? name;
  String? uid;
  String? phoneNumber;
  String? address;
  String? city;

  UserModel({
    this.profilePicture,
    this.email,
    this.name,
    this.uid,
    this.phoneNumber,
    this.address,
    this.city,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
