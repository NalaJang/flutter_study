import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timer_builder/timer_builder.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/model/model.dart';

class WeatherScreenState extends StatefulWidget {
  const WeatherScreenState({super.key, this.parseWeatherData, this.parseAirPollutionData});

  // 다양한 타입의 날씨 데이터를 전달 받기 때문에 타입을 dynamic 또는 따로 적지 않는다.
  final dynamic parseWeatherData;
  final dynamic parseAirPollutionData;

  @override
  State<WeatherScreenState> createState() => _WeatherScreenStateState();
}

class _WeatherScreenStateState extends State<WeatherScreenState> {

  Model model = Model();
  var date = DateTime.now();

  String? cityName;

  // 날씨 정보
  int? temp;
  Widget? icon;
  String? des;

  // 대기 지수
  int? aqi;
  String? aqiIcon;
  double? pm10; // 미세먼지
  double? pm25; // 초미세먼지
  String? airCondition;

  @override
  void initState() {
    super.initState();

    updateData(widget.parseWeatherData, widget.parseAirPollutionData);

  }

  void updateData(dynamic weatherData, dynamic airPollutionData) {
    double doubleTemp = weatherData['main']['temp'];
    int condition = weatherData['weather'][0]['id'];

    cityName = weatherData['name'];
    temp = doubleTemp.toInt();
    icon = model.getWeatherIcon(condition);
    des = weatherData['weather'][0]['description'];

    aqi = airPollutionData['list'][0]['main']['aqi'];
    aqiIcon = model.getAirPollutionIcon(aqi!);
    pm10 = airPollutionData['list'][0]['components']['co'];
    pm25 = airPollutionData['list'][0]['components']['o3'];
    airCondition = model.getAirCondition(aqi!);
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
                              '$cityName',
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
                              '$temp\u2103',
                              style: GoogleFonts.lato(
                                  fontSize: 85.0,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.white
                              ),
                            ),
                            Row(
                              children: [
                                icon!,
                                SizedBox(
                                  width: 10.0,
                                ),
                                Text(
                                  '$des',
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          // 대기 지수
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
                                '$aqiIcon',
                                width: 37.0,
                                height: 35.0,
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                '$airCondition',
                                style: GoogleFonts.lato(
                                    fontSize: 14.0,
                                    color: Colors.black87,
                                  fontWeight: FontWeight.bold
                                ),
                              )
                            ],
                          ),

                          // 미세 먼지
                          Column(
                            children: [
                              Text(
                                '미세먼지',
                                style: GoogleFonts.lato(
                                    fontSize: 14.0,
                                    color: Colors.white
                                ),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                '$pm10',
                                style: GoogleFonts.lato(
                                    fontSize: 24.0,
                                    color: Colors.white
                                ),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                '㎍/m3',
                                style: GoogleFonts.lato(
                                    fontSize: 14.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold
                                ),
                              )
                            ],
                          ),

                          // 초미세먼지
                          Column(
                            children: [
                              Text(
                                '초미세먼지',
                                style: GoogleFonts.lato(
                                    fontSize: 14.0,
                                    color: Colors.white
                                ),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                '$pm25',
                                style: GoogleFonts.lato(
                                    fontSize: 24.0,
                                    color: Colors.white
                                ),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                '㎍/m3',
                                style: GoogleFonts.lato(
                                    fontSize: 14.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold
                                ),
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),


                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
