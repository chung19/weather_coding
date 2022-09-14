import 'package:flutter/material.dart';
import 'package:flutter_weather_06072022/presentations/features/home/home_controller.dart';
import 'package:provider/provider.dart';

import '../home/home_event.dart';
/*
 * Listen Event From Bloc
 *
 * @param Widget
 * @param Function
 */
class ProgressListenerWidget<T extends HomeController> extends StatefulWidget {
  final Widget child;
  final Function(HomeBaseEvent event) callback;

  const ProgressListenerWidget({required this.child, required this.callback});

  @override
  _ProgressListenerWidgetState createState() =>
      _ProgressListenerWidgetState<T>();
}

class _ProgressListenerWidgetState<T> extends State<ProgressListenerWidget> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    var bloc = context.read<T>() as HomeController;
    bloc.progressStream.listen((event) {
      widget.callback(event);
    },
    );
  }

  @override
  Widget build(BuildContext context) {
    return StreamProvider<HomeBaseEvent?>(
      create: (_) => (context.read<T>() as HomeController).progressStream,
      initialData: null,
      updateShouldNotify: (prev, current) {
        return true;
      },
      child: Consumer<HomeBaseEvent?>(
        builder: (context, event, child) {
          return Container(
            child: widget.child,
          );
        },
      ),
    );
  }
}
