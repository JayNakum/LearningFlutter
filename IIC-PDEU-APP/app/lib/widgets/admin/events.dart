import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:iic_pdeu/helpers/api.dart';
import 'package:iic_pdeu/models/getevents.dart';

class EventsScreen extends StatefulWidget {
  const EventsScreen({Key? key}) : super(key: key);

  @override
  State<EventsScreen> createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  var events = <GetEvents>[];

  @override
  void initState() {
    super.initState();
    API.getEvents().then((value) => setState(() => events = value));
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height - 150,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: events.length,
              itemBuilder: (context, i) {
                return Card(
                  child: ListTile(
                    isThreeLine: true,
                    title: Text(events[i].eventName),
                    subtitle: Text(
                        '${events[i].eventBrief}\n${events[i].eventDate.day}/${events[i].eventDate.month}/${events[i].eventDate.year}'),
                    trailing: Text(events[i].createdBy.toString()),
                  ),
                );

                // return EventCard(
                //   name: events[i].eventName,
                //   description: events[i].eventBrief,
                //   date: events[i].eventDate.toIso8601String(),
                //   time: events[i].createdBy,
                // );
              },
            ),
          ),
         
            OutlinedButton(
              onPressed: () {
                showBottomSheet(
                    context: context, builder: (ctx) => const EventForm());
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text('Add Event', style: TextStyle(color: Colors.blue),),
                  Icon(Icons.add, color: Colors.blue,),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class EventForm extends StatelessWidget {
  const EventForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String name = 'Invalid', description = 'Invalid';
    DateTime dateTime = DateTime.now();
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Form(
        child: ListView(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Name',
              ),
              onChanged: (value) => name = value,
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Description',
              ),
              onChanged: (value) => description = value,
            ),
            OutlinedButton(
              onPressed: () {
                DatePicker.showDateTimePicker(
                  context,
                  showTitleActions: true,
                  onConfirm: (date) {
                    dateTime = date;
                  },
                  currentTime: DateTime.now(),
                );
              },
              child: const Text('Date'),
            ),
            ElevatedButton(
              onPressed: () {
                // final String username = Provider.of<User>(
                //   context,
                //   listen: false,
                // ).details.username;
                API.createEvent('username', name, description, dateTime).then(
                  (value) {
                    Navigator.of(context).pop();
                  },
                );
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}

class EventCard extends StatelessWidget {
  final String name;
  final String description;
  final String date;
  final String time;
  const EventCard({
    Key? key,
    required this.name,
    required this.description,
    required this.date,
    required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            Text(
              name,
              style: TextStyle(fontSize: 22.0),
            ),
            SizedBox(
              width: 12,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.48,
              child: Column(
                children: [
                  Text(
                    description,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '$date : $time',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.italic),
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.file_open),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.check_box),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.cancel),
            ),
          ],
        ),
      ),
    );
  }
}
