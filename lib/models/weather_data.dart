
// import 'package:flutter_weather_icons/flutter_weather_icons.dart';

class WeatherData {
  final String date;
  final double maxTemp;
  final double minTemp;
  // final IconData weatherIcon;
  final String condition;

  WeatherData({
    required this.date,
    required this.maxTemp,
    required this.minTemp,
    // required this.weatherIcon,
    required this.condition,
  });

  factory WeatherData.fromJson(String date, Map<String, dynamic> json) {
    return WeatherData(
      date: date,
      maxTemp: json['maxtemp_c'] as double,
      minTemp: json['mintemp_c'] as double,
      // weatherIcon: _getWeatherIcon(json['condition']['code']),
      condition: json['condition']['text'] as String,
    );
  }

  // static IconData _getWeatherIcon(int code) {
  //   switch (code) {
  //     case 1000:
  //       return WeatherIcons.wiDaySunny;
  //     case 1003:
  //       return WeatherIcons.wiCloudy;
  //     case 1006:
  //     case 1009:
  //       return WeatherIcons.wiCloudy;
  //     case 1030:
  //       return WeatherIcons.wiFog;
  //     case 1063:
  //     case 1180:
  //     case 1183:
  //     case 1186:
  //     case 1189:
  //     case 1192:
  //     case 1195:
  //     case 1198:
  //     case 1201:
  //     case 1204:
  //     case 1207:
  //     case 1240:
  //     case 1243:
  //     case 1246:
  //     case 1249:
  //     case 1252:
  //       return WeatherIcons.wiRain;
  //     case 1066:
  //     case 1114:
  //     case 1117:
  //     case 1147:
  //     case 1150:
  //     case 1153:
  //     case 1168:
  //     case 1171:
  //     case 1183:
  //     case 1186:
  //     case 1210:
  //     case 1213:
  //     case 1216:
  //     case 1219:
  //     case 1222:
  //     case 1225:
  //     case 1237:
  //       return WeatherIcons.wiSnow;
  //     case 1069:
  //     case 1072:
  //     case 1117:
  //     case 1168:
  //     case 1171:
  //     case 1192:
  //     case 1195:
  //     case 1198:
  //     case 1204:
  //     case 1207:
  //     case 1216:
  //     case 1219:
  //     case 1222:
  //     case 1225:
  //       return WeatherIcons.wiSleet;
  //     case 1273:
  //     case 1276:
  //     case 1279:
  //     case 1282:
  //       return WeatherIcons.wiThunderstorm;
  //     default:
  //       return WeatherIcons.wiDaySunny;
  //   }
  // }

}
