import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location;  // location name for the UI
  String time;  // time in that location
  String flag;  // URL to an asset flag icon
  String url;  // Location URL for api endpoint
  bool isDayTime;  // true or false if daytime or not

  WorldTime({ this.location, this.flag, this.url });


  // Future is like promise in javascript
  Future<void> getTime() async {

    try {
      // Make the request
      Response response = await get("http://worldtimeapi.org/api/timezone/$url");
      Map data = jsonDecode(response.body);
      // print(data);

      // Get properties from data
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1,3);  // +06:00
      // print(datetime);
      // print(offset);  // 06

      // Create DateTime object
      DateTime now = DateTime.parse(datetime);
      // print(now);  // 2020-06-16 19:33:46.671992Z
      now = now.add(Duration(hours: int.parse(offset)));
      // print(now);  // 2020-06-17 01:33:46.671992Z

      // Set the time property of the class
      // time = now.toString();

      // isDayTime = condition ? trueCase : falseCase;
      // Set isDayTime Property
      isDayTime = now.hour > 6 && now.hour < 20 ? true : false;

      time = DateFormat.jm().format(now);
    } 
    catch(e) {
      // print('Cought Error: $e');
      time = "Could not get time data!";
    }

    

  }
}


// WorldTime instance = WorldTime(location: 'Dhaka', flag: 'dhaka.png', url: 'Asia/Dhaka');
// var result = instance.getTime();
// print(result);