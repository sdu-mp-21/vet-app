import 'package:json_annotation/json_annotation.dart';

import 'owner.dart';
part 'region.g.dart';

@JsonSerializable(explicitToJson: true)
class Region {
  final int id;
  final String locality_name;
  List<Owner> data;

  Region({
    required this.id,
    required this.locality_name,
    required this.data
  });

  factory Region.fromJson(Map<String, dynamic> data) => _$RegionFromJson(data);
  Map<String, dynamic> toJson() => _$RegionToJson(this);

}