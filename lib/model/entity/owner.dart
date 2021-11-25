import 'package:json_annotation/json_annotation.dart';

part 'owner.g.dart';

@JsonSerializable(explicitToJson: true)
class Owner {
  final int id;
  final String name;
  final String street;
  final String home;
  final int krs_count;
  final String phone;
  final String surname;
  final int mrs_count;
  final int pig_count;
  final int horse_count;
  final int camel_count;
  final int status;
  final String status2_time;

  Owner ({
    required this.id,
    required this.name,
    required this.street,
    required this.home,
    required this.krs_count,
    required this.phone,
    required this.surname,
    required this.mrs_count,
    required this.pig_count,
    required this.horse_count,
    required this.camel_count,
    required this.status,
    required this.status2_time
  });

    factory Owner.fromJson(Map<String, dynamic> data) => _$OwnerFromJson(data);
    Map<String, dynamic> toJson() => _$OwnerToJson(this);

}