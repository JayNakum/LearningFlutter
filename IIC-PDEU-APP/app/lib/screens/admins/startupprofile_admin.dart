import 'package:flutter/material.dart';
import 'package:iic_pdeu/models/getstartdetails.dart';
import 'package:iic_pdeu/widgets/admin/actionpoints.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../widgets/startups/drop_down_cards.dart';
import '../../widgets/startups/team_members.dart';

class StartupAdminProfileScreen extends StatefulWidget {
  final GetStartUpDetails details;
  const StartupAdminProfileScreen(this.details, {Key? key}) : super(key: key);

  @override
  State<StartupAdminProfileScreen> createState() =>
      _StartupAdminProfileScreenState();
}

class _StartupAdminProfileScreenState extends State<StartupAdminProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IIC PDEU'),
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
                      backgroundImage:
                          Image.network(widget.details.image).image,
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Text(
                      widget.details.username,
                      style: const TextStyle(
                        fontSize: 26,
                        color: Colors.blue,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.fromLTRB(8,0,8,8),
            //   child: Column(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       ElevatedButton(
            //         onPressed: () {
            //           showDialog(
            //             context: context,
            //             builder: (BuildContext context) =>
            //                 _buildPopupDialog(context),
            //           );
            //         },
            //         style: ElevatedButton.styleFrom(
            //           primary: Colors.blue,
            //           textStyle: const TextStyle(
            //             color: Colors.white,
            //             fontSize: 20,
            //           ),
            //         ),
            //         child: const Text('Appointments List'),
            //       ),
            //     ],
            //   ),
            // ),
            Row(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(12, 6, 0, 6),
                      child: GestureDetector(
                        onTap: () {
                          launch(
                              'mailto:papnejaanmol@gmail.com?subject= Upgrade startup&body=This is Body of Email');
                        },
                        child: SizedBox(
                          height: 90,
                          width: MediaQuery.of(context).size.width * 0.445,
                          child: Card(
                            elevation: 3,
                            color: Colors.blue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: const [
                                  Text(
                                    "Startup\nStatus",
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  //SizedBox(height: 10),
                                  Icon(
                                    Icons.arrow_forward,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(12, 0, 0, 0),
                      child: GestureDetector(
                        onTap: () {
                          launch(
                              'mailto:papnejaanmol@gmail.com?subject= Upgrade startup&body=This is Body of Email');
                        },
                        child: SizedBox(
                          height: 90,
                          width: MediaQuery.of(context).size.width * 0.445,
                          child: Card(
                            elevation: 3,
                            color: Colors.blue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: const [
                                    Text(
                                      "Prototype / \nProduct Details",

                                      ///maxLines: 2,
                                      //overflow: TextOverflow.clip,
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    //SizedBox(height: 10),
                                    Icon(
                                      Icons.arrow_forward,
                                      color: Colors.white,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 6, 12, 0),
                  child: SizedBox(
                    height: 185,
                    width: MediaQuery.of(context).size.width * 0.49,
                    child: Card(
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(6, 6, 8, 2),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            const Text(
                              "IPR Details",
                              style: TextStyle(
                                fontSize: 22,
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Divider(
                              color: Colors.blue,
                              thickness: 1,
                              height: 1.5,
                            ),
                            PieChart(
                              dataMap: ({
                                'Filled': double.parse(widget
                                    .details.iprDetails.granted
                                    .toString()),
                                'Pending': double.parse(widget
                                    .details.iprDetails.pending
                                    .toString()),
                              }),
                              chartLegendSpacing: 10,
                              chartRadius: 90,
                              legendOptions: LegendOptions(
                                legendPosition: LegendPosition.bottom,
                                legendShape: BoxShape.circle,
                                showLegendsInRow: true,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12.0, 0, 12, 0),
              child: SizedBox(
                height: 65,
                width: MediaQuery.of(context).size.width,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TeamMembers(
                                username: widget.details.username)));
                  },
                  child: Card(
                    color: Colors.white,
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const <Widget>[
                          Text(
                            "Team Members",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10),
                          Icon(Icons.arrow_forward, color: Colors.blue),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            AdminDropDownCards(
                title: 'Awards and Recognition', details: widget.details),
            SizedBox(height: 6),
            AdminDropDownCards(
                title: 'Financial Support', details: widget.details),
            SizedBox(height: 6),
            AdminDropDownCards(
                title: 'Employee Generated', details: widget.details),
            Container(
              padding: const EdgeInsets.fromLTRB(12, 0, 12, 4),
              height: 150,
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
                      Row(
                        children: [
                          const Text(
                            "Action points",
                            style: TextStyle(
                              fontSize: 22,
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 130),
                          ElevatedButton(
                            onPressed: () => {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ActionpointsScreen(
                                      widget.details.mentorFeedback),
                                ),
                              ),
                            },
                            child: const Icon(Icons.edit),
                          ),
                        ],
                      ),
                      const Divider(
                        color: Colors.black,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        widget.details.mentorFeedback,
                        style: const TextStyle(
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
            const SizedBox(
              height: 12,
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(12, 0, 12, 4),
              height: 160,
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "View Quarterly Plan",
                            style: TextStyle(
                              fontSize: 22,
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 20),
                          ElevatedButton(
                            onPressed: () => {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ActionpointsScreen(
                                      widget.details.mentorFeedback),
                                ),
                              ),
                            },
                            child: const Icon(Icons.download),
                          ),
                        ],
                      ),
                      const Divider(
                        color: Colors.black,
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) => PopupDialogue(
                                  text1: 'Accept Appointment',
                                  descrip:
                                      "Are you sure you want to accept startupname's qarterly plan?",
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
                                  text1: 'Reject Quarterly Plan',
                                  descrip:
                                      "Are you sure you want to reject startupname's quarterly plan ?",
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
                                  text1: 'Modify Quarterly Plan ',
                                  descrip:
                                      "Are you sure you want to modify startupname's quarterly plan?",
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
                            child: const Text('Modify'),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            // Container(
            //   padding: const EdgeInsets.fromLTRB(12, 0, 12, 4),
            //   height: 160,
            //   width: MediaQuery.of(context).size.width,
            //   child: Card(
            //     elevation: 3,
            //     color: Colors.blue,
            //     shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(10),
            //       // side: const BorderSide(
            //       //   color: Colors.blue,
            //       //   width: 1.2,
            //       // ),
            //     ),
            //     child: Padding(
            //       padding: const EdgeInsets.all(12.0),
            //       child: Column(
            //         mainAxisAlignment: MainAxisAlignment.start,
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         children: [
            //           Row(
            //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //             children: [
            //               const Text(
            //                 "Exit and Graduation",
            //                 style: TextStyle(
            //                   fontSize: 22,
            //                   color: Colors.white,
            //                   fontWeight: FontWeight.bold,
            //                 ),
            //               ),
            //               const SizedBox(width: 20),
            //               ElevatedButton(
            //                 onPressed: () => {
            //                   Navigator.push(
            //                     context,
            //                     MaterialPageRoute(
            //                       builder: (context) =>
            //                           const ActionpointsScreen(),
            //                     ),
            //                   ),
            //                 },
            //                 child: const Icon(Icons.download),
            //               ),
            //             ],
            //           ),
            //           const Divider(
            //             color: Colors.white,
            //           ),
            //           const SizedBox(height: 10),
            //           Row(
            //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //             children: [
            //               ElevatedButton(
            //                 onPressed: () {
            //                   showDialog(
            //                     context: context,
            //                     builder: (context) => PopupDialogue(
            //                       text1: 'Exit',
            //                       descrip:
            //                           "Are you sure you want to accept startupname's exit?",
            //                     ),
            //                   );
            //                 },
            //                 style: ElevatedButton.styleFrom(
            //                   primary: Colors.white,
            //                   shape: RoundedRectangleBorder(
            //                     borderRadius: BorderRadius.circular(30.0),
            //                   ),
            //                 ),
            //                 child: const Text(
            //                   'Exit',
            //                   style: TextStyle(
            //                     color: Colors.blue,
            //                     fontSize: 15,
            //                     fontWeight: FontWeight.w500,
            //                   ),
            //                 ),
            //               ),
            //               ElevatedButton(
            //                 onPressed: () {
            //                   showDialog(
            //                     context: context,
            //                     builder: (context) => PopupDialogue(
            //                       text1: 'Graduation',
            //                       descrip:
            //                           "Are you sure you want to accept startupname's graduation?",
            //                     ),
            //                   );
            //                 },
            //                 style: ElevatedButton.styleFrom(
            //                   primary: Colors.white,
            //                   shape: RoundedRectangleBorder(
            //                     borderRadius: BorderRadius.circular(30.0),
            //                   ),
            //                 ),
            //                 child: const Text(
            //                   'Graduation',
            //                   style: TextStyle(
            //                     color: Colors.blue,
            //                     fontSize: 15,
            //                     fontWeight: FontWeight.w500,
            //                   ),
            //                 ),
            //               ),
            //             ],
            //           )
            //         ],
            //       ),
            //     ),
            //   ),
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 120,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      launch(
                          'mailto:papnejaanmol@gmail.com?subject=This is Subject Title&body=This is Body of Email');
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      textStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
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
                      launch('sms:+918734080491?body= Enter your Message here');
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
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
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildPopupDialog(BuildContext context) {
  return AlertDialog(
    title: const Text('Appointments'),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const <Widget>[
        Text("Minerva"),
      ],
    ),
    actions: <Widget>[
      FlatButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        textColor: Theme.of(context).primaryColor,
        child: const Text('Close'),
      ),
    ],
  );
}

class AdminDropDownCards extends StatefulWidget {
  final String title;
  final GetStartUpDetails details;
  const AdminDropDownCards({
    required this.title,
    required this.details,
    Key? key,
  }) : super(key: key);

  @override
  State<AdminDropDownCards> createState() => _AdminDropDownCardsState();
}

class _AdminDropDownCardsState extends State<AdminDropDownCards> {
  var _isExpanded = false;
  @override
  Widget build(BuildContext context) {
    //final userDetails = Provider.of<User>(context, listen: false);
    final colorScheme = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
      child: Card(
        elevation: 0,
        child: Column(
          children: <Widget>[
            ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: !_isExpanded
                    ? BorderRadius.circular(15)
                    : const BorderRadius.vertical(
                        top: Radius.circular(15),
                      ),
              ),
              tileColor: colorScheme.primary,
              iconColor: colorScheme.onPrimary,
              textColor: colorScheme.onPrimary,
              title: Text(widget.title),
              trailing: Icon(
                _isExpanded
                    ? Icons.arrow_drop_up_rounded
                    : Icons.arrow_drop_down_rounded,
              ),
              onTap: () {
                setState(() {
                  _isExpanded = !_isExpanded;
                });
              },
            ),
            if (_isExpanded)
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Column(
                  children: <Widget>[
                    if (widget.title.startsWith('A'))
                      Column(
                        children: <ListTile>[
                          for (int i = 0;
                              i < widget.details.awardsAndRecognition.length;
                              i++)
                            ListTile(
                              title:
                                  Text(widget.details.awardsAndRecognition[i]),
                              leading: const Icon(Icons.whatshot_rounded),
                            ),
                        ],
                      ),
                    if (widget.title.startsWith('F'))
                      PieChart(
                        dataMap: Map<String, double>.from(
                          widget.details.finances,
                        ),
                        chartType: ChartType.ring,
                      ),
                    if (widget.title.startsWith('E'))
                      Text('Employees Generated: ${widget.details.employees}'),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
          ],
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
