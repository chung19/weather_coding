// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../../../common/app_constant.dart';
// import '../../../data/model/climate.dart';
// import '../home/home_controller.dart';
// import '../home/home_event.dart';
// late HomeBloc _bloc;
// class ShowResponseDetail extends StatefulWidget {
//   const ShowResponseDetail({Key? key}) : super(key: key);
//
//   @override
//   State<ShowResponseDetail> createState() => _ShowResponseDetailState();
// }
//
// class _ShowResponseDetailState extends State<ShowResponseDetail> {
//   @override
//   void initState() {
//     super.initState();
//     _bloc = context.read();
//     _bloc.eventSink.add(CallDefaultWeatherEvent(cityName: "Saigon"));
//   }
//   @override
//   dispose();
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Positioned(
//         top: 140,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Center(
//               child: StreamBuilder<Climate>(
//                 initialData: null,
//                 stream: _bloc.climateStream,
//                 builder: (context, snapshot) {
//                   if (snapshot.hasError) {
//                     return Text(snapshot.error.toString());
//                   }
//                   return Column(
//                     children: [
//                       InkWell(
//                         onTap: () async{
//                           try {
//                             var data = await Navigator.pushNamed(context, AppConstant.routeHomePage) as Map;
//                             setState(() {
//                             print(data);
//                             });
//                           } catch (e) {
//                            print(e.toString());
//                             return;
//                           }
//                         },
//                         child: Text("Sign Up",
//                             style: TextStyle(
//                                 color: Colors.red, decoration: TextDecoration.underline)),
//                       ),
//                       Positioned(
//                         child: IconButton(
//                           icon: Icon(Icons.arrow_back,size: 45,),
//                           onPressed: (){
//                             Navigator.pushReplacementNamed(context, AppConstant.routeHomePage);
//                           },),),
//                       Text(snapshot.data?.sys.country ?? '',style: kPrimaryTextTemperatureWeather,),
//                       Text(
//                         "DDM: ${snapshot.data?.dt.toString() ?? ''}",style: kPrimaryTextTemperatureWeather,),
//
//                       Text(snapshot.data?.name ?? "",style: kPrimaryCityNameTextStyle,),
//                       Text("${snapshot.data?.main.temp}° | ${snapshot.data?.weather[0].main ?? ''}"
//                           "", style: kPrimaryTextMainTemperature2),
//
//                       Image.network(
//                         // "https://openweathermap.org/img/wn/10d@4x.png",
//                         "https://openweathermap.org/img/wn/${snapshot.data?.weather[0].icon}@4x.png",
//                         fit: BoxFit.fill,
//                       ),
//                       Text(snapshot.data?.weather[0].description ?? '',style: kPrimaryTextTemperatureWeather,),
//                       Text("Min:${snapshot.data?.main.tempMin }°   Max:${snapshot.data?.main.tempMax}°",
//                           style: kPrimaryTextTemperatureWeather),
//                       SizedBox(
//                         height: 50,
//                         width : MediaQuery.of(context).size.width,
//
//                       ),
//                       Image.asset(
//                         'assets/images/House.png',
//                         // width: 359,
//                         // height: 359,
//                       ),
//                     ],
//                   )
//                   ;
//
//                 },
//               ),
//             )
//
//
//
//
//
//           ],
//         ),
//       ),
//     );
//   }
// }
