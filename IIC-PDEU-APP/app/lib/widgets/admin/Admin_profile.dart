import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:iic_pdeu/models/get_admin_profile.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../helpers/api.dart';
import '../../models/get_mentorprofile.dart';

class AdminProfile extends StatelessWidget {
  final GetAdminProfile admin;
  const AdminProfile(this.admin, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
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
                      backgroundImage: NetworkImage(admin.image),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Text(
                      admin.username,
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
              title: Text(admin.expertise),
              trailing: const Icon(Icons.edit_rounded),
            ),
            ListTile(
              leading: const Icon(Icons.lan_rounded, color: Colors.blue,),
              title: Text(admin.position),
              trailing: const Icon(Icons.edit_rounded),
            ),
            ListTile(
              leading: const Icon(Icons.phone, color: Colors.blue,),
              title: Text(admin.otherInformation),
              trailing: const Icon(Icons.edit_rounded),
            ),
            // ListTile(
            //   leading: const Icon(Icons.phone_rounded, color: Colors.blue,),
            //   title: Text(admin.position),
            //   trailing: const Icon(Icons.edit_rounded),
            // ),
            // ListTile(
            //   leading: const Icon(Icons.list_rounded, color: Colors.blue,),
            //   title: Text(admin.position),
            //   trailing: const Icon(Icons.edit_rounded),
            // ),
          ],
        ),
      ),
    );
  }
}
