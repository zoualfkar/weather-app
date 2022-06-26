import 'package:flutter/material.dart';

import '../../../../../core/common/widget/text_view.dart';

class WeatherDayWidget extends StatelessWidget {

 final String day;
 final String icon;
 final String temp;
 final Function onTap;

  const WeatherDayWidget({
    required this.day,
    required this.icon,
    required this.temp,
    required this.onTap,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextButton(
        style: TextButton.styleFrom(padding: EdgeInsets.zero),
        onPressed: (){onTap();},
        child: Column(
          children: [

            TextView(
              text: day,
              style: Theme.of(context).textTheme.subtitle2,
            )
            ,
            Image.network(
                'http://openweathermap.org/img/wn/$icon@2x.png',
            width: MediaQuery.of(context).size.width/5,
            ),
            TextView(
              text: temp+ "\u2103",
              style: Theme.of(context).textTheme.bodyText2,
            )

          ],
        ),
      ),
    );
  }
}
