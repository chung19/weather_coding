
import 'package:flutter/material.dart';
import 'package:flutter_weather_06072022/data/remote/api/api_service.dart';
import 'package:flutter_weather_06072022/data/repository/climate_repository.dart';
import 'package:flutter_weather_06072022/presentations/features/child_widgets/show_response_climate.dart';
import 'package:flutter_weather_06072022/presentations/features/home/home_controller.dart';
import 'package:flutter_weather_06072022/presentations/features/home/home_event.dart';
import 'package:flutter_weather_06072022/presentations/features/child_widgets/search_widet.dart';
import 'package:provider/provider.dart';
 import 'package:flutter_weather_06072022/data/remote/dto/climate_dto.dart';

import '../child_widgets/loading_widget.dart';
import '../child_widgets/progress_listener_widget.dart';

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
        ProxyProvider<ClimateRepository, HomeBloc>(
            create: (context) => HomeBloc(),
            update: (context, repository, controller) {
              controller ??= HomeBloc();
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
  late HomeBloc _bloc;


  @override
  void initState() {
    super.initState();
    // _bloc = context.read<HomeController>();
    _bloc = context.read();
    _bloc.eventSink.add(CallDefaultWeatherEvent(cityName: "Hanoi"));
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
         ShowResponseClimate(),
          StreamBuilder<bool>(
            initialData: false,
            stream: _bloc.loadingStream,
            builder: (context, snapshot) {
              if (snapshot.data != null && snapshot.data == true) {
                return HomePage();
              }
              return Container();
            },
          ),
          ProgressListenerWidget<HomeBloc>(
            callback: (event) {
              if (event is DetailSuccessEvent &&  DetailSuccessEvent ==null)  {
    Navigator.pop(context, {"city Name": event.cityName, });
    }
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






}
