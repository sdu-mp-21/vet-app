import 'package:json_annotation/json_annotation.dart';

part 'animal_card.g.dart';

@JsonSerializable(explicitToJson: true)
class OneAnimalCard {
  final String ing;
  final String imgUrl;
  final String gender;
  final String date;
  final String breed;
  final String nj;

  OneAnimalCard({
    required this.ing,
    required this.imgUrl,
    required this.gender,
    required this.date,
    required this.breed,
    required this.nj
  });

  factory OneAnimalCard.fromJson(Map<String, dynamic> data) => _$OneAnimalFromJson(data);
  Map<String, dynamic> toJson() => _$OneAnimalToJson(this);

}
