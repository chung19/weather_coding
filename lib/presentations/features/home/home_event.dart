import 'package:equatable/equatable.dart';
abstract class HomeBaseEvent extends Equatable{}

class CallDefaultWeatherEvent extends HomeBaseEvent {
  String cityName;
String? text;
  CallDefaultWeatherEvent({required this.cityName ,this.text});

  @override
  List<Object?> get props => [];

}