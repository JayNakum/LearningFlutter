import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:iic_pdeu/providers/user.dart';
import 'package:iic_pdeu/widgets/calendar.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../helpers/api.dart';
import '../../models/getstartdetails.dart';
import '../../widgets/startups/mentors_card.dart';
import '../../widgets/startups/profile_details.dart';
import '../../widgets/startups/support_option_button.dart';
import '../app/start_screen.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/startup-home';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _index = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    const ProfileDetails(),
    const SupportServices(),
    const Calendar(),
    const MentorsCards(),
    //const MentorProfileScreen()
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
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(15),
          ),
        ),
        centerTitle: true,
        title: Text("IIC PDEU"),
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
            const SizedBox(height: 10,),
            ListTile(
              leading: const Icon(
                Icons.contact_phone,
              ),
              title: const Text('Contact Support'),
              onTap: () {
                launch(
                          'mailto:iicpdeu.app@gmail.com?subject= Upgrade startup&body=This is Body of Email');
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.logout,
              ),
              title: const Text('Log Out'),
              onTap: () {
                // TODO: Delete TOken
                // TODO: Delete Token
                API.token = '0';
                Navigator.of(context)
                    .pushReplacementNamed(StartScreen.routeName);
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: _widgetOptions.elementAt(_index),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.man),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.support_agent),
            label: 'Support',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: 'Calendar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.manage_accounts),
            label: 'Mentors',
          ),
        ],
        currentIndex: _index,
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        unselectedItemColor: Theme.of(context).colorScheme.primary,
        onTap: _onItemTapped,
      ),
    );
  }
}
