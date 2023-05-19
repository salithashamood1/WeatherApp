import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/model/temprature.dart';
import 'package:weather_app/model/wind.dart';

part 'weather_model.g.dart';

@JsonSerializable()
class WeatherModel extends Equatable {
  int id;
  String name;
  Temprature main;
  Wind wind;

  WeatherModel({
    required this.id,
    required this.name,
    required this.main,
    required this.wind,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherModelFromJson(json);
  Map<String, dynamic> toJson() => _$WeatherModelToJson(this);

  @override
  List<Object?> get props => [];
}
