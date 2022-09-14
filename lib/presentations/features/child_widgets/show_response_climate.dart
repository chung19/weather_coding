import 'package:flutter/material.dart';
import 'package:flutter_weather_06072022/presentations/features/child_widgets/show_response_detail.dart';
import 'package:provider/provider.dart';
import '../../../common/app_constant.dart';
import '../../../data/model/climate.dart';
import '../home/home_controller.dart';
import '../home/home_event.dart';
late HomeController homeController;
class ShowResponseClimate extends StatefulWidget {
  const ShowResponseClimate({Key? key}) : super(key: key);

  @override
  State<ShowResponseClimate> createState() => _ShowResponseClimateState();
}

class _ShowResponseClimateState extends State<ShowResponseClimate> {
  void initState() {
    super.initState();
    homeController = context.read();
    homeController.eventSink.add(CallDefaultWeatherEvent(cityName: "Hanoi"));
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Positioned(
        top: 140,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: StreamBuilder<Climate>(
                initialData: null,
                stream: homeController.climateStream,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text(snapshot.error.toString());
                  }
                  return Column(
                    children: [
                      Text(snapshot.data?.name ?? "",style: kPrimaryCityNameTextStyle,),
                      Text("${snapshot.data?.main.temp}°", style: kPrimaryTextMainTemperature),

                      Image.network(
                        // "https://openweathermap.org/img/wn/10d@4x.png",
                        "https://openweathermap.org/img/wn/${snapshot.data?.weather[0].icon}@2x.png",
                        // width: width / 4,
                        // height: width / 4,
                        fit: BoxFit.fill,
                      ),

                      Text(snapshot.data?.weather[0].main ?? '',style: kPrimaryTextTemperatureWeather,),
                      Text("Min:${snapshot.data?.main.tempMin}°   Max:${snapshot.data?.main.tempMax}°",
                          style: kPrimaryTextTemperatureWeather),

                      IconButton(
                          onPressed: (){
                            Navigator.pushReplacementNamed(context, AppConstant.routeDetailPage);
                          },
                          icon: Icon(Icons.add_circle_outlined ,size: 50,)
                      ),
                      SizedBox(
                        height: 50,
                        width : MediaQuery.of(context).size.width,

                      ),

                      Image.asset(
                        'assets/images/House.png',
                        // width: double.infinity,
                        // height: 359,
                      ),
                    ],
                  )
                  ;

                },
              ),
            )





          ],
        ),
      ),
    );
  }
}
