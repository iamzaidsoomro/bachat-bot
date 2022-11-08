// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      photoURL: json['photoURL'] as String?,
      email: json['email'] as String?,
      displayName: json['displayName'] as String?,
      uid: json['uid'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      address: json['address'] as String?,
      city: json['city'] as String?,
      joined: json['joined'] as String?,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'photoURL': instance.photoURL,
      'email': instance.email,
      'displayName': instance.displayName,
      'uid': instance.uid,
      'phoneNumber': instance.phoneNumber,
      'address': instance.address,
      'city': instance.city,
      'joined': instance.joined,
    };
