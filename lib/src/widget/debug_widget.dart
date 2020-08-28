import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_kostlivec/src/app_mode.dart';
import 'package:flutter_kostlivec/src/state/app_config_state.dart';
import 'package:flutter_kostlivec/src/util.dart';

class DebugWidget extends StatelessWidget {
  final Widget child;

  DebugWidget({@required this.child});

  @override
  Widget build(BuildContext context) {
    return getMyState<AppConfigState>().state.mode == AppMode.PROD ? child : _buildDebugContent(child);
  }

  Widget _buildDebugContent(Widget _) {
    return Column(
      children: <Widget>[Expanded(child: child), _buildDebugBanner()],
    );
  }

  Widget _buildDebugBanner() {
    return Material(
        child: Directionality(
            textDirection: TextDirection.ltr,
            child: Container(
                padding: EdgeInsets.all(6),
                decoration: BoxDecoration(color: Colors.red),
                child: Row(children: <Widget>[
                  Text(
                    'Development',
                    style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold, inherit: false),
                  ),
                  Spacer()
                ]))));
  }
}
