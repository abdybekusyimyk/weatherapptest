class WeatherModel {
  WeatherModel({
    // required this.id,
    required this.main,
    required this.icon,
    required this.temp,
    required this.tempmin,
    required this.tempmax,
    this.name,
  });
  // final String? id;
  final String? main;
  final String icon;
  final dynamic temp;
  final dynamic tempmin;
  final dynamic tempmax;
  final String? name;
}
