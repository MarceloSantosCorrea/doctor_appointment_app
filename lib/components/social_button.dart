import 'package:doctor_appointment_app/utils/config.dart';
import 'package:flutter/material.dart';

class SocialButton extends StatelessWidget {
  final String social;

  const SocialButton({
    Key? key,
    required this.social,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 8),
        side: const BorderSide(width: 1, color: Colors.black),
      ),
      onPressed: () {},
      child: SizedBox(
        width: Config.widthSize * 0.4,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              'assets/$social.png',
              width: 40.0,
              height: 40.0,
            ),
            Text(
              social.toUpperCase(),
              style: const TextStyle(
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
