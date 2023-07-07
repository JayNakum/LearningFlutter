import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:iic_pdeu/helpers/api.dart';
import 'package:iic_pdeu/models/get_admin_profile.dart';
import 'package:iic_pdeu/screens/app/start_screen.dart';
import 'package:iic_pdeu/widgets/admin/Admin_profile.dart';
import 'package:iic_pdeu/widgets/admin/awards_list.dart';
import 'package:iic_pdeu/widgets/admin/dashboard.dart';
import 'package:iic_pdeu/widgets/admin/events.dart';
import 'package:iic_pdeu/widgets/admin/inquries_admins.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../../providers/user.dart';
import '../../widgets/calendar.dart';
import '../../widgets/mentors/startups_cards.dart';
import '../../widgets/startups/mentors_card.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/admin-home';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final admin = Provider.of<User>(context, listen: false).details;
    return BottomNavigation(admin);
  }
}

class BottomNavigation extends StatefulWidget {
  final GetAdminProfile admin;
  const BottomNavigation(this.admin, {Key? key}) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _index = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    const Dashboard(),
    StartupsCards(),
    MentorsCards(),
    EventsScreen(),
    Calendar(),
    //InquriesScreen(),
    // const AwardsList(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IIC PDEU'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: _widgetOptions.elementAt(_index),
        ),
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
              title: const Text('Contact Support', style: TextStyle(color: Colors.blue),),
              onTap: () {
                Navigator.pop(context);
              },
            ),
             ListTile(
              leading: const Icon(
                Icons.person,
              ),
              title: const Text('View Profile', style: TextStyle(color: Colors.blue),),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => AdminProfile(widget.admin),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.logout,
              ),
              title: const Text('Log Out', style: TextStyle(color: Colors.blue),),
              onTap: () {
                // TODO: Delete Token
                API.token = '0';
                Navigator.of(context)
                    .pushReplacementNamed(StartScreen.routeName);
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.man),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people_alt_rounded),
            label: 'StartUps',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.manage_accounts_rounded),
            label: 'Mentors',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.event_rounded),
            label: 'Events',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: 'Calendar',
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.manage_accounts),
          //   label: 'Inquries',
          // ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.plus_one_rounded),
          //   label: 'Awards',
          // ),
        ],
        currentIndex: _index,
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        unselectedItemColor: Theme.of(context).colorScheme.primary,
        onTap: _onItemTapped,
      ),
      floatingActionButton: _index == 4
          ? FloatingActionButton(
              onPressed: () {},
              child: const Icon(Icons.add),
            )
          : null,
    );
  }
}
