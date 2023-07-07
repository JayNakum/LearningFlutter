import 'dart:convert';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:iic_pdeu/helpers/api.dart';
import 'package:iic_pdeu/models/get_admin_dashboard.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  bool _isLoading = true;
  GetAdminDashoard? data;

  @override
  void initState() {
    super.initState();
    API.adminDashboard().then((value) {
      setState(() {
        data = value;
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? const Center(child: CircularProgressIndicator())
        : Column(
            children: [
              DashboardCards(data!),
              //OtherDetailsCards(data!),
              LineChartCard(title: 'Active Startups', data!.activeStartups),
              //DashBoardsCards2(data!),
              LineChartCard(
                  title: 'Startups Till Date', data!.startupsTillDate),
              LineChartCard(
                  title: 'Employment Generated',
                  data!.totalEmploymentGenerated),
            ],
          );
  }
}

class DashboardCards extends StatelessWidget {
  final GetAdminDashoard data;
  const DashboardCards(this.data, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
        ),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: <Widget>[
          Card(
            color: Theme.of(context).colorScheme.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridTile(
                footer: const Center(
                  child: Text(
                    'Applications received',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 18),
                    Text(
                      data.totalApplications.toString(),
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 62,
                          fontWeight: FontWeight.w500),
                    ),
                    const Divider(
                      color: Colors.white,
                      height: 25,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Card(
            color: Theme.of(context).colorScheme.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridTile(
                footer: const Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    'Newly Incubated Startups',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 18),
                    Text(
                      data.newlyIncubatedStartups.toString(),
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 62,
                          fontWeight: FontWeight.w500),
                    ),
                    const Divider(
                      color: Colors.white,
                      height: 23,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Card(
            color: Theme.of(context).colorScheme.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridTile(
                footer: const Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    'Startup Awards',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 18),
                    Text(
                      data.totalStartupAwards.toString(),
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 62,
                          fontWeight: FontWeight.w500),
                    ),
                    Divider(
                      color: Colors.white,
                      height: 15,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Card(
            color: Theme.of(context).colorScheme.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridTile(
                footer: const Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    'Accumulated funds raised',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 32),
                    Text(
                      data.accumulatedStartupSales.toString(),
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 38,
                          fontWeight: FontWeight.w500),
                    ),
                    const Divider(
                      color: Colors.white,
                      height: 40,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DashBoardsCards2 extends StatelessWidget {
  final GetAdminDashoard data;
  const DashBoardsCards2(this.data, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
        ),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: <Widget>[
          Card(
            color: Theme.of(context).colorScheme.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridTile(
                footer: const Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    'IPR filed',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                child: Column(
                  children: const [
                    SizedBox(height: 18),
                    Text(
                      '18',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 62,
                          fontWeight: FontWeight.w500),
                    ),
                    Divider(
                      color: Colors.white,
                      height: 42,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Card(
            color: Theme.of(context).colorScheme.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridTile(
                footer: const Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    'Accumulated sales of Startups',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                child: Column(
                  children: const [
                    SizedBox(height: 25),
                    Text(
                      '2.34 Cr.',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.w500),
                    ),
                    Divider(
                      color: Colors.white,
                      height: 58,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class LineChartCard extends StatefulWidget {
  final List data;
  final String title;
  const LineChartCard(this.data, {Key? key, required this.title})
      : super(key: key);

  @override
  State<LineChartCard> createState() => _LineChartCardState();
}

class _LineChartCardState extends State<LineChartCard> {
  @override
  Widget build(BuildContext context) {
    List <double> doubl = [10,20,30,40,50,60,70,80,90,100];
    return Container(
      padding: const EdgeInsets.all(3),
      height: 270,
      width: MediaQuery.of(context).size.width,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(2, 2, 14, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(widget.title,
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
              ),
              const SizedBox(height: 15),
              Container(
                height: 200,
                width: MediaQuery.of(context).size.width,
                child: LineChart(
                  LineChartData(
                      titlesData: FlTitlesData(
                        show: true,
                        rightTitles: AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        topTitles: AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                      ),
                      lineBarsData: [
                        LineChartBarData(
                          spots: [
                            
                            FlSpot(0, 0),
                            for (var i = 0; i < widget.data.length - 1; i++)
                              FlSpot(doubl[i] as double,
                                  widget.data[i] as double),
                          ],
                          color: Colors.blue,
                        ),
                      ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OtherDetailsCards extends StatelessWidget {
  final GetAdminDashoard data;
  const OtherDetailsCards(this.data, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        children: const <Widget>[
          OtherDetailsCard(title: 'Title'),
          SizedBox(height: 10),
          OtherDetailsCard(title: 'Title'),
          SizedBox(height: 10),
          OtherDetailsCard(title: 'Title'),
          SizedBox(height: 10),
          OtherDetailsCard(title: 'Title'),
        ],
      ),
    );
  }
}

class OtherDetailsCard extends StatefulWidget {
  final String title;
  const OtherDetailsCard({
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  State<OtherDetailsCard> createState() => _OtherDetailsCardState();
}

class _OtherDetailsCardState extends State<OtherDetailsCard> {
  var _isExpanded = false;
  @override
  Widget build(BuildContext context) {
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
                  Text(widget.title),
                  const SizedBox(height: 10),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
