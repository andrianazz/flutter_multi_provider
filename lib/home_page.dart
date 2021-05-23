import 'dart:math';

import 'package:flutter/material.dart';
import 'package:multi_provider/height_provider.dart';
import 'package:multi_provider/weight_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var weightProvider = Provider.of<WeightProvider>(context);
    var heightProvider = Provider.of<HeightProvider>(context);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              " Your Weight (Kg) : ",
              style: TextStyle(fontSize: 20),
            ),
            // NOTE: Penggunaan Consumer
            // Consumer<WeightProvider>(
            //   builder: (context, weightProvider, _) => Slider(
            //     min: 1,
            //     max: 100,
            //     divisions: 100,
            //     label: weightProvider.weight.round().toString(),
            //     value: weightProvider.weight,
            //     onChanged: (newValue) {
            //       newValue = newValue.roundToDouble();
            //       weightProvider.weight = newValue;
            //       // print('Weight: $newValue');
            //     },
            //   ),
            // ),
            Slider(
              min: 1,
              max: 100,
              divisions: 100,
              label: weightProvider.weight.round().toString(),
              value: weightProvider.weight,
              onChanged: (newValue) {
                newValue = newValue.roundToDouble();
                weightProvider.weight = newValue;
                // print('Weight: $newValue');
              },
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Your Height (cm) : ",
              style: TextStyle(fontSize: 20),
            ),
            // NOTE: Penggunaan Consumer
            // Consumer<HeightProvider>(
            //   builder: (context, heightProvider, _) => Slider(
            //     min: 1,
            //     max: 200,
            //     divisions: 200,
            //     value: heightProvider.height,
            //     label: heightProvider.height.round().toString(),
            //     activeColor: Colors.pink,
            //     inactiveColor: Colors.pink.withOpacity(0.2),
            //     onChanged: (newValue) {
            //       newValue = newValue.roundToDouble();
            //       heightProvider.height = newValue;
            //       // print('Height: $newValue');
            //     },
            //   ),
            // ),
            Slider(
              min: 1,
              max: 200,
              divisions: 200,
              value: heightProvider.height,
              label: heightProvider.height.round().toString(),
              activeColor: Colors.pink,
              inactiveColor: Colors.pink.withOpacity(0.2),
              onChanged: (newValue) {
                newValue = newValue.roundToDouble();
                heightProvider.height = newValue;
                // print('Height: $newValue');
              },
            ),
            SizedBox(
              height: 50,
            ),
            // NOTE: Penggunaan Consumer
            // Consumer<WeightProvider>(
            //   builder: (context, weightProvider, _) => Consumer<HeightProvider>(
            //     builder: (context, heightProvider, _) => Text(
            //       'Your BMI :\n' +
            //           (weightProvider.weight /
            //                   (pow(heightProvider.height / 100, 2)))
            //               .toStringAsFixed(2),
            //       style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
            //       textAlign: TextAlign.center,
            //     ),
            //   ),
            // )
            Text(
              'Your BMI :\n' +
                  (weightProvider.weight /
                          (pow(heightProvider.height / 100, 2)))
                      .toStringAsFixed(2),
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
