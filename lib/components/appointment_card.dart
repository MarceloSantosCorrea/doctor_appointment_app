import 'package:doctor_appointment_app/utils/config.dart';
import 'package:flutter/material.dart';

class AppointmentCard extends StatefulWidget {
  const AppointmentCard({Key? key}) : super(key: key);

  @override
  State<AppointmentCard> createState() => _AppointmentCardState();
}

class _AppointmentCardState extends State<AppointmentCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Config.primaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Material(
        color: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              Row(
                children: [
                  const CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/profile1.jpeg'),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const <Widget>[
                      Text(
                        'Dr Marcelo Corrêa',
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(height: 2),
                      Text(
                        'Dental',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Config.spaceSmall,
              const ScheduleCard(),
              Config.spaceSmall,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                      ),
                      child: const Text(
                        'Cancel',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () {},
                    ),
                  ),
                  const SizedBox(width: 20.0),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                      ),
                      child: const Text(
                        'Completed',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ScheduleCard extends StatelessWidget {
  const ScheduleCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(10.0),
      ),
      width: double.infinity,
      padding: const EdgeInsets.all(10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const <Widget>[
          Icon(
            Icons.calendar_today,
            color: Colors.white,
            size: 15.0,
          ),
          SizedBox(width: 5.0),
          Text(
            'Monday 28/11/2022',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          SizedBox(width: 20.0),
          Icon(
            Icons.access_alarm,
            color: Colors.white,
            size: 17.0,
          ),
          SizedBox(width: 5.0),
          Flexible(
            child: Text(
              '02:00 PM',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
