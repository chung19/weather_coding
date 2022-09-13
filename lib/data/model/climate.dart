class Climate {
  List<Weather> weather = [];
  Main main = Main();
  int dt = -1;
  Sys sys = Sys();
  String name = "";

  Climate();

  Climate.init(
      {
    required this.weather,
    required this.main,
    required this.dt,
    required this.sys,
    required this.name,


  });

  @override
  String toString() {
    return 'Climate{weather: $weather, main: $main, dt: $dt, sys: $sys, name: $name,}';
  }
}

class Sys {
  String country = "";
  Sys({this.country = ""});

  @override
  String toString() {
    return 'Sys{country: $country}';
  }
}

class Main {
  num temp = -1;
  num tempMin = -1;
  num tempMax = -1;
  Main({ this.temp = -1, this.tempMin = -1, this.tempMax = -1});

  @override
  String toString() {
    return 'Main{temp: $temp, tempMin: $tempMin, tempMax: $tempMax}';
  }
}

class Weather {
  String main = "";
  String description = "";
  String icon ="";
  Weather({ this.main = "", this.description = "",this.icon="",});


  @override
  String toString() {
    return 'Weather{main: $main, description: $description, icon: $icon}';
  }

  Weather.fromJson(dynamic json) {
    main = json['main'];
    description = json['description'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['main'] = main;
    map['description'] = description;
    map['icon'] = icon;
    return map;
  }
}







