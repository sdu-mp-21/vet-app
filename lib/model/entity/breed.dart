
import 'package:json_annotation/json_annotation.dart';

part 'breed.g.dart';

@JsonSerializable()
class Breed {
  final int id;
  final String name;
  final int suit_id;

  Breed({
    required this.id,
    required this.name,
    required this.suit_id
  });

  factory Breed.fromJson(Map<String, dynamic> data) => _$BreedFromJson(data);
  Map<String, dynamic> toJson() => _$BreedToJson(this);
}