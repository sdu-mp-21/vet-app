// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'region.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Region _$RegionFromJson(Map<String, dynamic> json) => Region(
      id: json['id'] as int,
      locality_name: json['locality_name'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => Owner.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RegionToJson(Region instance) => <String, dynamic>{
      'id': instance.id,
      'locality_name': instance.locality_name,
      'data': instance.data.map((e) => e.toJson()).toList(),
    };
