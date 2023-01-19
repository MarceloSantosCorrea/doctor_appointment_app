import 'package:doctor_appointment_app/utils/config.dart';
import 'package:flutter/material.dart';

class DoctorCard extends StatefulWidget {
  const DoctorCard({Key? key}) : super(key: key);

  @override
  State<DoctorCard> createState() => _DoctorCardState();
}

class _DoctorCardState extends State<DoctorCard> {
  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Container(
      padding: const EdgeInsets.all(10.0),
      height: 150.0,
      child: GestureDetector(
        child: Card(
          elevation: 5.0,
          color: Colors.white,
          child: Row(
            children: [
              SizedBox(
                width: Config.widthSize * 0.33,
                child: Image.asset(
                  'assets/profile1.jpeg',
                  fit: BoxFit.fill,
                ),
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10.0,
                    vertical: 20.0,
                  ),
                  child: Column(
                    children: <Widget>[
                      const Text(
                        'Dr Marcelo Corrêa',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(
                        'Dental',
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const <Widget>[
                          Icon(
                            Icons.star_border,
                            color: Colors.yellow,
                            size: 16.0,
                          ),
                          Spacer(flex: 1),
                          Text('4.5'),
                          Spacer(flex: 1),
                          Text('Reviews'),
                          Spacer(flex: 1),
                          Text('(20)'),
                          Spacer(flex: 7),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        onTap: () {},
      ),
    );
  }
}
