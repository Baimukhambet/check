import 'dart:convert';

import 'package:http/http.dart' as http;

class RkeeperService {
  static final shared = RkeeperService._();

  RkeeperService._();

  final String url = "https://ws.ucs.ru/wsserverlp/api/v2/aggregators/Create";
  final String aggregatorAuthenticationValue =
      '3yvAC7GsXf0=aTYHa05XEI1S27tDikfZ6oVTZZSSOqt6MrBOWgDddhhOQlPWi4ibFWZPHQOPvjHQw9h6UyDzEqP5Nq+Q+Uu1+GfWBwAMF4Pan1/5LRzi8QWUew1r8riiNRlGNlW5ZcxSpCrCMi0XOSC/AcacRVDZBVb74AqkQQD5OV/VHxNljeUBk1UdVgqMqyZsVlmPZzOFe5Xi41e9rrMzIPSl4HXlregm7x8wQ3Az';

  Future<http.Response> getMenu() async {
    var body = jsonEncode({
      "taskType": "GetMenu",
      "params": {
        "sync": {"objectId": 582850001, "timeout": 100}
      }
    });

    var headers = {
      'AggregatorAuthentication': aggregatorAuthenticationValue,
      'Content-Type': 'application/json',
    };

    var response =
        await http.post(Uri.parse(url), headers: headers, body: body);
    return response;
  }
}
