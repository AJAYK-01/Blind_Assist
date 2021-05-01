import 'package:flutter/material.dart';
import 'package:maps_launcher/maps_launcher.dart';

void main() {
  runApp(MyApp());

  // MapsLauncher.launchCoordinates(37.4220041, -122.0862462);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Blind Assist App'),
        ),
        body: Center(
          child: TextButton(
            child: Text('Google Maps'),
            onPressed: () {
              MapsLauncher.launchQuery(
                  '1600 Amphitheatre Pkwy, Mountain View, CA 94043, USA');
              debugPrint('Button works');
            },
          ),
        ),
      ),
    );
  }
}
