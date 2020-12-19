import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/utils/data.dart';

class DetailPage extends StatefulWidget {
  final int index;

  DetailPage({
    @required this.index,
  });

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height / 73.2,
                          right: MediaQuery.of(context).size.height / 2.44,
                        ),
                        height: MediaQuery.of(context).size.height / 14.64,
                        width: MediaQuery.of(context).size.width / 7.2,
                        child: Icon(Icons.arrow_back_ios),
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.width / 18),
                        child: Text(
                          cityData[widget.index]['city'],
                          style: GoogleFonts.roboto(
                            fontSize:
                                MediaQuery.of(context).size.height / 29.28,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF101859),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 73.2,
                ),
                Text(
                  "Today's weather",
                  style: GoogleFonts.roboto(
                    fontSize: MediaQuery.of(context).size.height / 48.8,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 24.4,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Text(
                        cityData[widget.index]['temp'] +
                            String.fromCharCodes(Runes('\u00B0')),
                        style: GoogleFonts.roboto(
                          fontSize: MediaQuery.of(context).size.height / 12.2,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF101859),
                        ),
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height / 7.32,
                      width: MediaQuery.of(context).size.width / 3.6,
                      child: cityData[widget.index]['weather'] == 'Sunny'
                          ? LottieBuilder.asset(
                              'assets/animations/4800-weather-partly-cloudy.json')
                          : cityData[widget.index]['weather'] == 'Rainy'
                              ? LottieBuilder.asset(
                                  'assets/animations/4803-weather-storm.json')
                              : LottieBuilder.asset(
                                  'assets/animations/4795-weather-mist.json'),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 24.4,
                ),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height / 1.83,
                      width: MediaQuery.of(context).size.width / 1.2,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height / 36.6),
                      height: MediaQuery.of(context).size.height / 1.83,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40),
                        ),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height / 36.6),
                            height: MediaQuery.of(context).size.height / 146.4,
                            width: MediaQuery.of(context).size.height / 14.64,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(
                                MediaQuery.of(context).size.height / 36.6),
                            child: Text(
                              'Future weather',
                              style: GoogleFonts.roboto(
                                fontSize:
                                    MediaQuery.of(context).size.height / 36.6,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF101859),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 73.2,
                          ),
                          Column(
                            children: [
                              futureWeather('1'),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height / 24.4,
                              ),
                              futureWeather('2'),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height / 24.4,
                              ),
                              futureWeather('3'),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget futureWeather(String index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          height: MediaQuery.of(context).size.height / 10.45,
          width: MediaQuery.of(context).size.width / 5.14,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey[100],
          ),
          child: Center(
            child: Container(
              height: MediaQuery.of(context).size.height / 18.3,
              width: MediaQuery.of(context).size.width / 9,
              child: futureWeatherData[widget.index][index] == 'Sunny'
                  ? LottieBuilder.asset(
                      'assets/animations/4800-weather-partly-cloudy.json')
                  : futureWeatherData[widget.index][index] == 'Rainy'
                      ? LottieBuilder.asset(
                          'assets/animations/4803-weather-storm.json')
                      : LottieBuilder.asset(
                          'assets/animations/4795-weather-mist.json'),
            ),
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height / 10.45,
          width: MediaQuery.of(context).size.width / 2.76,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.white,
            border: Border.all(
              color: Color(0xFF101859),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                futureTemp[widget.index][index] +
                    String.fromCharCodes(Runes('\u00B0')),
                style: GoogleFonts.roboto(
                  fontSize: MediaQuery.of(context).size.height / 29.28,
                  color: Color(0xFF101859),
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                futureWeatherData[widget.index][index],
                style: GoogleFonts.roboto(
                  fontSize: MediaQuery.of(context).size.height / 48.8,
                  color: Color(0xFF101859),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
