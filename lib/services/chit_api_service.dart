import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

import 'api_services.dart';

class ChitApiService {


  static const String baseUrl = 'https://chitsoft.in/wapp/api/mobile3/';


  Future<Map<String, dynamic>> loginCheck(String mobile) async {
    final response = await http.post(
      Uri.parse('${baseUrl}501'),
      body: {'mobile': mobile},
    );
    return jsonDecode(response.body);
  }

  Future<Map<String, dynamic>> sendOtpLogin(String mobile) async {
    final response = await http.post(
      Uri.parse('${baseUrl}502'),
      body: {'mobile': mobile},
    );
    return jsonDecode(response.body);
  }

  Future<Map<String, dynamic>> verifyOtp(String mobile, String otp) async {
    final response = await http.post(
      Uri.parse('${baseUrl}503'),
      body: {'mobile': mobile, 'otp': otp},
    );
    return jsonDecode(response.body);
  }

  Future<Map<String, dynamic>> getMyChitDetails(String cusId) async {
    final response = await http.post(
      Uri.parse('${baseUrl}507'),
      body: {'cus_id': cusId},
    );
    return jsonDecode(response.body);
  }

  Future<void> fetchChitList() async {
    final url = Uri.parse('https://chitsoft.in/wapp/api/mobile3/');

    try {
      final response = await http.post(
        url,
        body: {
          'type': '508',
          'cid': '98387658',
          'cus_id': globalCustomerId,
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        print('API Response: $data');
        // Do something with the data
      } else {
        print('Server error: ${response.statusCode}');
      }
    } catch (e) {
      print('Network error: $e');
    }
  }

  // whatsapp api

  Future<void> fetchSettings() async {

  }

  // dialer api
  void _launchDialer(String phoneNumber) async {
    final url = 'tel:$phoneNumber';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch dialer';
    }
  }

  //fetch chit list

  Future<void> GetChitList() async {
    final url = Uri.parse('https://chitsoft.in/wapp/api/mobile3/');

    try {
      final response = await http.post(
        url,
        body: {
          'type': '508',
          'cid': '98387658',
          'cus_id': '136',
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        print('API Response: $data');
        // Do something with the data
      } else {
        print('Server error: ${response.statusCode}');
      }
    } catch (e) {
      print('Network error: $e');
    }
  }

}
