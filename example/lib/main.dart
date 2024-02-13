import 'package:flutter/material.dart';
import 'package:slide_digital_clock/slide_digital_clock.dart';

void main() {
  runApp(const ExampleApp());
}

class ExampleApp extends StatelessWidget {
  const ExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Slider Digital Clock Demo App",
      home: Scaffold(
        appBar: AppBar(
            title: const Text("Slider Digital Clock Demo App"),
            actions: [
              DigitalClock(
                hourMinuteDigitTextStyle: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .copyWith(color: Colors.white),
                secondDigitTextStyle: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: Colors.white),
                colon: Text(
                  ":",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Colors.white),
                ),
              )
            ]),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text("Custom Colon"),
                const SizedBox(width: 50),
                DigitalClock(
                  hourMinuteDigitTextStyle: const TextStyle(fontSize: 18),
                  colon: const Icon(Icons.ac_unit, size: 12),
                  colonDecoration: BoxDecoration(
                      border: Border.all(), shape: BoxShape.circle),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text("Custom Styles"),
                const SizedBox(width: 50),
                DigitalClock(
                  hourDigitDecoration: BoxDecoration(
                      color: Colors.yellow,
                      border: Border.all(color: Colors.blue, width: 2)),
                  minuteDigitDecoration: BoxDecoration(
                      color: Colors.yellow,
                      border: Border.all(color: Colors.red, width: 2)),
                  secondDigitDecoration: BoxDecoration(
                      color: Colors.blueGrey,
                      border: Border.all(color: Colors.blue),
                      shape: BoxShape.circle),
                  secondDigitTextStyle: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: Colors.white),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text("Custom Styles"),
                const SizedBox(width: 50),
                DigitalClock(
                  hourDigitDecoration: const BoxDecoration(
                      color: Colors.yellow, shape: BoxShape.circle),
                  minuteDigitDecoration: const BoxDecoration(
                      color: Colors.yellow, shape: BoxShape.circle),
                  secondDigitDecoration: BoxDecoration(
                      color: Colors.blueGrey,
                      border: Border.all(color: Colors.blue),
                      shape: BoxShape.circle),
                  secondDigitTextStyle: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: Colors.white),
                  colonDecoration: BoxDecoration(
                      border: Border.all(color: Colors.blue, width: 1),
                      shape: BoxShape.circle),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text("Show AM-PM, Disable Seconds, AM-PM on right"),
                const SizedBox(width: 50),
                DigitalClock(
                  is24HourTimeFormat: false,
                  showSecondsDigit: false,
                  amPmPosition: AmPmPosition.right,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
