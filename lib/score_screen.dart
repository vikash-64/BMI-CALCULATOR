import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:gauges/gauges.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class ScoreScreen extends StatelessWidget {
  final double bmiScore;
  final int age;
  String ? bmiStatus ;
  String ? bmiInterpretation ;
  Color ? bmiStatusColor;

  ScoreScreen({Key? key, required this.bmiScore, required this.age})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    setBmiIntepretation();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("BMI Score"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Card(
          elevation: 12,
          shape: const RoundedRectangleBorder(),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Your Score",
                  style: TextStyle(fontSize: 30, color: Colors.blue),
                ),
                SizedBox(height: 5,),
                SizedBox(
                  height: 250,
                  width: 250,
                  child: SfRadialGauge(
                      
                      animationDuration: 4500,
                      enableLoadingAnimation: true,
                      axes: <RadialAxis>[
                        RadialAxis(
                          showLabels: false,
                            minimum: 0,
                            maximum: 40,
                            pointers: <GaugePointer>[
                              NeedlePointer(value: bmiScore.toDouble())
                            ],
                            ranges: <GaugeRange>[
                              GaugeRange(
                                  startValue: 0,
                                  endValue: 18.5,
                                  color: Colors.yellow,
                                  startWidth: 5,
                                  endWidth: 10,
                            
                                  ),
                              GaugeRange(
                                  startValue: 18.5,
                                  endValue: 25,
                                  color: Colors.green,
                                  startWidth: 10,
                                  endWidth: 15,                                  
                              
                                  ),
                              GaugeRange(
                                  startValue: 25,
                                  endValue: 30,
                                  color: Colors.orange,
                                  startWidth: 15,
                                  endWidth: 20,                                  
                            
                                  ),
                              GaugeRange(
                                  startValue: 30,
                                  endValue: 40,
                                  color: Colors.red,
                                  startWidth: 20,
                                  endWidth: 25,                                                        
                                  ),
                            ]
                            ),
                      ]),
                ),
                SizedBox(height: 7,),
                Text(
                  "Your BMI Score is $bmiScore",
                  style: TextStyle(fontSize: 25 , color: Colors.green ,fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 5,),
          
                SizedBox(height: 5,),
                Text("You are $bmiStatus",style: TextStyle(fontSize: 25 , color: Colors.red),) ,
                Text("$bmiInterpretation",style: TextStyle(fontSize: 25 , color: Colors.blue),), 


              ],
            ),
          ),
        ),
      ),
    );
  }
  void setBmiIntepretation(){
    if (bmiScore > 30) {

      bmiStatus = "Obese";
      bmiInterpretation = "Workout to reduce obesity";
      bmiStatusColor =Colors.pink ;
    }  else if (bmiScore >= 25) {

      bmiStatus = "Overweight";
      bmiInterpretation = "Do regular exercise";
      bmiStatusColor =Colors.orange ;
    }  else if (bmiScore >= 18.5) {

      bmiStatus = "Normal";
      bmiInterpretation = "Enjoy, You are fit";
      bmiStatusColor =Colors.green ;
    }  else if (bmiScore < 18.5) {

      bmiStatus = "Overweight";
      bmiInterpretation = "Try to increse the weight";
      bmiStatusColor =Colors.red ;
    }
  }
}
