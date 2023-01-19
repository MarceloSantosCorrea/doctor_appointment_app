import 'package:doctor_appointment_app/utils/config.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final double witdh;
  final String title;
  final bool disable;
  final Function() onPress;

  const Button({
    Key? key,
    required this.witdh,
    required this.title,
    required this.disable,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: witdh,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Config.primaryColor,
          foregroundColor: Colors.white,
        ),
        onPressed: disable ? null : onPress,
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
