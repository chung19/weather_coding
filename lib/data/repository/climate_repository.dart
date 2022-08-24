// import 'package:flutter/widgets.dart';
// import 'dart:async';
// import 'dart:convert';
// import 'package:flutter_weather_06072022/data/remote/api/api_service.dart';
// import 'package:flutter_weather_06072022/data/remote/dto/climate_dto.dart';
//
// class ClimateRepository  extends ChangeNotifier {
//   late ApiService _apiService;
//   ClimateDto? climateDto;
//
//   void updateClimateRepository({required ApiService apiService}) {
//     _apiService = apiService;
//   }
//
//   void getTempFromCityName(String cityName) async {
//     try {
//       climateDto = await fetchTempFromCityName(cityName);
//     } catch (e) {
//       notifyListeners();
//     }
//   }
//
//     Future<ClimateDto> fetchTempFromCityName(String cityName) {
//       Completer<ClimateDto> completer = Completer();
//       _apiService.getTempFromCityName(cityName: cityName)
//           .then((response) => jsonDecode(response.toString()))
//           .then((json) {
//         completer.complete(ClimateDto.fromJson(json));
//       })
//           .catchError((error) {
//         completer.completeError(error);
//       });
//       return completer.future;
//     }
// }



import 'package:flutter_weather_06072022/data/remote/api/api_service.dart';

class ClimateRepository{
  late ApiService _apiService;

  void updateClimateRepository({required ApiService apiService}) {
    _apiService = apiService;
  }

  Future getTempFromCityName({String cityName = ""}) {
    return _apiService.getTempFromCityName(cityName: cityName);
  }
}