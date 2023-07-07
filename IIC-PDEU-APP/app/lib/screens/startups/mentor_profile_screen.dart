import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:iic_pdeu/helpers/api.dart';
import 'package:iic_pdeu/models/get_mentorprofile.dart';
import 'package:iic_pdeu/providers/user.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class MentorProfileScreen extends StatefulWidget {
  final GetMentorDetails mentor;
  const MentorProfileScreen(this.mentor, {Key? key}) : super(key: key);

  @override
  State<MentorProfileScreen> createState() => _MentorProfileScreenState();
}

class _MentorProfileScreenState extends State<MentorProfileScreen> {
  bool _isLoading = false;
  late final DateTime _dateTime;

  @override
  Widget build(BuildContext context) {
    final startup = Provider.of<User>(context).details;
    return Scaffold(
       appBar: AppBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(15),
          ),
        ),
        centerTitle: true,
        title: Text("IIC PDEU"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 130,
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 60,
                      backgroundImage: NetworkImage(widget.mentor.image),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Text(
                      widget.mentor.username,
                      style: TextStyle(
                        fontSize: 26,
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      DatePicker.showDateTimePicker(context,
                          showTitleActions: true, onChanged: (date) {
                        print('change $date in time zone ' +
                            date.timeZoneOffset.inHours.toString());
                      }, onConfirm: (date) {
                        API.bookAppointment(
                            username: widget.mentor.username,
                            ondate: date,
                            onwith: widget.mentor.username);
                      }, currentTime: DateTime.now(), locale: LocaleType.en);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Theme.of(context).colorScheme.primary,
                      textStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    child: const Text('Book an Appointment'),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: SizedBox(
                height: 200,
                width: MediaQuery.of(context).size.width,
                child: Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: const BorderSide(
                      color: Colors.blue,
                      width: 1.2,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Minutes Of Meeting",
                          style: TextStyle(
                            fontSize: 22,
                            color: Theme.of(context).colorScheme.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          startup.mentorMinutes,
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 0, 12, 4),
              child: SizedBox(
                height: 170,
                width: MediaQuery.of(context).size.width,
                child: Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: const BorderSide(
                      color: Colors.blue,
                      width: 1.2,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Action points",
                          style: TextStyle(
                            fontSize: 22,
                            color: Theme.of(context).colorScheme.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          startup.mentorFeedback,
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 120,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      launch(
                          'mailto:${widget.mentor.email}?subject= Upgrade startup&body=This is Body of Email');
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Theme.of(context).colorScheme.primary,
                      textStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const <Widget>[
                        Text(
                          'Mail',
                        ),
                        SizedBox(width: 10),
                        Icon(Icons.mail),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 160,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      launch(
                          'sms:${widget.mentor.number}?body= Enter your Message here');
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Theme.of(context).colorScheme.primary,
                      textStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const <Widget>[
                        Text(
                          'Message',
                        ),
                        SizedBox(width: 10),
                        Icon(Icons.mail),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
