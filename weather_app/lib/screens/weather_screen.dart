import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:timer_builder/timer_builder.dart';
import 'package:intl/intl.dart';

class WeatherScreenState extends StatefulWidget {
  const WeatherScreenState({super.key, this.parseWeatherData});

  // 다양한 타입의 날씨 데이터를 전달 받기 때문에 타입을 dynamic 또는 따로 적지 않는다.
  final dynamic parseWeatherData;

  @override
  State<WeatherScreenState> createState() => _WeatherScreenStateState();
}

class _WeatherScreenStateState extends State<WeatherScreenState> {

  String? cityName;
  int? temp;
  var date = DateTime.now();

  @override
  void initState() {
    super.initState();

    updateData(widget.parseWeatherData);

  }

  void updateData(dynamic weatherData) {
    cityName = weatherData['name'];
    double doubleTemp = weatherData['main']['temp'];
    temp = doubleTemp.toInt();
  }

  String getSystemTime() {
    var now = DateTime.now();
    return DateFormat("h:mm a").format(now);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        // 좌측 아이콘일 때는 leading 속성 사용
        leading: IconButton(
          icon: Icon(Icons.near_me),
          onPressed: (){},
          iconSize: 30.0,
        ),

        // 우측 아이콘일 때는 actions 사용
        actions: [
          IconButton(
            onPressed: (){},
            icon: Icon(Icons.location_searching),
            iconSize: 30.0,
          ),

        ],
      ),

      body: Container(
        child: Stack(
          children: [
            Image.asset('image/background.jpg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
            ),

            Container(
              padding: EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  // 날짜 정보와 날씨 정보의 column 을 띄우기 위해 spaceBetween 를 사용했지만
                  // 날씨 정보의 column 은 이미 충분한 공간을 사용하고 있기 때문에 공간이 떨어지지 않는다.
                  // 그래서 Expanded widget 으로 공간을 억지로 떨어뜨리게 한다.
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 150.0,
                            ),
                            Text(
                              'Seoul',
                              style: GoogleFonts.lato(
                                fontSize: 35.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white
                              ),
                            ),
                            Row(
                              children: [
                                TimerBuilder.periodic(
                                    (Duration(minutes: 1)),

                                    // builder widget 은 반드시 widget 을 return 해야 한다.
                                    builder: (context){
                                      print(getSystemTime());
                                      return Text(
                                        '${getSystemTime()}',
                                        style: GoogleFonts.lato(
                                          fontSize: 16.0,
                                          color: Colors.white
                                        ),
                                      );
                                    },
                                ),
                                Text(
                                  DateFormat(' - EEEE, ').format(date),
                                  style: GoogleFonts.lato(
                                      fontSize: 16.0,
                                      color: Colors.white
                                  ),
                                ),
                                Text(
                                  DateFormat('d MMM, yyy').format(date),
                                  style: GoogleFonts.lato(
                                      fontSize: 16.0,
                                      color: Colors.white
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),

                        // 날씨 정보를 위한 column
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '18\u2103',
                              style: GoogleFonts.lato(
                                  fontSize: 85.0,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.white
                              ),
                            ),
                            Row(
                              children: [
                                SvgPicture.asset('svg/climacon-sun.svg'),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Text(
                                  'clear sky',
                                  style: GoogleFonts.lato(
                                    fontSize: 16.0,
                                    color: Colors.white
                                  ),
                                )
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),

                  // 대기 지수를 보여주기 위한 column
                  Column(
                    children: [
                      Divider(
                        height: 15.0,
                        thickness: 2.0,
                        color: Colors.white30,
                      ),

                      Row(
                        children: [
                          Column(
                            children: [
                              Text(
                                'AQI(대기질지수)',
                                style: GoogleFonts.lato(
                                    fontSize: 14.0,
                                    color: Colors.white
                                ),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Image.asset(
                                'image/bad.png',
                                width: 37.0,
                                height: 35.0,
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                '"매우 나쁨"',
                                style: GoogleFonts.lato(
                                    fontSize: 14.0,
                                    color: Colors.black87,
                                  fontWeight: FontWeight.bold
                                ),
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
