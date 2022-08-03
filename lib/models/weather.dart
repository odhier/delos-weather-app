// ignore_for_file: non_constant_identifier_names

class Weather{
  final int timeStamp;
  final String title;
  final String description;
  final double temp;
  final double temp_min;
  final double temp_max;
  final String icon;

  Weather({
    required this.timeStamp, 
    required this.title, 
    required this.description,
    required this.temp,
    required this.temp_min,
    required this.temp_max, 
    required this.icon});
  
  factory Weather.fromJson(dynamic json){
    return Weather(
        timeStamp: json['dt'],
        title: json['weather'][0]['main'],
        description: json['weather'][0]['description'],
        temp: json['main']['temp'],
        temp_min: json['main']['temp_min'],
        temp_max: json['main']['temp_max'],
        icon: "http://openweathermap.org/img/wn/"+json['weather'][0]['icon']+"@2x.png");
  }

  static List<Weather> weatherFromSnapshot(List snapshot){
    return snapshot.map((data){
      return Weather.fromJson(data);
    }).toList();
  }
}