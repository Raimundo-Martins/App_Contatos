import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class FlutterSpeedDial extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.close_menu,
        animatedIconTheme: IconThemeData(size: 22),
        overlayColor: Colors.black87,
        children: [
          SpeedDialChild(
            child: Icon(Icons.error_outline),
            label: 'Sobre Cajazeiras',
            labelStyle: TextStyle(fontSize: 18),
            onTap: (){ 
              Navigator.push(context, MaterialPageRoute(
                builder: (BuildContext context) {
                  return TabBarView(children: <Widget>[],);
        }));}
          ),
          SpeedDialChild(
            child: Icon(Icons.help_outline),
            label: 'Sobre Cajazeiras',
            labelStyle: TextStyle(fontSize: 18),
            onTap: (){}
          ),
          SpeedDialChild(
            child: Icon(Icons.phonelink_setup),
            label: 'Sobre Cajazeiras',
            labelStyle: TextStyle(fontSize: 18),
            onTap: (){}
          ),
          SpeedDialChild(
            child: Icon(Icons.input),
            label: 'Sobre Cajazeiras',
            labelStyle: TextStyle(fontSize: 18),
            onTap: (){}
          )
        ],
      ),
    );
  }
}