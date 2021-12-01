import 'package:json_annotation/json_annotation.dart';

part 'suit.g.dart';

@JsonSerializable()
class Suit {
  final int id;
  final String name;
  final int  animal_type_id;

  Suit({
  required this.id,
  required this.name,
  required this.animal_type_id
  });

  factory Suit.fromJson(Map<String, dynamic> data) => _$SuitFromJson(data);
  Map<String, dynamic> toJson() => _$SuitToJson(this);

}