import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/src/app/routes/router.dart';
import 'package:weather_app/src/core/common/widget/error_view.dart';
import 'package:weather_app/src/core/utils/helpers/date_formatter.dart';
import 'package:weather_app/src/core/utils/helpers/date_time_convert.dart';
import 'package:weather_app/src/features/home_page/domain/entities/city_entity.dart';
import 'package:weather_app/src/features/home_page/presentation/logic/home_cubit.dart';
import 'package:weather_app/src/features/home_page/presentation/view/widget/custom_paineter.dart';
import 'package:weather_app/src/features/home_page/presentation/view/widget/wether_day_widget.dart';

import '../../../../core/common/widget/animation_scale_widget.dart';
import '../../../../core/common/widget/text_view.dart';
import '../../domain/entities/weather_day_entity.dart';
import '../logic/home_state.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {

  @override
  void initState() {
    super.initState();

    BlocProvider.of<HomeCubit>(context).doGetWeather();

  }
  @override
  Widget build(BuildContext context) {
     return BlocBuilder<HomeCubit,HomeState>(
         builder: (context,state){
           return state.maybeWhen(orElse: ()=>Container(),
           loading:()=> const Center(child: CircularProgressIndicator(),),
             data: (data)=>body(data),
             error: (error)=>Center(child: ErrorView(error: error.error?.message??"",
             onRefresh: (){

             },),)
           );
         });
  }

  body(data){

    CityEntity cityEntity =data[0];
    List<WeatherDayEntity> weathers =data[1];

     List<WeatherDayEntity> newWeathers=getFiveDays(weathers);
   


    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: [
          Positioned.fill(child: CustomPaint(
            painter: BackgroundCP(),
          )),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 35,),
                TextView(
                  text: 'Weather',
                  style: Theme.of(context).textTheme.headline1,
                ),
                const SizedBox(height: 20,),

                TextView(
                  text: cityEntity.name,
                  style: Theme.of(context).textTheme.headline2,
                ),
                const SizedBox(height: 20,),

                TextView(
                  text:weathers[0].weatherMain.toString(),
                  style: Theme.of(context).textTheme.headline3,
                ),
                AnimationScaleWidget(
                  position: 0,
                  child: Image.network(
                    'http://openweathermap.org/img/wn/${newWeathers[0].icon.toString()}@4x.png',
                    width: MediaQuery.of(context).size.width/2,
                    fit: BoxFit.fill,
                  ),
                ),
                TextView(
                    text: newWeathers[0].temp.toString()+ "\u2103",
                    style: Theme.of(context).textTheme.headline1,
                ),

                const SizedBox(height: 45,),
                Row(
                  children: [

                    for(int i=0;i<5 ;i++)...[
                      AnimationScaleWidget(
                        position: i,
                        child: WeatherDayWidget(
                          day: formatStringDate1( newWeathers[i].date),
                          temp: newWeathers[i].temp.toString(),
                          icon: newWeathers[i].icon,
                          onTap: (){
                            context.router.push(SecondPageAppRouter(
                              weatherDayEntity: newWeathers[i]
                            ));
                          },
                        ),
                      ),

                    ]

                  ],
                ),
                const SizedBox(height: 75,),

              ],
            ),
          ),
        ],
      ),
    );
  }


  getFiveDays(weathers){
    List<WeatherDayEntity> newWeathers=[];

    var dateNow =DateTime.now();
    for(int i=0;i<weathers.length ;i++){
      var newDay = toDateTime(weathers[i].date);
      if(dateNow.day==newDay.day){
        print(toDateTime(weathers[i].date));

        newWeathers.add(weathers[i]);
        dateNow =dateNow.add(const Duration(days: 1));
      }
    }

    return newWeathers;
  }
}
