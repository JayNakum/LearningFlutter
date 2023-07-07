import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../helpers/api.dart';
import '../../models/get_mentorprofile.dart';

class HomeProfile extends StatelessWidget {
  final GetMentorDetails mentor;
  const HomeProfile(this.mentor, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                    backgroundImage: NetworkImage(mentor.image),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Text(
                    mentor.username,
                    style: TextStyle(
                      fontSize: 26,
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.location_history, color: Colors.blue,),
            title: Text(mentor.experties),
            trailing: const Icon(Icons.edit_rounded),
          ),
          ListTile(
            leading: const Icon(Icons.lan_rounded, color: Colors.blue,),
            title: Text(mentor.position),
            trailing: const Icon(Icons.edit_rounded),
          ),
          ListTile(
            leading: const Icon(Icons.mail_rounded, color: Colors.blue,),
            title: Text(mentor.email),
            trailing: const Icon(Icons.edit_rounded),
          ),
          ListTile(
            leading: const Icon(Icons.phone_rounded, color: Colors.blue,),
            title: Text(mentor.number),
            trailing: const Icon(Icons.edit_rounded),
          ),
          ListTile(
            leading: const Icon(Icons.list_rounded, color: Colors.blue,),
            title: Text(mentor.otherInformation),
            trailing: const Icon(Icons.edit_rounded),
          ),
        ],
      ),
    );
  }
}
