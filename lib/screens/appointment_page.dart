import 'package:doctor_appointment_app/utils/config.dart';
import 'package:flutter/material.dart';

class AppointmentPage extends StatefulWidget {
  const AppointmentPage({Key? key}) : super(key: key);

  @override
  State<AppointmentPage> createState() => _AppointmentPageState();
}

enum FilterStatus { upcoming, complete, cancel }

class _AppointmentPageState extends State<AppointmentPage> {
  FilterStatus status = FilterStatus.upcoming;
  Alignment _alignment = Alignment.centerLeft;
  List<dynamic> schedules = [
    {
      'doctor_name': 'Doutor 01',
      'doctor_profile': 'assets/doctor_2.jpg',
      'category': 'Dental',
      'status': FilterStatus.upcoming,
    },
    {
      'doctor_name': 'Doutor 02',
      'doctor_profile': 'assets/doctor_3.jpg',
      'category': 'Cardiology',
      'status': FilterStatus.complete,
    },
    {
      'doctor_name': 'Doutor 03',
      'doctor_profile': 'assets/doctor_4.jpg',
      'category': 'Respiration',
      'status': FilterStatus.complete,
    },
    {
      'doctor_name': 'Doutor 04',
      'doctor_profile': 'assets/doctor_5.jpg',
      'category': 'Gemeral',
      'status': FilterStatus.cancel,
    },
  ];

  @override
  Widget build(BuildContext context) {
    List<dynamic> filteredSchedules = schedules.where((var schedule) {
      // print(schedule['status']);
      // switch (schedule['status']) {
      //   case 'upcoming':
      //     schedule['status'] = FilterStatus.upcoming;
      //     break;
      //   case 'complete':
      //     schedule['status'] = FilterStatus.complete;
      //     break;
      //   case 'cancel':
      //     schedule['status'] = FilterStatus.cancel;
      //     break;
      // }
      // return schedule;
      return schedule['status'] == status;
    }).toList();

    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.only(left: 20.0, top: 20.0, right: 20.0),
      child: Column(
        children: <Widget>[
          const Text(
            'Appointment Schedule',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Config.spaceSmall,
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: 40.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    for (FilterStatus filterStatus in FilterStatus.values)
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              if (filterStatus == FilterStatus.upcoming) {
                                status = FilterStatus.upcoming;
                                _alignment = Alignment.centerLeft;
                              } else if (filterStatus ==
                                  FilterStatus.complete) {
                                status = FilterStatus.complete;
                                _alignment = Alignment.center;
                              } else if (filterStatus == FilterStatus.cancel) {
                                status = FilterStatus.cancel;
                                _alignment = Alignment.centerRight;
                              }
                            });
                          },
                          child: Center(
                            child: Text(filterStatus.name),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              AnimatedAlign(
                alignment: _alignment,
                duration: const Duration(milliseconds: 200),
                child: Container(
                  width: 100.0,
                  height: 40.0,
                  decoration: BoxDecoration(
                    color: Config.primaryColor,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Center(
                    child: Text(
                      status.name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Config.spaceSmall,
          Expanded(
            child: ListView.builder(
              itemCount: filteredSchedules.length,
              itemBuilder: (context, index) {
                print(filteredSchedules);
                var schedule = filteredSchedules[index];
                bool isLastElement = filteredSchedules.length + 1 == index;

                return Card(
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  margin: !isLastElement
                      ? const EdgeInsets.only(bottom: 20.0)
                      : EdgeInsets.zero,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundImage: AssetImage(
                                schedule['doctor_profile'],
                              ),
                            ),
                            const SizedBox(width: 10.0),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  schedule['doctor_name'],
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                const SizedBox(height: 5.0),
                                Text(
                                  schedule['doctor_name'],
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 15.0),
                        const ScheduleCard(),
                        const SizedBox(height: 15.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: OutlinedButton(
                                onPressed: () {},
                                child: const Text(
                                  'Cancel',
                                  style: TextStyle(
                                    color: Config.primaryColor,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 20.0),
                            Expanded(
                              child: OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                  backgroundColor: Config.primaryColor,
                                ),
                                onPressed: () {},
                                child: const Text(
                                  'Reschedule',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    ));
  }
}

class ScheduleCard extends StatelessWidget {
  const ScheduleCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(10.0),
      ),
      width: double.infinity,
      padding: const EdgeInsets.all(10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const <Widget>[
          Icon(
            Icons.calendar_today,
            color: Config.primaryColor,
            size: 15.0,
          ),
          SizedBox(width: 5.0),
          Text(
            'Monday 28/11/2022',
            style: TextStyle(
              color: Config.primaryColor,
            ),
          ),
          SizedBox(width: 20.0),
          Icon(
            Icons.access_alarm,
            color: Config.primaryColor,
            size: 17.0,
          ),
          SizedBox(width: 5.0),
          Flexible(
            child: Text(
              '02:00 PM',
              style: TextStyle(
                color: Config.primaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
