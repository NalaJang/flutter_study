import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

class Model {

  Widget? getWeatherIcon(int condition) {
    if( condition < 300 ) {
      return SvgPicture.asset(
        'svg/climacon-colud_lightning.svg',
        color: Colors.black87,
      );

    } else if( condition < 600 ) {
      return SvgPicture.asset(
        'svg/climacon-cloud_snow_alt.svg',
        color: Colors.black87,
      );

    } else if( condition == 800 ) {
      return SvgPicture.asset(
        'svg/climacon-sun.svg',
        color: Colors.black87,
      );

    } else if( condition <= 804 ) {
      return SvgPicture.asset(
        'svg/climacon-cloud_sun.svg',
        color: Colors.black87,
      );
    }
  }

  String? getAirPollutionIcon(int condition) {
    if( condition == 1 ) {
      return 'image/good.png';

    } else if( condition == 2 ) {
      return 'image/fair.png';

    } else if( condition == 3 ) {
      return 'image/moderate.png';

    } else if( condition == 4 ) {
      return 'image/poor.png';

    } else if( condition == 5 ) {
      return 'image/bad.png';
    }

  }

}