import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import '../../../data/remote/api/api_service.dart';
import 'package:flutter_weather_06072022/presentations/features/home/home_event.dart';

import '../home/home_controller.dart';
class SearchWidget extends StatefulWidget {
  const SearchWidget({Key? key}) : super(key: key);
  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
late ApiService repository ;
late HomeController homeController;
String? text;
TextEditingController controller = TextEditingController();


@override
void initState() {
  super.initState();
  homeController = context.read();
  homeController.eventSink.add(CallDefaultWeatherEvent(cityName: "Hanoi"));
}
dispose();



  Widget build(BuildContext context) {


    return Container(
      margin: EdgeInsets.only(top: 25, left: 25, right: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          Row(
      children: [

      Flexible (
                flex: 1,
                child: TextField(
                  controller: controller,
                  cursorColor: Colors.grey,
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none
                      ),
                      hintText: 'Search City Name ',
                      hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 18
                      ),
                      prefixIcon: Container(

                        padding: EdgeInsets.all(15),
                        child: IconButton(icon:Icon(FontAwesomeIcons.searchLocation,
                        ),
                            onPressed: () {
                              String text = controller.text.toString();

                              if (text.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Bạn chưa nhập thành phố")));
                                return;
                              }
                              homeController.eventSink
                                  .add(CallDefaultWeatherEvent(cityName: text));

                        },
                      ),
                  ),
                ),
              ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

