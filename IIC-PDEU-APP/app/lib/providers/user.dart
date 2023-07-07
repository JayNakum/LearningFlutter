import 'package:flutter/foundation.dart';
import 'package:iic_pdeu/models/get_admin_profile.dart';
import 'package:iic_pdeu/models/get_mentorprofile.dart';
import 'package:iic_pdeu/models/getstartdetails.dart';
import 'package:iic_pdeu/widgets/startups/Project_details.dart';

import '../models/get_projectdetails.dart';
import '../models/getadminappointments.dart';
import '../models/getevents.dart';
import '../models/roles.dart';

class User with ChangeNotifier {
  String? token;
  Role? role;
  GetStartUpDetails? startupDetails;
  GetMentorDetails? mentorDetails;
  GetAdminProfile? adminDetails;
  List<GetAdminAppointments>? adminAppointments;
  GetProjectDetails? projectDetails;
  List<GetEvents>? events;

  dynamic get details {
    if (role == Role.startup) {
      return startupDetails;
    } else if (role == Role.mentor) {
      return mentorDetails;
    } else if (role == Role.admin) {
      return adminDetails;
    }
    return null;
  }
}
