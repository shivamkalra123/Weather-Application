import 'package:flutter_application_1/model/http_helper.dart';
import 'package:flutter_application_1/model/weather.dart';
import 'package:flutter/material.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  TextEditingController textController = TextEditingController();
  Weather result = Weather('', '', 0, 0, 0, 0);
  late String weatherImageAsset = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather Screen'),
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.all(15),
              child: TextField(
                controller: textController,
                decoration: InputDecoration(
                  hintText: 'Enter City Name',
                  suffixIcon: IconButton(
                    icon: Icon(Icons.search),
                    onPressed: getData,
                  ),
                ),
              ),
            ),
            weatherRow('Place: ', result.name),
            weatherRow('Description: ', result.description),
            weatherRow(
              'Temperature: ',
              result.temperature.toStringAsFixed(2),
            ),
            weatherRow(
              'Feels Like: ',
              result.preceived.toStringAsFixed(2),
            ),
            weatherRow(
              'Pressure: ',
              result.pressure.toStringAsFixed(2),
            ),
            weatherRow(
              'Humidity: ',
              result.humidity.toStringAsFixed(2),
            ),
            SizedBox(height: 20),
            // Display weather image
            if (weatherImageAsset.isNotEmpty)
              Image.asset(
                weatherImageAsset,
                width: 100,
                height: 100,
              ),
          ],
        ),
      ),
    );
  }

  Future getData() async {
    HttpHelper httpHelper = HttpHelper();
    result = await httpHelper.getWeather(textController.text);
    setState(() {
      result;
      // Set the weather image asset based on the description
      setWeatherImage(result.description);
    });
  }

  Widget weatherRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Text(
              label,
              style: TextStyle(
                fontSize: 20,
                color: Theme.of(context).hintColor,
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Text(
              value,
              style: TextStyle(
                fontSize: 20,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void setWeatherImage(String description) {
    // Map weather descriptions to image assets
    Map<String, String> weatherImages = {
      'Clear': 'assests/Clear.jpg',
      'Clouds': 'assests/Cloudy.jpg',
      'Rain': 'assests/rainy.jpg',

      // Add more mappings as needed
    };

    // Set the image asset based on the description, if available
    if (weatherImages.containsKey(description)) {
      weatherImageAsset = weatherImages[description]!;
    }
  }
}
