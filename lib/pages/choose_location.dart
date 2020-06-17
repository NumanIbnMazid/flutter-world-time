import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  // void getData() async {
  //   // Simulate network request for a user
  //   // await keeps other function to remain in stack until complets the await defined function
  //   String user = await Future.delayed(Duration(seconds: 3), () {
  //     return "Numan Ibn Mazid";
  //   });

  //   // Simulate network request for a user bio
  //   String bio = await Future.delayed(Duration(seconds: 2), () {
  //     return "Vegan, Musician && Egg Collector";
  //   });

  //   print("$user - $bio");
  // }
  
  // @override
  // void initState() {
  //   // Run at first inititlization
  //   super.initState();
  //   // print("initSstate function ran.");
  //   // getData();
  // }


  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', location: 'London', flag: 'gb.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'gr.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'eg.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'ke.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'us.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'kr.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'id.png'),
    WorldTime(url: 'Asia/Dhaka', location: 'Dhaka', flag: 'bd.png'),
  ];

  void updateTime(index) async {
    // print(index);
    WorldTime instance = locations[index];

    await instance.getTime();

    // Navigate to home screen
    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDayTime': instance.isDayTime
    });
  }


  @override
  Widget build(BuildContext context) {
    // Re Run everytime when the build function calls. EX: when calling setState method.
    // print("Build function ran.");
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text("Choose a Location"),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
            child: Card(
              child: ListTile(
                onTap: () {
                  // print(locations[index].location);
                  updateTime(index);
                },
                title: Text(
                  locations[index].location,
                ),
                leading: CircleAvatar(
                  backgroundImage: AssetImage(
                    'assets/images/flags/${locations[index].flag}'
                  ),
                ),
              ),
            ),
          );
        },
        itemCount: locations.length,
      ),
    );
  }
}