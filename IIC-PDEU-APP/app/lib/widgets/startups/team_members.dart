import 'package:flutter/material.dart';
import 'package:iic_pdeu/models/get_team_details.dart';

import '../../helpers/api.dart';

class TeamMembers extends StatefulWidget {
  final String username, page;
  const TeamMembers({required this.username, this.page = '', Key? key})
      : super(key: key);

  @override
  State<TeamMembers> createState() => _TeamMembersState();
}

class _TeamMembersState extends State<TeamMembers> {
  bool _isLoading = true;
  GetTeamDetails? _teamDetails;

  @override
  void initState() {
    super.initState();

    if (widget.page == 'startup') {
      API.getTeamDetails().then((value) {
        _teamDetails = value;
      }).then((_) => setState(() => _isLoading = false));
    } else {
      API.getTeamDetail(widget.username).then((value) {
        _teamDetails = value;
      }).then((value) => setState(() => _isLoading = false));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Team Members'),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(12.0),
              child: GridView(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                children: [
                  Container(
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(15)),
                    child: Column(
                      children: <Widget>[
                        CircleAvatar(
                          radius: 50,
                          backgroundImage:
                              NetworkImage(_teamDetails!.member1.image),
                        ),
                        const SizedBox(
                          height: 27,
                        ),
                        Text(_teamDetails!.member1.name,
                            style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.white)),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(15)),
                    child: Column(
                      children: <Widget>[
                        CircleAvatar(
                          radius: 50,
                          backgroundImage:
                              NetworkImage(_teamDetails!.member2.image),
                        ),
                        const SizedBox(
                          height: 27,
                        ),
                        Text(_teamDetails!.member2.name,
                            style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.white)),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(15)),
                    child: Column(
                      children: <Widget>[
                        CircleAvatar(
                          radius: 50,
                          backgroundImage:
                              NetworkImage(_teamDetails!.member3.image),
                        ),
                        const SizedBox(
                          height: 27,
                        ),
                        Text(_teamDetails!.member3.name,
                            style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.white)),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(15)),
                    child: Column(
                      children: <Widget>[
                        CircleAvatar(
                          radius: 50,
                          backgroundImage:
                              NetworkImage(_teamDetails!.member4.image),
                        ),
                        const SizedBox(
                          height: 27,
                        ),
                        Text(_teamDetails!.member4.name,
                            style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.white)),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(15)),
                    child: Column(
                      children: <Widget>[
                        CircleAvatar(
                          radius: 50,
                          backgroundImage:
                              NetworkImage(_teamDetails!.member5.image),
                        ),
                        const SizedBox(
                          height: 27,
                        ),
                        Text(_teamDetails!.member5.name,
                            style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.white)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
