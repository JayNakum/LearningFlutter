import 'package:flutter/material.dart';
import 'package:iic_pdeu/models/get_projectdetails.dart';
import 'package:iic_pdeu/models/getstartdetails.dart';
import 'package:iic_pdeu/providers/user.dart';
import 'package:provider/provider.dart';

import '../../helpers/api.dart';

class ProjectDetails extends StatefulWidget {
  const ProjectDetails({Key? key}) : super(key: key);

  @override
  State<ProjectDetails> createState() => _ProjectDetailsState();
}

class _ProjectDetailsState extends State<ProjectDetails> {
  bool _isLoading = true;
  GetProjectDetails? _projectDetails;
  String? image;

  @override
  void initState() {
    super.initState();
    API
        .getProjectDetails()
        .then((value) => _projectDetails = value)
        .then((_) => API
            .getStartUpDetails(_projectDetails!.username)
            .then((value) => image = value!.image))
        .then((value) => setState(() => _isLoading = false));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Project Details'),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(3.0),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 20.0, left: 20.0, right: 20.0),
                    child: AspectRatio(
                      aspectRatio: 2 / 1,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        elevation: 5,
                        child: GridTile(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                image: NetworkImage(
                                  image!,
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  _projectDetails!.username,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Card(
                      child: ListTile(
                    leading: const Icon(
                      Icons.linear_scale_rounded,
                      color: Colors.blue,
                      size: 40,
                    ),
                    title: Text(
                      'Project Stage:',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 16),
                    ),
                    subtitle: Text(
                      _projectDetails!.projectStage,
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                  )),
                  const SizedBox(height: 5),
                  Card(
                      child: ListTile(
                    leading: Icon(
                      Icons.summarize,
                      color: Colors.blue,
                      size: 40,
                    ),
                    title: Text(
                      'Project Summary:',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 16),
                    ),
                    subtitle: Text(
                      _projectDetails!.projectSummary,
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                  )),
                  const SizedBox(height: 5),
                  Card(
                      child: ListTile(
                    leading: Icon(
                      Icons.design_services,
                      color: Colors.blue,
                      size: 40,
                    ),
                    title: Text(
                      'Prototype Details:',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 16),
                    ),
                    subtitle: Text(
                      _projectDetails!.prototypeDetails,
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                  )),
                  const SizedBox(height: 5),
                  Card(
                      child: ListTile(
                    leading: Icon(
                      Icons.calendar_month_rounded,
                      color: Colors.blue,
                      size: 40,
                    ),
                    title: Text(
                      'Quaterly Plan:',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 16),
                    ),
                    subtitle: Text(
                      _projectDetails!.quaterlyPlan,
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                  )),
                ],
              ),
            ),
    );
    ;
  }
}
