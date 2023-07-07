import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:api_practice2/models/address.dart';

class API {
  static const String _baseUrl = '3.110.132.192:8000';
  static const String _token =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2MmE4N2ZkZjA1NmIyZjAxOGVlMDU5ZTQiLCJpYXQiOjE2NTUyMDk5ODQsImV4cCI6MTY2Mjk4NTk4NH0.JGMh8Z7LHc0SR6UtSE3g-0cFDLAdYz-mhNBRRCA032U';

  void getAddress(String id) async {
    var url = Uri.http(
      _baseUrl,
      '/api/v1/user/address/getAddress',
      {'id': id},
    );
    final response = await http.get(url, headers: {
      'Authorization': 'Bearer $_token',
    });
    if (response.statusCode == 200) {
      final responseData = json.decode(response.body) as Map<String, dynamic>;
      if (responseData.containsKey('address')) {
        final responseAddress = responseData['address'] as Map<String, dynamic>;
        final address = Address(
          addressLine1: responseAddress['addressLine1'],
          addressLine2: responseAddress['addressLine2'],
          landmark: responseAddress['landmark'],
          city: responseAddress['city'],
          state: responseAddress['state'],
          country: responseAddress['country'],
        );
        print(
            '[RESPONSE ADDRESS]: {\n${address.addressLine1},\n${address.addressLine2},\n${address.landmark},\n${address.city},\n${address.state},\n${address.country}\n}');
      }
    }
  }

  void getAllAddress() async {
    final addresses = <Address>[];
    var url = Uri.http(_baseUrl, '/api/v1/user/address/getAllMyAddress');
    final response = await http.get(url, headers: {
      'Authorization': 'Bearer $_token',
    });
    if (response.statusCode == 200) {
      final responseData = json.decode(response.body) as Map<String, dynamic>;
      if (responseData.containsKey('address')) {
        final List<dynamic> responseAddresses = responseData['address'];
        int count = 1;
        for (var address in responseAddresses) {
          addresses.add(
            Address(
              addressLine1: address['addressLine1'],
              addressLine2: address['addressLine2'],
              landmark: address['landmark'],
              city: address['city'],
              state: address['state'],
              country: address['country'],
            ),
          );
          print(
              '[RESPONSE ADDRESS $count]: {\n${address['addressLine1']},\n${address['addressLine2']},\n${address['landmark']},\n${address['city']},\n${address['state']},\n${address['country']}\n}');
          count++;
        }
      }
    }
  }
}
