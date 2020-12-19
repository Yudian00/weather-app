import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:weather_app/ui/detail_page.dart';
import 'package:weather_app/utils/data.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime now = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          right: -MediaQuery.of(context).size.height / 7.32,
          top: -MediaQuery.of(context).size.height / 7.32,
          child: Container(
            height: MediaQuery.of(context).size.height / 2.44,
            width: MediaQuery.of(context).size.height / 2.44,
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
            width: MediaQuery.of(context).size.width / 18,
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
            width: MediaQuery.of(context).size.width / 18,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              shape: BoxShape.circle,
            ),
          ),
        ),
        ListView(
          children: [
            Container(
              padding: EdgeInsets.all(MediaQuery.of(context).size.width / 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Good\nMorning',
                        style: GoogleFonts.roboto(
                          fontSize: MediaQuery.of(context).size.height / 18.3,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 73.2,
                      ),
                      Text(
                        'Monday, 21 December 2020',
                        style: GoogleFonts.roboto(
                          fontSize: MediaQuery.of(context).size.height / 52.28,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 73.2,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.height / 24.4),
              child: Container(
                height: MediaQuery.of(context).size.height / 14.64,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  // color: Colors.red,
                  borderRadius: BorderRadius.circular(
                      MediaQuery.of(context).size.height / 36.6),
                  border: Border.all(
                    color: Colors.grey,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.height / 36.6),
                      child: Text(
                        'Search location..',
                        style: GoogleFonts.roboto(),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          right: MediaQuery.of(context).size.height / 36.6),
                      child: Icon(
                        Icons.search_outlined,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 24.4,
            ),
            CarouselSlider.builder(
              itemCount: 5,
              options: CarouselOptions(
                height: MediaQuery.of(context).size.height / 3.66,
                enableInfiniteScroll: true,
                autoPlay: false,
                disableCenter: true,
                initialPage: 0,
                enlargeCenterPage: false,
                viewportFraction: 0.8,
                onPageChanged: (index, reason) {},
              ),
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.fade,
                          child: DetailPage(
                            index: index,
                          )));
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  width: MediaQuery.of(context).size.width / 1.28,
                  height: MediaQuery.of(context).size.height / 7.32,
                  decoration: BoxDecoration(
                    color: Color(0xFFe0eef9),
                    borderRadius: BorderRadius.circular(
                        MediaQuery.of(context).size.height / 36.6),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(
                                      MediaQuery.of(context).size.height /
                                          36.6),
                                  child: Text(
                                    cityData[index]['city'],
                                    style: GoogleFonts.roboto(
                                      fontSize:
                                          MediaQuery.of(context).size.height /
                                              48.8,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: MediaQuery.of(context).size.height /
                                          36.6),
                                  child: Text(
                                    cityData[index]['temp'].toString() +
                                        '\u2103',
                                    style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.height /
                                              24.4,
                                      fontWeight: FontWeight.w900,
                                      color: Color(0xFF101859),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                right:
                                    MediaQuery.of(context).size.height / 36.6),
                            height: MediaQuery.of(context).size.height / 6.65,
                            width: MediaQuery.of(context).size.width / 3.27,
                            child: cityData[index]['weather'] == 'Sunny'
                                ? Image.asset('assets/icons/icons8-sun-500.png')
                                : cityData[index]['weather'] == 'Cloudy'
                                    ? Image.asset(
                                        'assets/icons/icons8-clouds-100.png')
                                    : Image.asset(
                                        'assets/icons/icons8-wind-100.png'),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 73.2,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height / 14.64,
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.height / 36.6),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(
                              MediaQuery.of(context).size.height / 73.2),
                        ),
                        child: Center(
                          child: Text(
                            cityData[index]['time'],
                            style: GoogleFonts.roboto(
                              fontSize:
                                  MediaQuery.of(context).size.height / 40.67,
                              letterSpacing: 4,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF101859),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 29.28,
            ),
            Padding(
              padding:
                  EdgeInsets.all(MediaQuery.of(context).size.height / 36.6),
              child: Text(
                'Your City',
                style: GoogleFonts.roboto(
                  fontWeight: FontWeight.bold,
                  fontSize: MediaQuery.of(context).size.height / 29.28,
                ),
              ),
            ),
            GestureDetector(
              onTap: () => Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.fade,
                      child: DetailPage(
                        index: 7,
                      ))),
              child: Container(
                margin: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.height / 36.6),
                height: MediaQuery.of(context).size.height / 4.88,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color(0xFFe0eef9),
                  borderRadius: BorderRadius.circular(
                      MediaQuery.of(context).size.height / 36.6),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.height / 36.6,
                              top: MediaQuery.of(context).size.height / 36.6,
                              bottom: MediaQuery.of(context).size.height / 73.2,
                            ),
                            child: Text(
                              cityData[7]['city'],
                              style: GoogleFonts.roboto(
                                fontSize:
                                    MediaQuery.of(context).size.height / 45.75,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left:
                                    MediaQuery.of(context).size.height / 36.6),
                            child: Text(
                              cityData[7]['temp'] + '\u2103',
                              style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.height / 14.64,
                                fontWeight: FontWeight.w900,
                                color: Color(0xFF101859),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left:
                                    MediaQuery.of(context).size.height / 36.6),
                            child: Text(
                              'Chances of raining : 56%',
                              style: GoogleFonts.roboto(
                                fontSize:
                                    MediaQuery.of(context).size.height / 61,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(
                            right: MediaQuery.of(context).size.height / 36.6),
                        height: MediaQuery.of(context).size.height / 4.88,
                        width: MediaQuery.of(context).size.width / 2.4,
                        child: Image.asset('assets/icons/icons8-rain-100.png'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 73.2,
            ),
          ],
        ),
      ],
    );
  }
}
