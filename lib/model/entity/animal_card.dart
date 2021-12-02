import 'package:json_annotation/json_annotation.dart';

@JsonSerializable(explicitToJson: true)
class OneAnimalCard {
  final String ing;
  final String imgUrl;
  final String gender;

  OneAnimalCard({
    required this.ing,
    required this.imgUrl,
    required this.gender
  });
}
