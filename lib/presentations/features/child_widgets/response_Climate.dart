//
// import 'package:flutter/material.dart';
//
// import '../../../data/model/climate.dart';
// import '../home/home_controller.dart';
//
// class ResponseClimate extends StatefulWidget {
//   const ResponseClimate({Key? key}) : super(key: key);
//   late HomeController homeControl;
//   @override
//   State<ResponseClimate> createState() => _ResponseClimateState();
// }
// Container
// showResClimate() {
//     return Container(
//         child: Positioned(
//       top: 140,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Center(
//             child: StreamBuilder<Climate>(
//               initialData: null,
//               stream: homeController.climateStream,
//               builder: (context, snapshot) {
//                 if (snapshot.hasError) {
//                   return Text(snapshot.error.toString());
//                 }
//                 return
//     ),
//   );
//   )
// }
//
//
// class _ResponseClimateState extends State<ResponseClimate> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//
//
//     );
//   }
// }
