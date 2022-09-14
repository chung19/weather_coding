import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../common/app_constant.dart';
import '../../../data/model/climate.dart';
import '../home/home_controller.dart';
import '../home/home_event.dart';
late HomeController homeController;
class ShowResponseDetail extends StatefulWidget {
  const ShowResponseDetail({Key? key}) : super(key: key);

  @override
  State<ShowResponseDetail> createState() => _ShowResponseDetailState();
}

class _ShowResponseDetailState extends State<ShowResponseDetail> {
  @override
  void initState() {
    super.initState();
    homeController = context.read();
    homeController.eventSink.add(CallDefaultWeatherEvent(cityName: "Hanoi"));
  }
  @override
  dispose();
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
                      Positioned(
                        child: IconButton(
                          icon: Icon(Icons.arrow_back,size: 45,),
                          onPressed: (){
                            Navigator.pushReplacementNamed(context, AppConstant.routeHomePage);
                          },),),
                      Text(snapshot.data?.sys.country ?? '',style: kPrimaryTextTemperatureWeather,),
                      Text(
                        "DDM: ${snapshot.data?.dt.toString() ?? ''}",style: kPrimaryTextTemperatureWeather,),

                      Text(snapshot.data?.name ?? "",style: kPrimaryCityNameTextStyle,),
                      Text("${snapshot.data?.main.temp}° | ${snapshot.data?.weather[0].main ?? ''}"
                          "", style: kPrimaryTextMainTemperature2),

                      Image.network(
                        // "https://openweathermap.org/img/wn/10d@4x.png",
                        "https://openweathermap.org/img/wn/${snapshot.data?.weather[0].icon}@2x.png",
                        fit: BoxFit.fill,
                      ),
                      Text(snapshot.data?.weather[0].description ?? '',style: kPrimaryTextTemperatureWeather,),
                      Text("Min:${snapshot.data?.main.tempMin }°   Max:${snapshot.data?.main.tempMax}°",
                          style: kPrimaryTextTemperatureWeather),
                      SizedBox(
                        height: 50,
                        width : MediaQuery.of(context).size.width,

                      ),
                      Image.asset(
                        'assets/images/House.png',
                        // width: 359,
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
