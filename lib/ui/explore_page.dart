import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/utils/data.dart';

class ExplorePage extends StatefulWidget {
  @override
  _ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          right: -MediaQuery.of(context).size.height / 7.32,
          top: -MediaQuery.of(context).size.height / 7.32,
          child: Container(
            height: MediaQuery.of(context).size.height / 2.44,
            width: MediaQuery.of(context).size.width / 1.2,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              shape: BoxShape.circle,
            ),
          ),
        ),
        Positioned(
          bottom: MediaQuery.of(context).size.height / 4.06,
          left: -MediaQuery.of(context).size.height / 73.2,
          child: Container(
            height: MediaQuery.of(context).size.height / 14.64,
            width: MediaQuery.of(context).size.width / 7.2,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              shape: BoxShape.circle,
            ),
          ),
        ),
        Positioned(
          bottom: MediaQuery.of(context).size.height / 4.06,
          left: MediaQuery.of(context).size.height / 14.64,
          child: Container(
            height: MediaQuery.of(context).size.height / 36.6,
            width: MediaQuery.of(context).size.height / 36.6,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              shape: BoxShape.circle,
            ),
          ),
        ),
        Positioned(
          bottom: MediaQuery.of(context).size.height / 3.32,
          left: MediaQuery.of(context).size.height / 10.45,
          child: Container(
            height: MediaQuery.of(context).size.height / 36.6,
            width: MediaQuery.of(context).size.height / 36.6,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              shape: BoxShape.circle,
            ),
          ),
        ),
        ListView(
          children: [
            CarouselSlider.builder(
              options: CarouselOptions(
                height: MediaQuery.of(context).size.height / 1.22,
                enableInfiniteScroll: true,
                autoPlay: false,
                disableCenter: true,
                initialPage: 0,
                enlargeCenterPage: false,
                viewportFraction: 1,
                onPageChanged: (index, reason) {
                  setState(() {
                    currentIndex = index;
                  });
                },
              ),
              itemCount: cityData.length,
              itemBuilder: (BuildContext context, int index) => Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Center(
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height / 7.32),
                      child: Text(
                        cityData[index]['city'],
                        style: GoogleFonts.roboto(
                          fontSize: MediaQuery.of(context).size.height / 29.28,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF101859),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 73.2,
                  ),
                  Text(
                    'Chances of Rain : ' +
                        cityData[index]['chances_rain'].toString(),
                    style: GoogleFonts.roboto(
                      fontSize: MediaQuery.of(context).size.height / 48.8,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 14.64,
                  ),
                  Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(
                            MediaQuery.of(context).size.height / 24.4,
                            MediaQuery.of(context).size.height / 24.4,
                            0,
                            0),
                        height: MediaQuery.of(context).size.height / 3.66,
                        width: MediaQuery.of(context).size.width / 1.8,
                        child: cityData[index]['weather'] == 'Sunny'
                            ? LottieBuilder.asset(
                                'assets/animations/4800-weather-partly-cloudy.json')
                            : cityData[index]['weather'] == 'Rainy'
                                ? LottieBuilder.asset(
                                    'assets/animations/4803-weather-storm.json')
                                : LottieBuilder.asset(
                                    'assets/animations/4795-weather-mist.json'),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                            MediaQuery.of(context).size.height / 73.2,
                            MediaQuery.of(context).size.height / 24.4,
                            0,
                            0),
                        child: Text(
                          cityData[index]['temp'] +
                              String.fromCharCodes(Runes('\u00B0')),
                          style: GoogleFonts.roboto(
                            fontSize: MediaQuery.of(context).size.height / 6.1,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF101859),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 14.64,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.height / 24.4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                  bottom: MediaQuery.of(context).size.height /
                                      48.8),
                              height: MediaQuery.of(context).size.height / 24.4,
                              width: MediaQuery.of(context).size.height / 24.4,
                              child: Image.asset(
                                  'assets/icons/icons8-wind-64.png'),
                            ),
                            Text(
                              'Wind : ' + cityData[index]['wind'] + ' km/h',
                              style: GoogleFonts.roboto(
                                fontSize:
                                    MediaQuery.of(context).size.height / 48.8,
                                color: Color(0xFF101859),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                  bottom: MediaQuery.of(context).size.height /
                                      48.8),
                              height: MediaQuery.of(context).size.height / 24.4,
                              width: MediaQuery.of(context).size.height / 24.4,
                              child: Image.asset(
                                  'assets/icons/icons8-water-100.png'),
                            ),
                            Text(
                              'Humidity : ' + cityData[index]['humidity'] + '%',
                              style: GoogleFonts.roboto(
                                fontSize:
                                    MediaQuery.of(context).size.height / 48.8,
                                color: Color(0xFF101859),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            DotsIndicator(
              dotsCount: cityData.length,
              position: currentIndex.toDouble(),
              decorator: DotsDecorator(
                size: Size.square(MediaQuery.of(context).size.height / 73.2),
                activeSize: Size(MediaQuery.of(context).size.height / 36.6,
                    MediaQuery.of(context).size.height / 73.2),
                color: Colors.grey,
                activeColor: Color(0xFF101859),
                activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
