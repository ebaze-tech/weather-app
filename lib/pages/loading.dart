import 'package:flutter/material.dart';
import 'package:weather_app/pages/services/world_time.dart'; // Correct your import path

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String time = 'Loading...';

  // Mark the function as async
  void setupWorldTime() async {
    WorldTime instance = WorldTime(
        location: 'Berlin', flag: 'germany.png', url: 'Europe/Berlin');
    await instance.getTime();

    // Update the state to reflect the fetched time
    setState(() {
      time = instance.time;
    });

    print(instance.time);
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime(); // Call the async function here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Text(time), // Display the fetched time
      ),
    );
  }
}
