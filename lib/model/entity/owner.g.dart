// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'owner.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Owner _$OwnerFromJson(Map<String, dynamic> json) => Owner(
      id: json['id'] as int,
      name: json['name'] as String,
      street: json['street'] as String,
      home: json['home'] as String,
      krs_count: json['krs_count'] as int,
      phone: json['phone'] as String,
      surname: json['surname'] as String,
      mrs_count: json['mrs_count'] as int,
      pig_count: json['pig_count'] as int,
      horse_count: json['horse_count'] as int,
      camel_count: json['camel_count'] as int,
      status: json['status'] as int,
      status2_time: json['status2_time'] as String,
    );

Map<String, dynamic> _$OwnerToJson(Owner instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'street': instance.street,
      'home': instance.home,
      'krs_count': instance.krs_count,
      'phone': instance.phone,
      'surname': instance.surname,
      'mrs_count': instance.mrs_count,
      'pig_count': instance.pig_count,
      'horse_count': instance.horse_count,
      'camel_count': instance.camel_count,
      'status': instance.status,
      'status2_time': instance.status2_time,
    };
