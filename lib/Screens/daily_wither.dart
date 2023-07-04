import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:unitone_task/models/weather_data.dart';

class DailyWeatherWidget extends StatefulWidget {
  _DailyWeatherWidgetState createState() => _DailyWeatherWidgetState();
}

class _DailyWeatherWidgetState extends State<DailyWeatherWidget> {
  late Future<List<WeatherData>> _weatherData;

  @override
  void initState() {
    super.initState();
    _weatherData = _fetchWeatherData();
  }

 
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<WeatherData>>(
      future: _weatherData,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        } else {
          final List<WeatherData> weatherList = snapshot.data!;
          return ListView.builder(
            shrinkWrap: true,
            itemCount: weatherList.length,
            itemBuilder: (context, index) {
              final WeatherData weather = weatherList[index];
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Card(
                  elevation: 2.0,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          weather.date,
                          style: const TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Max Temp',
                                  style: TextStyle(fontSize: 16.0),
                                ),
                                Text(
                                  '${weather.maxTemp.toString()}°C',
                                  style: const TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Min Temp',
                                  style: TextStyle(fontSize: 16.0),
                                ),
                                Text(
                                  '${weather.minTemp.toString()}°C',
                                  style: const TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            // Icon(
                            //   weather.weatherIcon,
                            //   size: 48.0,
                            //   color: Colors.blue,
                            // ),
                          ],
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          weather.condition,
                          style: const TextStyle(fontSize: 16.0),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        }
      },
    );
  }
   Future<List<WeatherData>> _fetchWeatherData() async {
    const apiUrl =
        'https://api.weatherapi.com/v1/forecast.json?key=d14d9458d2b2417c8b4122331230407&q=Gaza&days=7';
    final response = await http.get(Uri.parse(apiUrl));
    print(response);
    if (response.statusCode == 200) {
      final jsonBody = json.decode(response.body);
      final List<dynamic> dailyData = jsonBody['forecast']['forecastday'];

      return dailyData
          .map((data) => WeatherData.fromJson(data['date'], data['day']))
          .toList();
    } else {
      throw Exception('Failed to fetch weather data');
    }
  }

}
