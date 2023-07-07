// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:iic_pdeu/models/get_admin_dashboard.dart';
import 'package:iic_pdeu/models/get_admin_profile.dart';
import 'package:iic_pdeu/models/get_mentorappointments.dart';
import 'package:iic_pdeu/models/get_mentorprofile.dart';
import 'package:iic_pdeu/models/get_projectdetails.dart';
import 'package:iic_pdeu/models/get_team_details.dart';
import 'package:iic_pdeu/models/getadminappointments.dart';
import 'package:iic_pdeu/models/getevents.dart';
import 'package:iic_pdeu/models/getstartdetails.dart';
import 'package:iic_pdeu/models/roles.dart';

class API {
  static String currentUser = '';
  static String token = '';
  static const String _baseURL = 'https://cam-system.herokuapp.com/';
  static Future<void> login({
    required String username,
    required String password,
  }) async {
    final uri = Uri.parse('${_baseURL}login/');
    try {
      final response = await http.post(uri, body: {
        'username': username,
        'password': password,
      });
      final responseData = json.decode(response.body) as Map<String, dynamic>;
      print(responseData);
      token = responseData['token'];
      currentUser = responseData['username'];
    } catch (err) {
      print(err);
    }
  }

  static Future<Map<String, dynamic>> authenticate() async {
    final uri = Uri.parse('${_baseURL}user/');
    try {
      final response = await http.get(
        uri,
        headers: {'Authorization': 'Bearer $token'},
      );
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body) as Map<String, dynamic>;
        var username = responseData['user']['username'];
        print(responseData);
        if (responseData['user']['is_staff']) {
          return {'username': username, 'role': Role.admin};
        } else if (responseData['user']['is_mentor']) {
          return {'username': username, 'role': Role.mentor};
        } else {
          return {'username': username, 'role': Role.startup};
        }
      } else {
        throw Exception('Failed to authenticate');
      }
    } catch (err) {
      print(err);
    }
    return {'username': 'Visitor', 'role': Role.other};
  }

  static Future<void> messAndAccomodation({
    required String username,
    required String email,
    required String durationA,
    required String numberOfPeopleA,
    required String namesA,
    required String remarksA,
    required String durationM,
    required String numberOfPeopleM,
    required String namesM,
    required String remarksM,
  }) async {
    var headers = {'Authorization': 'Bearer $token'};
    var request = http.MultipartRequest(
        'POST', Uri.parse('${_baseURL}Mess-And-Accommodation/'));
    request.fields.addAll({
      'username ': username,
      'email': email,
      'expected_duration_accommodation': durationA,
      'number_of_people_accommodation': numberOfPeopleA,
      'names_of_people_accommodation': namesA,
      'other_remarks_accommodation': remarksA,
      'expected_duration_mess': durationA,
      'number_of_people_mess': numberOfPeopleM,
      'names_of_people_mess': namesM,
      'other_remarks_mess': remarksM,
    });

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }

  static Future<void> financialServices({
    required String username,
    required String email,
    required String item_name,
    required String item_value,
    required String quantity,
    required String total_Value,
    required String other_remarks,
  }) async {
    var headers = {'Authorization': 'Bearer $token'};
    var request = http.MultipartRequest(
        'POST', Uri.parse('${_baseURL}Financial-Services/'));
    request.fields.addAll({
      'username ': username,
      'email': email,
      'item_name': item_name,
      'item_value': item_value,
      'quantity': quantity,
      'total_Value': total_Value,
      'other_remarks': other_remarks,
    });

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }

  static Future<void> exitAndGraduation({
    required String username,
    required String email,
    required String extension_time,
    required String reason_for_extension,
    required String progress_update,
    required String other_remarks,
  }) async {
    var headers = {'Authorization': 'Bearer $token'};
    var request = http.MultipartRequest(
        'POST', Uri.parse('${_baseURL}Exit-And-Graduation/'));
    request.fields.addAll({
      'username ': username,
      'email': email,
      'extension_time': extension_time,
      'reason_for_extension': reason_for_extension,
      'progress_update': progress_update,
      'other_remarks': other_remarks,
    });

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }

  static Future<void> labServices({
    required String username,
    required String email,
    required String name_of_laboratory,
    required String equipment_required,
    required String raw_materials_required,
    required String test,
    required String duration,
    required String number_of_people,
    required String names_of_people,
    required String other_remarks,
  }) async {
    var headers = {'Authorization': 'Bearer $token'};
    var request =
        http.MultipartRequest('POST', Uri.parse('${_baseURL}Lab-Services/'));
    request.fields.addAll({
      'username ': username,
      'email': email,
      'name_of_laboratory': name_of_laboratory,
      'equipment_required': equipment_required,
      'raw_material_required': raw_materials_required,
      'test': test,
      'duration': duration,
      'number_of_people': number_of_people,
      'names_of_people': names_of_people,
      'other_remarks': other_remarks,
    });

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }

  static Future<void> procurementServices({
    required String username,
    required String email,
    required String item_name,
    required String detailed_specification,
    required String expected_unit_price,
    required String required_quantity,
    required String supplier_1,
    required String supplier_2,
    required String supplier_3,
    required String supplier_4,
    required String supplier_5,
    required String other_remarks,
  }) async {
    var headers = {'Authorization': 'Bearer $token'};
    var request = http.MultipartRequest(
        'POST', Uri.parse('${_baseURL}Procurement-Service/'));
    request.fields.addAll({
      'username ': username,
      'email': email,
      'item_name': item_name,
      'detailed_specification': detailed_specification,
      'expected_unit_price': expected_unit_price,
      'required_quantity': required_quantity,
      'supplier_1': supplier_1,
      'supplier_2': supplier_2,
      'supplier_3': supplier_3,
      'supplier_4': supplier_4,
      'supplier_5': supplier_5,
      'other_remarks': other_remarks,
    });

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }

  static Future<void> iprServices({
    required String username,
    required String email,
    required String type_of_IPR,
    required String proposed_title,
    required String other_remarks,
  }) async {
    var headers = {'Authorization': 'Bearer $token'};
    var request =
        http.MultipartRequest('POST', Uri.parse('${_baseURL}IPR-Services/'));
    request.fields.addAll({
      'username ': username,
      'email': email,
      'type_of_IPR': type_of_IPR,
      'proposed_title': proposed_title,
      'other_remarks': other_remarks,
    });

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }

  static Future<List<GetStartUpDetails>> getStartUps() async {
    try {
      var url = Uri.parse('${_baseURL}StartUp-Profile/');
      var response = await http.get(
        url,
        headers: {'Authorization': 'Bearer $token'},
      );
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        print('model: $responseData');
        final startups = (responseData as List)
            .map<GetStartUpDetails>((json) => GetStartUpDetails.fromJson(json))
            .toList();
        return startups;
      }
    } catch (e) {
      print(e.toString());
    }
    return [];
  }

  static Future<GetStartUpDetails?> getStartUpDetails(String username) async {
    try {
      var url = Uri.parse('${_baseURL}StartUp-Profile/$username/');
      var response = await http.get(
        url,
        headers: {'Authorization': 'Bearer $token'},
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body) as Map<String, dynamic>;
        print('model: $responseData');
        final GetStartUpDetails model =
            GetStartUpDetails.fromJson(responseData);
        return model;
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

  static Future<GetProjectDetails?> getProjectDetails() async {
    try {
      var url = Uri.parse('${_baseURL}Project-Details/');
      var response = await http.get(
        url,
        headers: {'Authorization': 'Bearer $token'},
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        final responseData =
            (json.decode(response.body) as List).first as Map<String, dynamic>;
        print('model: $responseData');
        final GetProjectDetails model =
            GetProjectDetails.fromJson(responseData);
        return model;
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

  static Future<List<GetMentorDetails>> getMentors() async {
    try {
      var url = Uri.parse('${_baseURL}Mentor-Profiles/');
      var response = await http.get(
        url,
        headers: {'Authorization': 'Bearer $token'},
      );
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        print('model: $responseData');
        final mentors = (responseData as List)
            .map<GetMentorDetails>((json) => GetMentorDetails.fromJson(json))
            .toList();
        return mentors;
      }
    } catch (e) {
      print(e.toString());
    }
    return [];
  }

  static Future<List<GetMentorAppointments>> getAppointments() async {
    try {
      var url = Uri.parse('${_baseURL}Mentor-Profiles/');
      var response = await http.get(
        url,
        headers: {'Authorization': 'Bearer $token'},
      );
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        print('model: $responseData');
        final mentors = (responseData as List)
            .map<GetMentorAppointments>(
                (json) => GetMentorAppointments.fromJson(json))
            .toList();
        return mentors;
      }
    } catch (e) {
      print(e.toString());
    }
    return [];
  }

  static Future<GetMentorDetails?> getMentorDetails(String username) async {
    try {
      var url = Uri.parse('${_baseURL}Mentor-Profile/$username/');
      var response = await http.get(
        url,
        headers: {'Authorization': 'Bearer $token'},
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body) as Map<String, dynamic>;
        print('model: $responseData');
        final GetMentorDetails model = GetMentorDetails.fromJson(responseData);
        return model;
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

  static Future<GetMentorAppointments?> getMentorAppointments(
      String username) async {
    try {
      var url = Uri.parse('${_baseURL}MentorAppointment/$username/');
      var response = await http.get(
        url,
        headers: {'Authorization': 'Bearer $token'},
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body) as Map<String, dynamic>;
        print('model: $responseData');
        final GetMentorAppointments model =
            GetMentorAppointments.fromJson(responseData);
        return model;
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

  static Future<GetAdminProfile> getAdminDetails(String username) async {
    try {
      var url = Uri.parse('${_baseURL}Admin-Profile/$username/');
      var response =
          await http.get(url, headers: {'Authorization': 'Bearer $token'});
      if (response.statusCode == 200) {
        final model = getAdminProfileFromJson(response.body);
        return model;
      }
    } catch (e) {
      print(e.toString());
    }
    throw Exception('Failed to load admin profile');
  }

  static Future<void> createAppointment({
    required String username,
    required String password,
  }) async {
    final uri = Uri.parse('${_baseURL}AdminAppointment/');
    try {
      final response = await http.post(uri, body: {
        'username': username,
        'password': password,
      });
      final responseData = json.decode(response.body) as Map<String, dynamic>;
      print(responseData);
      token = responseData['token'];
    } catch (err) {
      print(err);
    }
  }

  static Future<GetTeamDetails?> getTeamDetail(String username) async {
    try {
      var url = Uri.parse('${_baseURL}Team/$username/');
      var response = await http.get(
        url,
        headers: {'Authorization': 'Bearer $token'},
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        final responseData =
            (json.decode(response.body) as List).first as Map<String, dynamic>;
        print('model: $responseData');
        final GetTeamDetails model = GetTeamDetails.fromJson(responseData);
        return model;
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

  static Future<GetTeamDetails?> getTeamDetails() async {
    try {
      var url = Uri.parse('${_baseURL}Team/');
      var response = await http.get(
        url,
        headers: {'Authorization': 'Bearer $token'},
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        final responseData =
            (json.decode(response.body) as List).first as Map<String, dynamic>;
        print('model: $responseData');
        final GetTeamDetails model = GetTeamDetails.fromJson(responseData);
        return model;
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

  static Future<void> bookAppointment(
      {required String username,
      required DateTime ondate,
      required String onwith}) async {
    try {
      var url = Uri.parse('${_baseURL}AdminAppointment/');
      var response = await http.post(
        url,
        body: {
          'username': username,
          'appointment_Date': ondate,
          'appointment_with': onwith,
        },
        headers: {'Authorization': 'Bearer $token'},
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body) as Map<String, dynamic>;
        print('model: $responseData');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  static Future<List<GetEvents>> getEvents() async {
    try {
      var url = Uri.parse('${_baseURL}Events/');
      var response = await http.get(
        url,
        headers: {'Authorization': 'Bearer $token'},
      );
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        print('model: $responseData');
        final events = (responseData as List)
            .map<GetEvents>((json) => GetEvents.fromJson(json))
            .toList();
        return events;
      }
    } catch (e) {
      print(e.toString());
    }
    return [];
  }

  static Future<List<GetAdminAppointments>> getAdminAppointments(
    String username,
  ) async {
    try {
      var url = Uri.parse('${_baseURL}AdminAppointments/$username/');
      var response =
          await http.get(url, headers: {'Authorization': 'Bearer $token'});
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body) as List;

        print('Model: $responseData');
        return responseData
            .map<GetAdminAppointments>(
                (json) => GetAdminAppointments.fromJson(json))
            .toList();
      }
    } catch (e) {
      print(e.toString());
    }
    return [];
  }

  static Future<void> createEvent(
      String username, String name, String desc, DateTime dateTime) async {
    try {
      var url = Uri.parse('${_baseURL}Admin-Events/');
      var response = await http.post(
        url,
        body: {
          "created_by": username,
          "event_name": name,
          "event_date": dateTime.toString(),
          "event_brief": desc,
        },
        headers: {'Authorization': 'Bearer $token'},
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body) as Map<String, dynamic>;
        print('model: $responseData');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  static Future<GetAdminDashoard> adminDashboard() async {
    try {
      var url = Uri.parse('${_baseURL}Admin-Dashboard/IIC/');
      var response = await http.get(
        url,
        headers: {'Authorization': 'Bearer $token'},
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body) as Map<String, dynamic>;
        print('model: $responseData');
        final GetAdminDashoard model = GetAdminDashoard.fromJson(responseData);
        return model;
      }
    } catch (e) {
      print(e.toString());
    }
    throw Exception('Failed to load admin dashboard');
  }
}
