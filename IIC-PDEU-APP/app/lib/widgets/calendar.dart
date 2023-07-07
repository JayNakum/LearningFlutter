import 'package:flutter/material.dart';
import 'package:iic_pdeu/helpers/api.dart';
import 'package:iic_pdeu/models/getevents.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class Calendar extends StatefulWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  final List<Meeting> _meetings = <Meeting>[];

  @override
  void initState() {
    super.initState();
    final List<Meeting> meetings = <Meeting>[];
    final List<Meeting> events = <Meeting>[];
    API.getAdminAppointments('Anya').then((list) {
      for (var element in list) {
        final DateTime dateTime = element.adminAppointmentDate;
        final DateTime startTime = DateTime(dateTime.year, dateTime.month,
            dateTime.day, dateTime.hour, dateTime.minute);
        final DateTime endTime = startTime.add(const Duration(hours: 1));
        meetings.add(
            Meeting(element.username, startTime, endTime, Colors.green, false));
      }
    }).then((value) => setState(() {
          _meetings.addAll(meetings);
        }));

    API.getEvents().then((list) {
      for (var element in list) {
        final DateTime dateTime = element.eventDate;
        final DateTime startTime = DateTime(dateTime.year, dateTime.month,
            dateTime.day, dateTime.hour, dateTime.minute);
        final DateTime endTime = startTime.add(const Duration(hours: 1));
        events.add(
            Meeting(element.eventName, startTime, endTime, Colors.blue, false));
      }
    }).then((value) => setState(() {
          _meetings.addAll(events);
        }));
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: SfCalendar(
        view: CalendarView.week,
        dataSource: MeetingDataSource(_meetings),
        // by default the month appointment display mode set as Indicator, we can
        // change the display mode as appointment using the appointment display
        // mode property
        monthViewSettings: const MonthViewSettings(
            appointmentDisplayMode: MonthAppointmentDisplayMode.appointment),
      ),
    );
  }
}

/// An object to set the appointment collection data source to calendar, which
/// used to map the custom appointment data to the calendar appointment, and
/// allows to add, remove or reset the appointment collection.
class MeetingDataSource extends CalendarDataSource {
  /// Creates a meeting data source, which used to set the appointment
  /// collection to the calendar
  MeetingDataSource(List<Meeting> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return _getMeetingData(index).from;
  }

  @override
  DateTime getEndTime(int index) {
    return _getMeetingData(index).to;
  }

  @override
  String getSubject(int index) {
    return _getMeetingData(index).eventName;
  }

  @override
  Color getColor(int index) {
    return _getMeetingData(index).background;
  }

  @override
  bool isAllDay(int index) {
    return _getMeetingData(index).isAllDay;
  }

  Meeting _getMeetingData(int index) {
    final dynamic meeting = appointments![index];
    late final Meeting meetingData;
    if (meeting is Meeting) {
      meetingData = meeting;
    }

    return meetingData;
  }
}

/// Custom business object class which contains properties to hold the detailed
/// information about the event data which will be rendered in calendar.
class Meeting {
  /// Creates a meeting class with required details.
  Meeting(this.eventName, this.from, this.to, this.background, this.isAllDay);

  /// Event name which is equivalent to subject property of [Appointment].
  String eventName;

  /// From which is equivalent to start time property of [Appointment].
  DateTime from;

  /// To which is equivalent to end time property of [Appointment].
  DateTime to;

  /// Background which is equivalent to color property of [Appointment].
  Color background;

  /// IsAllDay which is equivalent to isAllDay property of [Appointment].
  bool isAllDay;
}
