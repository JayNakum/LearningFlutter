import 'package:flutter/material.dart';
import 'package:iic_pdeu/models/getstartdetails.dart';
import 'package:iic_pdeu/providers/user.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:provider/provider.dart';

class DropDownCards extends StatelessWidget {
  const DropDownCards({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        children: <Widget>[
          DropDownCard(title: 'IPR Details'),
          SizedBox(height: 10),
          DropDownCard(title: 'Awards and Recognition'),
          SizedBox(height: 10),
          DropDownCard(title: 'Financial Support'),
          SizedBox(height: 10),
          DropDownCard(title: 'Employee Generated'),
        ],
      ),
    );
  }
}

class DropDownCard extends StatefulWidget {
  final String title;
  const DropDownCard({
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  State<DropDownCard> createState() => _DropDownCardState();
}

class _DropDownCardState extends State<DropDownCard> {
  var _isExpanded = false;
  @override
  Widget build(BuildContext context) {
    final userDetails =
        Provider.of<User>(context, listen: false).details as GetStartUpDetails;
    final colorScheme = Theme.of(context).colorScheme;
    return Card(
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
            title: Text(widget.title,
                style: const TextStyle(fontWeight: FontWeight.w500)),
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
                  if (widget.title.startsWith('I'))
                    PieChart(dataMap: {
                      'Filled': double.parse(
                          userDetails.iprDetails.granted.toString()),
                      'Pending': double.parse(
                          userDetails.iprDetails.pending.toString()),
                    }),
                  if (widget.title.startsWith('A'))
                    Column(
                      children: <ListTile>[
                        for (int i = 0;
                            i < userDetails.awardsAndRecognition.length;
                            i++)
                          ListTile(
                            title: Text(userDetails.awardsAndRecognition[i]),
                            leading: const Icon(Icons.whatshot_rounded),
                          ),
                      ],
                    ),
                  if (widget.title.startsWith('F'))
                    PieChart(
                      dataMap: Map<String, double>.from(
                        userDetails.finances,
                      ),
                      chartType: ChartType.ring,
                    ),
                  if (widget.title.startsWith('E'))
                    Column(
                      children: [
                        Text(
                          'Employment Generated: ${userDetails.employees}',
                          style: const TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 18),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            for (var i = 0; i < userDetails.employees; i++)
                              const Icon(Icons.person_outline_rounded,
                                  size: 35, color: Colors.lightBlueAccent),
                          ],
                        )
                      ],
                    ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
