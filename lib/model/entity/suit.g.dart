// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'suit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Suit _$SuitFromJson(Map<String, dynamic> json) => Suit(
      id: json['id'] as int,
      name: json['name'] as String,
      animal_type_id: json['animal_type_id'] as int,
    );

Map<String, dynamic> _$SuitToJson(Suit instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'animal_type_id': instance.animal_type_id,
    };
