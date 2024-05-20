// This class is a blueprint for creating Weather objects in your program.
class Weather {
  // We want to know
  // cityName, temperature and mainCondition (cloud, sunny etc.)
  final String cityName;
  final double temperature;
  final String mainCondition;

  // The Weather class has three instance variables: cityName, temperature, and mainCondition.

  // Constructor for our Weather class
  // A constructor is a special method that is used to initialize objects of a class.
  // This constructor takes three named parameters: cityName, temperature, and mainCondition
  // The this keyword before each parameter name is used to assign the incoming parameter values to the corresponding instance variables of the class.
  // The required keyword in Dart indicates that these parameters must be provided when creating a new Weather object.
  Weather({
    required this.cityName,
    required this.temperature,
    required this.mainCondition
  });

  // method to deal with JSON file
  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
    cityName: json['name'],
    temperature: json['main']['temp'].toDouble(),
    mainCondition: json['weather'][0]['main'],
    );
  }
}
