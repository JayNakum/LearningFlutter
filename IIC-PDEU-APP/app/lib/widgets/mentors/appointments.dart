import 'package:flutter/material.dart';
import 'package:iic_pdeu/models/get_mentorappointments.dart';
import 'package:iic_pdeu/providers/user.dart';
import 'package:provider/provider.dart';

import '../../helpers/api.dart';

class Appointments extends StatefulWidget {
  const Appointments({Key? key}) : super(key: key);

  @override
  State<Appointments> createState() => _AppointmentsState();
}

class _AppointmentsState extends State<Appointments> {
  bool _isLoading = true;
  List<GetMentorAppointments> _appointments = [];

  @override
  void initState() {
    super.initState();
    API
        .getAppointments()
        .then((value) => _appointments = value)
        .then((value) => setState(() => _isLoading = false));
  }

  @override
  Widget build(BuildContext context) {
    // final appointments = []; // TODO: Providers
    return ListView.builder(
      itemCount: _appointments.length,
      itemBuilder: (ctx, i) {
        return AppointmentCard(
          startupname: _appointments[i].username,
          appointmentwith:
              'Appointment with ${_appointments[i].appointmentWith}',
          ondate: _appointments[i].appointmentDate.toString(),
          //ontime: '12:00 PM',
          url: 'assets/images/logo.png',
        );
      },
    );
  }
}

class AppointmentCard extends StatelessWidget {
  final String startupname;
  final String appointmentwith;
  final String ondate;
  //final DateTime ontime;
  final String url;
  //final VoidCallback ontaps;

  const AppointmentCard({
    Key? key,
    required this.startupname,
    required this.appointmentwith,
    required this.ondate,
    //required this.ontime,
    required this.url,
    //required this.ontaps,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      //onTap: ontaps,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(14, 10, 14, 10),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
            side: const BorderSide(
              color: Colors.blue,
              width: 1.2,
            ),
          ),
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(width: 8),
                    CircleAvatar(
                      backgroundImage: NetworkImage(url),
                      backgroundColor: Theme.of(context).colorScheme.secondary,
                      radius: 28,
                      // child: const Text('AH'),
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          startupname,
                          style: TextStyle(
                            fontSize: 20,
                            color: Theme.of(context).colorScheme.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          appointmentwith,
                          style: const TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        //date
                        const SizedBox(height: 5),
                        Text(
                          ondate,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 15),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => PopupDialogue(
                            text1: 'Reschedule Appointment',
                            descrip:
                                "Are you sure you want to accept $startupname's appointment?",
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        textStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      child: const Text('Accept'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => PopupDialogue(
                            text1: 'Reschedule Appointment',
                            descrip:
                                "Are you sure you want to cancel $startupname's appointment?",
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        textStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      child: const Text('Reject'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => PopupDialogue(
                            text1: 'Reschedule Appointment',
                            descrip:
                                "Are you sure you want to reschedule $startupname's appointment?",
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        textStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      child: const Text('Reschedule'),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PopupDialogue extends StatelessWidget {
  final String text1;
  final String descrip;
  const PopupDialogue({Key? key, required this.text1, required this.descrip})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        text1,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(descrip),
        ],
      ),
      actions: <Widget>[
        FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          textColor: Theme.of(context).primaryColor,
          child: const Text('Agree'),
        ),
        FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          textColor: Theme.of(context).primaryColor,
          child: const Text('Cancel'),
        ),
      ],
    );
  }
}
