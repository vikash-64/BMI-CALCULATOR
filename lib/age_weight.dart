import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AgeWeight extends StatefulWidget {
  final Function(int) onChange;
  final String title;
  final int initValue;
  final int min;
  final int max;
  const AgeWeight(
      {Key? key,
      required this.onChange,
      required this.title,
      required this.initValue,
      required this.min,
      required this.max})
      : super(key: key);

  @override
  State<AgeWeight> createState() => _AgeWeightState();
}

class _AgeWeightState extends State<AgeWeight> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Padding(
          padding: const EdgeInsets.all(12),
          child: SizedBox(
            height: 115,
            width: 155,
            child: Card(
              elevation: 12,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.title,
                    style: TextStyle(fontSize: 20, color: Colors.grey),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
            
                      SizedBox(
                        width: 35.0,
                        height: 35.0,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_counter > widget.min) {
                              setState(() {
                                _counter--;
                              });
                              widget.onChange(_counter);
                            }
                          },
                          child: Icon(Icons.remove, size: 16.0),
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size.zero,
                            padding: EdgeInsets.all(0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                      ),
              
                      Text(
                        "$_counter",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w800),
                      ),
                      SizedBox(
                        width: 35.0,
                        height: 35.0,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_counter < widget.max) {
                              setState(() {
                                _counter++;
                              });
                              widget.onChange(_counter);
                            }
                          },
                          child: Icon(Icons.add, size: 16.0),
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size.zero,
                            padding: EdgeInsets.all(0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
