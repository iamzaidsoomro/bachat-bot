// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      profilePicture: json['profilePicture'] as String?,
      email: json['email'] as String?,
      name: json['name'] as String?,
      uid: json['uid'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      address: json['address'] as String?,
      city: json['city'] as String?,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'profilePicture': instance.profilePicture,
      'email': instance.email,
      'name': instance.name,
      'uid': instance.uid,
      'phoneNumber': instance.phoneNumber,
      'address': instance.address,
      'city': instance.city,
    };
