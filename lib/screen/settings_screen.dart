import 'package:flutter/material.dart';
import 'package:flutter_random_number_generator/component/number_row.dart';
import 'package:flutter_random_number_generator/constant/color.dart';

class SettingsScreen extends StatefulWidget {
  final int maxNumber;

  const SettingsScreen({required this.maxNumber, Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  double maxNumber = 10000;

  @override
  void initState() {
    maxNumber = widget.maxNumber.toDouble();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: PRIMARY_COLOR,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                _Body(maxNumber: maxNumber),
                _Footer(
                  maxNumber: maxNumber,
                  onSliderChanged: onSliderChanged,
                  onButtonPressed: onButtonPressed,
                )
              ],
            ),
          ),
        ));
  }

  void onButtonPressed() {
    Navigator.of(context).pop(maxNumber.toInt());
  }

  void onSliderChanged(double value) {
    setState(() {
      maxNumber = value;
    });
  }
}

class _Body extends StatelessWidget {
  double maxNumber;
  _Body({required this.maxNumber, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(child: NumberRow(number: maxNumber.toInt()));
  }
}

class _Footer extends StatelessWidget {
  double maxNumber;
  final ValueChanged<double>? onSliderChanged;
  final VoidCallback onButtonPressed;
  _Footer(
      {required this.maxNumber,
      required this.onSliderChanged,
      required this.onButtonPressed,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      Slider(
        value: maxNumber,
        min: 1000,
        max: 1000000,
        onChanged: onSliderChanged,
      ),
      ElevatedButton(
          onPressed: onButtonPressed,
          style: ElevatedButton.styleFrom(primary: RED_COLOR),
          child: Text('저장!'))
    ]);
  }
}
