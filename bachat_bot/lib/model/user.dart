import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class UserModel {
  String? photoURL;
  String? email;
  String? displayName;
  String? uid;
  String? phoneNumber;
  String? address;
  String? city;
  String? joined;

  UserModel({
    this.photoURL,
    this.email,
    this.displayName,
    this.uid,
    this.phoneNumber,
    this.address,
    this.city,
    this.joined,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
