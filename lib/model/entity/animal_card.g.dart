part of 'animal_card.dart';

OneAnimalCard _$OneAnimalFromJson(Map<String, dynamic> json) => OneAnimalCard(
    ing: json['ing'] as String, imgUrl: json['imgUrl'] as String, gender: json['gender'] as String, date: json['date'] as String, breed: json['breed'] as String, nj: json['nj'] as String);

Map<String, dynamic> _$OneAnimalToJson(OneAnimalCard instance) =>
  <String, dynamic> {
    'ing' : instance.ing,
    'imgUrl' : instance.imgUrl,
    'gender' : instance.gender,
    'date' : instance.date,
    'breed' : instance.breed,
    'nj' : instance.nj,

};
