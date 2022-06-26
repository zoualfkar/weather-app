import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/src/core/common/widget/card_view.dart';
import 'package:weather_app/src/core/common/widget/text_view.dart';
import 'package:weather_app/src/features/home_page/domain/entities/weather_day_entity.dart';

import '../../../../core/common/widget/animation_scale_widget.dart';
import '../../../../core/utils/helpers/date_formatter.dart';

class SecondPage extends StatelessWidget {

  final WeatherDayEntity weatherDayEntity;

  const SecondPage({
    required this.weatherDayEntity,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0098b1),
      extendBody: false,
      appBar: AppBar(
        backgroundColor: Color(0xff053d75).withOpacity(0.4),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child:Column(
          children: [

           Container(
             height: 150,
             color: Color(0xff053d75).withOpacity(0.4),
             child: Padding(
               padding: const EdgeInsets.symmetric(horizontal: 20),
               child: Column(
                 children: [
                   Row(children: [
                     TextView(
                       text: formatStringDate1( weatherDayEntity.date),
                       style: Theme.of(context).textTheme.headline5,
                     ),
                     Spacer(),
                     TextView(
                       text:"${weatherDayEntity.temp}\u2103",
                       style: Theme.of(context).textTheme.headline5,
                     ),
                     SizedBox(width: 5,),
                     TextView(
                       text: "${weatherDayEntity.temp}\u2103",
                       style: Theme.of(context).textTheme.headline5!.copyWith(
                         color: Colors.white70
                       ),
                     )
                   ],),
                   const SizedBox(height: 20,),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                     itemData(context, 'Wind', '${weatherDayEntity.groundLevel}'),
                     itemData(context, 'humidity', '${weatherDayEntity.humidity}'),

                   ],),
                   const SizedBox(height: 10,),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       itemData(context, 'Viability', '${weatherDayEntity.visibility}'),
                       itemData(context, 'Feels like', '${weatherDayEntity.feelsLike}'),

                     ],)
                 ],
               ),
             ),
           ),

            const SizedBox(height: 24,),

            Center(
              child: TextView(
                text: '${weatherDayEntity.weatherMain}',
                style: Theme.of(context).textTheme.headline3,
              ),
            ),

            const SizedBox(height: 15,),

            Center(
              child: TextView(
                text: '${weatherDayEntity.weatherDes}',
                style: Theme.of(context).textTheme.headline5,
              ),
            ),

            const SizedBox(height: 24,),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [

                  AnimationScaleWidget(
                    position:1,
                    child: CardView(

                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextView(
                                text: 'ground level',
                                style: Theme.of(context).textTheme.headline5,
                              ),
                              TextView(
                                text: '${weatherDayEntity.groundLevel}',
                                style: Theme.of(context).textTheme.headline5,
                              ),
                            ],
                          ),
                        )),
                  ),

                  const SizedBox(height: 24,),


                  AnimationScaleWidget(
                    position:3,
                    child: CardView(
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextView(
                                text: 'Sea level',
                                style: Theme.of(context).textTheme.headline5,
                              ),
                              TextView(
                                text: '${weatherDayEntity.seeLevel}',
                                style: Theme.of(context).textTheme.headline5,
                              ),
                            ],
                          ),
                        )),
                  ),


                  const SizedBox(height: 24,),


                  AnimationScaleWidget(
                    position:4,
                    child: CardView(
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextView(
                                text: 'pressure',
                                style: Theme.of(context).textTheme.headline5,
                              ),
                              TextView(
                                text: '${weatherDayEntity.pressure}',
                                style: Theme.of(context).textTheme.headline5,
                              ),
                            ],
                          ),
                        )),
                  )
                ],
              ),
            ),
            const SizedBox(height: 24,),

            Center(
              child: TextView(
                text: formatStringDate( weatherDayEntity.date),
                style: Theme.of(context).textTheme.headline5,
              ),
            )


        ],),
      ),
    );
  }


  itemData(context,title ,data){
   return SizedBox(
     width: MediaQuery.of(context).size.width/2.3,
     child: Row(children: [
        Expanded(
          flex: 2,
          child: TextView(
            text: title,
            style: Theme.of(context).textTheme.headline5,
          ),
        ),
        SizedBox(width: 20,),
        Expanded(
          flex: 2,
          child: TextView(
            text: data,
            style: Theme.of(context).textTheme.headline5!.copyWith(
              color: Colors.white70
            ),
          ),
        ),
      ],),
   );
  }
}
