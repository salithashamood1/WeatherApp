import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'temprature.g.dart';

@JsonSerializable()
class Temprature extends Equatable {
  double temp;
  double feels_like;
  double temp_min;
  double temp_max;
  double pressure;
  double humidity;
  Temprature({
    required this.temp,
    required this.feels_like,
    required this.temp_min,
    required this.temp_max,
    required this.pressure,
    required this.humidity,
  });

  factory Temprature.fromJson(Map<String, dynamic> json) =>
      _$TempratureFromJson(json);
  Map<String, dynamic> toJson() => _$TempratureToJson(this);

  @override
  List<Object?> get props => [];
}
