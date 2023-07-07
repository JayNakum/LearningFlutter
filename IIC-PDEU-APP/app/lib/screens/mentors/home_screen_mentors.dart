import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:iic_pdeu/models/get_mentorprofile.dart';
import 'package:iic_pdeu/providers/user.dart';
import 'package:iic_pdeu/screens/startups/mentor_profile_screen.dart';
import 'package:iic_pdeu/widgets/calendar.dart';
import 'package:iic_pdeu/widgets/mentors/home_profile.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../../helpers/api.dart';
import '../../widgets/mentors/appointments.dart';
import '../../widgets/mentors/startups_cards.dart';
import '../app/start_screen.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/mentor-home';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mentor = Provider.of<User>(context, listen: false).details;
    return BottomNavigation(mentor);
  }
}

class BottomNavigation extends StatefulWidget {
  final GetMentorDetails mentor;
  const BottomNavigation(this.mentor, {Key? key}) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _index = 0;
  static final List<Widget> _widgetOptions = <Widget>[];

  void _onItemTapped(int index) {
    setState(() {
      _index = index;
    });
  }

  @override
  void initState() {
    super.initState();

    _widgetOptions.addAll(<Widget>[
      HomeProfile(widget.mentor),
      const StartupsCards(),
      const Calendar(),
      // Appointments(),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IIC PDEU'),
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Image(image: AssetImage('assets/images/logo.png')),
            ),
            SizedBox(height: 10,),
            ListTile(
              leading: const Icon(
                Icons.contact_phone,
              ),
              title: const Text('Contact Support'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.logout,
              ),
              title: const Text('Log Out'),
              onTap: () {
                // TODO: Delete Token
                // TODO: Delete Token
                API.token = '0';
                Navigator.of(context)
                    .pushReplacementNamed(StartScreen.routeName);
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: _widgetOptions.elementAt(_index),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.person_rounded),
            label: 'Mentor Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people_rounded),
            label: 'Startups',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: 'Calendar',
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.more_time_outlined),
          //   label: 'Appointments',
          // ),
        ],
        currentIndex: _index,
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        unselectedItemColor: Theme.of(context).colorScheme.primary,
        onTap: _onItemTapped,
      ),
    );
  }
}
