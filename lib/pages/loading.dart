import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  // void getData() async {
  //   // // Simulate network request for a user
  //   // // await keeps other function to remain in stack until complets the await defined function
  //   // String user = await Future.delayed(Duration(seconds: 3), () {
  //   //   return "Numan Ibn Mazid";
  //   // });

  //   // // Simulate network request for a user bio
  //   // String bio = await Future.delayed(Duration(seconds: 2), () {
  //   //   return "Vegan, Musician && Egg Collector";
  //   // });

  //   // print("$user - $bio");

  //   Response response = await get("https://jsonplaceholder.typicode.com/todos/1");
  //   // print(response.body);
  //   Map data = jsonDecode(response.body);
  //   print(data);
  //   print(data['title']);
  // }
  // String time = 'loading';

  void setupWorldTime() async {
    WorldTime instance =
        WorldTime(location: 'Dhaka', flag: 'dhaka.png', url: 'Asia/Dhaka');
    await instance.getTime();
    // print(instance.time);

    // setState(() {
    //   time = instance.time;
    // });

    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDayTime': instance.isDayTime
    });
  }

  @override
  void initState() {
    // Run at first inititlization
    super.initState();
    // print("initSstate function ran.");
    // getData();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child: SpinKitFadingCube(
          color: Colors.white,
          size: 90.0,
        ),
      )
    );
  }
}
