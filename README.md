# unitone_task

# FlutterWeather

A simple weather App created using [Flutter](https://flutter.dev/) and [Dart](https://dart.dev/) and using API from [OpenWeatherMap](https://openweathermap.org/)

## Features
- Automatically acquire user current location
- Searchable location
- Hourly weather information
- 7 days weather information 

## How to Run
1. Create an account at [OpenWeatherMap](https://openweathermap.org/).
2. Then get your API key from https://home.openweathermap.org/api_keys.
3. Clone the repo
   ```sh
   git clone https://github.com/ArizArmeidi/FlutterWeather.git
   ```
4. Install all the packages by typing
   ```sh
   flutter pub get
   ```
5. Navigate to **lib/provider/weatherProvider.dart** and paste your API key to the apiKey variable
   ```dart
   String apiKey = 'Paste Your API Key Here';
   ```
6. Run the App