import 'package:flutter/material.dart';
import 'package:flutter_3d_choice_chip/flutter_3d_choice_chip.dart';

class GenderWidget extends StatefulWidget {
  
  final Function(int) onChange ;
  
  const GenderWidget({Key? key , required this.onChange}): super(key: key);

  

  @override
  State<GenderWidget> createState() => _GenderWidgetState();
}

class _GenderWidgetState extends State<GenderWidget> {
  int _gender = 0;

    final ChoiceChip3DStyle selectedStyle = ChoiceChip3DStyle(
    topColor: Colors.grey[200]!,
    backColor: Colors.grey,
    borderRadius: BorderRadius.circular(20),
  );

  final ChoiceChip3DStyle unselectedStyle = ChoiceChip3DStyle(
    topColor: Colors.white,
    backColor: Colors.grey,
    borderRadius: BorderRadius.circular(20),
  );
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
    
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ChoiceChip3D(
              border: Border.all(color: Colors.grey),

              style: _gender == 1 ? selectedStyle : unselectedStyle ,
              onSelected: () {
                setState(() {
                  _gender = 1;
                });
                widget.onChange(_gender);
              },
              onUnSelected: () {},
              selected: _gender == 1,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "images/male.png",
                      width: 40,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text("Male"),
                  ],
                ),
              )),
          const SizedBox(
            width: 100,
          ),
          ChoiceChip3D(
              border: Border.all(color: Colors.grey),
              style: _gender == 2 ? selectedStyle : unselectedStyle ,
              onSelected: () {
                setState(() {
                  _gender = 2;
                });
                widget.onChange(_gender);
              },
              onUnSelected: () {},
              selected: _gender == 2,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "images/female.png",
                      width: 40,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text("Female"),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
