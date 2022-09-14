import 'dart:convert';
import 'dart:ffi';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_weather_06072022/common/app_constant.dart';
import 'package:flutter_weather_06072022/data/model/climate.dart';
import 'package:flutter_weather_06072022/data/remote/api/api_service.dart';
import 'package:flutter_weather_06072022/data/repository/climate_repository.dart';
import 'package:flutter_weather_06072022/presentations/features/home/home_controller.dart';
import 'package:flutter_weather_06072022/presentations/features/home/home_event.dart';
import 'package:flutter_weather_06072022/presentations/features/child_widgets/search_widet.dart';
import 'package:provider/provider.dart';
 import 'package:flutter_weather_06072022/data/remote/dto/climate_dto.dart';

import '../child_widgets/loading_widget.dart';
import '../child_widgets/progress_listener_widget.dart';
late HomeController _bloc;
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (context) => ApiService()),
        ProxyProvider<ApiService, ClimateRepository>(
            update: (context, apiService, climateRepository) {
          climateRepository ??= ClimateRepository();
          climateRepository.updateClimateRepository(apiService: apiService);
          return climateRepository;
        }),
        ProxyProvider<ClimateRepository, HomeController>(
            create: (context) => HomeController(),
            update: (context, repository, controller) {
              controller ??= HomeController();
              controller.updateClimateRepository(climateRepository: repository);
              return controller;
            })
      ],
      child: HomeDemo(),
    );
  }
}

class HomeDemo extends StatefulWidget {
  const HomeDemo({Key? key}) : super(key: key);


  @override
  State<HomeDemo> createState() => _HomeDemoState();
}

class _HomeDemoState extends State<HomeDemo> {
  late HomeController homeController;
  late double width;


  @override
  void initState() {
    super.initState();
    _bloc = context.read<HomeController>();
    homeController = context.read();
    homeController.eventSink.add(CallDefaultWeatherEvent(cityName: "Hanoi"));
  }



  @override
  Widget build(BuildContext context) {
    print("Build");
    return Scaffold(

        body: Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/Image.png"), fit: BoxFit.cover),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          SearchWidget(),
          showResClimate(),

          StreamBuilder<bool>(
            initialData: false,
            stream: homeController.loadingStream,
            builder: (context, snapshot) {
              if (snapshot.data != null && snapshot.data == true) {
                return HomePage();
              }
              return Container();
            },
          ),
          ProgressListenerWidget<HomeController>(
            callback: (event) {

              Navigator.pushReplacementNamed(context, AppConstant.routeDetailPage);
              },
              child: Container(),
          ),
          LoadingWidget(
            bloc: _bloc,
            child: Container(),
          )
        ],
      ),
    ));
  }



  Container showResClimate() {
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
                      Text("${snapshot.data?.main.temp}°", style: kPrimaryTemperatureTextStyleHome),

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
