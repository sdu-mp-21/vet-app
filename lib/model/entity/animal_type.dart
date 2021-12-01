import 'package:json_annotation/json_annotation.dart';

part 'animal_type.g.dart';

@JsonSerializable()
class AnimalType {
  final int id;
  final String name;

  AnimalType({
    required this.id,
    required this.name
  });

  factory AnimalType.fromJson(Map<String, dynamic> data) => _$AnimalTypeFromJson(data);
  Map<String, dynamic> toJson() => _$AnimalTypeToJson(this);
}