import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class HeightWidget extends StatefulWidget {
  final Function(int) onChange;
  const HeightWidget({Key ? key , required this.onChange });
  

  @override
  State<HeightWidget> createState() => _HeightWidgetState();
}

class _HeightWidgetState extends State<HeightWidget> {
  int _height = 150 ;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Card(
        elevation: 12,
        shape: RoundedRectangleBorder(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Height" ,style: TextStyle(fontSize: 25 , color: Colors.grey),),

            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("$_height",style: TextStyle(fontSize: 25 , color: Colors.grey),),
                SizedBox(width: 5,),
                Text("cm",style: TextStyle(fontSize: 15 , color: Colors.grey),),
              ], 
            ),

            Slider(
              min: 0,
              max: 240,
              thumbColor: Colors.red,
              value: _height.toDouble(),
              
              onChanged: (value) {
                setState(() {
                  _height = value.toInt();
                });
                widget.onChange(_height);
              },
            ),

          ],

        ),
      ),
    );
  }
}