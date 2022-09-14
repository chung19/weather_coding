
class ClimateDto {
  ClimateDto({
      this.weather,
      this.main,
      this.dt,
      this.sys,
      this.name,
      });

  ClimateDto.fromJson(dynamic json) {
    if (json['weather'] != null) {
      weather = [];
      json['weather'].forEach((v) {
        weather?.add(WeatherDto.fromJson(v));
      });
    }
    main = json['main'] != null ? Main.fromJson(json['main']) : null;
    dt = json['dt'];
    sys = json['sys'] != null ? SysDto.fromJson(json['sys']) : null;
    name = json['name'];
  }
  List<WeatherDto>? weather;
  Main? main;
  num? dt;
  SysDto? sys;
  String? name;
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (weather != null) {
      map['weather'] = weather?.map((v) => v.toJson()).toList();
    }
    if (main != null) {
      map['main'] = main?.toJson();
    }
    map['dt'] = dt;
    if (sys != null) {
      map['sys'] = sys?.toJson();
    }
    map['name'] = name;
    return map;
  }

}

/// type : 1
/// id : 9308
/// country : "VN"
/// sunrise : 1662849768
/// sunset : 1662894264

class SysDto {
  SysDto({
      this.type,
      this.id,
      this.country,
      this.sunrise,
      this.sunset,});

  SysDto.fromJson(dynamic json) {
    type = json['type'];
    id = json['id'];
    country = json['country'];
    sunrise = json['sunrise'];
    sunset = json['sunset'];
  }
  num? type;
  num? id;
  String? country;
  num? sunrise;
  num? sunset;
SysDto copyWith({  num? type,
  num? id,
  String? country,
  num? sunrise,
  num? sunset,
}) => SysDto(  type: type ?? this.type,
  id: id ?? this.id,
  country: country ?? this.country,
  sunrise: sunrise ?? this.sunrise,
  sunset: sunset ?? this.sunset,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type'] = type;
    map['id'] = id;
    map['country'] = country;
    map['sunrise'] = sunrise;
    map['sunset'] = sunset;
    return map;
  }

}





class Main {
  Main({
      this.temp,
      this.tempMin,
      this.tempMax,
     });

  Main.fromJson(dynamic json) {
    temp = json['temp'];
    tempMin = json['temp_min'];
    tempMax = json['temp_max'];
  }
  num? temp;
  num? tempMin;
  num? tempMax;
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['temp'] = temp;
    map['temp_min'] = tempMin;
    map['temp_max'] = tempMax;
    return map;
  }

}

/// id : 802
/// main : "Clouds"
/// description : "scattered clouds"
/// icon : "03d"

class WeatherDto {
  WeatherDto({
      this.main,
      this.description,
      this.icon,

  });

  WeatherDto.fromJson(dynamic json) {
    main = json['main'];
    description = json['description'];
    icon = json['icon'];
  }
  String? main;
  String? description;
  String? icon;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['main'] = main;
    map['description'] = description;
    map['icon'] = icon;
    return map;
  }

}

/// lon : 105.8412
/// lat : 21.0245



class Coord {
  Coord({
      this.lon,
      this.lat,});

  Coord.fromJson(dynamic json) {
    lon = json['lon'];
    lat = json['lat'];
  }
  num? lon;
  num? lat;
Coord copyWith({  num? lon,
  num? lat,
}) => Coord(  lon: lon ?? this.lon,
  lat: lat ?? this.lat,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['lon'] = lon;
    map['lat'] = lat;
    return map;
  }

}


