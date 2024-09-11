import 'package:http/http.dart'; // for making HTTP requests
import 'dart:convert'; // for converting JSON data

class WorldTime {
  String location; // location name for the UI
  String time = ''; // the time in a specific location
  String flag; // url to an asset flag icon
  String url; // location url for api endpoint

  // Constructor using named parameters
  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {
    try {
      // Make the HTTP request
      Response response =
          await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));

      if (response.statusCode == 200) {
        Map data = jsonDecode(response.body);

        // Get properties from 'data'
        String dateTime = data['datetime'];
        String utcOffset = data['utc_offset']; // Format like +01:00 or -05:30
        String offsetSign = utcOffset.substring(0, 1); // '+' or '-'
        int offsetHours = int.parse(utcOffset.substring(1, 3));
        int offsetMinutes = int.parse(utcOffset.substring(4, 6));

        // Create a DateTime object
        DateTime now = DateTime.parse(dateTime);

        // Adjust for the offset (positive or negative)
        if (offsetSign == '+') {
          now = now.add(Duration(hours: offsetHours, minutes: offsetMinutes));
        } else {
          now = now
              .subtract(Duration(hours: offsetHours, minutes: offsetMinutes));
        }

        // Set the time property
        time = now.toString();
        print('Time in $location: $time');
      } else {
        print('Failed to load data: ${response.statusCode}');
        time = 'Could not fetch time data';
      }
    } catch (e) {
      print("Error: $e");
      time = 'Could not get time data';
    }
  }
}
