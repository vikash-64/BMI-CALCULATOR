import 'dart:math';

import 'package:bmi/age_weight.dart';
import 'package:bmi/gender_widget.dart';
import 'package:bmi/height_widget.dart';
import 'package:bmi/score_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_3d_choice_chip/flutter_3d_choice_chip.dart';
import 'package:page_transition/page_transition.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _gender = 0;
  int _height = 150;
  int _age = 22;
  int _weight = 20;
  bool _isFinished = false;
  double _bmiScore = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: const Text("BMI Calculator")),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Card(
              elevation: 12,
              shape: const RoundedRectangleBorder(),
              child: Column(
                children: [
                  GenderWidget(
                    onChange: (genderVal) {
                      _gender = genderVal;
                    },
                  ),
                  HeightWidget(
                    onChange: (heightVal) {
                      _height = heightVal;
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AgeWeight(
                        title: "Age",
                        min: 1,
                        max: 120,
                        initValue: 2,
                        onChange: (valAge) {
                          _age = valAge;
                        },
                      ),

                      AgeWeight(
                        title: "Weight(Kg)",
                        min: 1,
                        max: 500,
                        initValue: 2,
                        onChange: (valWeight) {
                          _weight = valWeight;
                        },
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 80),
                    child: SwipeableButtonView(
                      isFinished: _isFinished,
                      buttonText: "Calculate",
                      buttonWidget: const Icon(
                        Icons.arrow_forward,
                        color: Colors.black,
                      ),
                      activeColor: Colors.blue,
                      onWaitingProcess: () {
                        // calculate BMI here

                        calculateBmi();

                        Future.delayed(Duration(seconds: 1), (() {
                          setState(() {
                            _isFinished = true;
                          });
                        }));
                      },
                      onFinish: () async {
                        await Navigator.push(
                            context,
                            PageTransition(
                                child:
                                    ScoreScreen(bmiScore: _bmiScore, age: _age),
                                type: PageTransitionType.fade));
                        setState(() {
                          _isFinished = false;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void calculateBmi() {
    _bmiScore = _weight / pow(_height / 100, 2);
    _bmiScore = _bmiScore.ceilToDouble();
  }
}
