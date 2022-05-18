import 'package:flutter/material.dart';
import 'package:timetable/screens/get_details_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: height,
        width: width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Time Table',
                style: Theme.of(context).textTheme.displayLarge,
              ),
              Text(
                'Create a time table for your institute.\n',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              ElevatedButton.icon(
                autofocus: true,
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const GetDetailsScreen(),
                    ),
                  );
                },
                icon: const Icon(Icons.calendar_month_rounded),
                label: Text(
                  'Create',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize:
                        Theme.of(context).textTheme.displaySmall!.fontSize,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
