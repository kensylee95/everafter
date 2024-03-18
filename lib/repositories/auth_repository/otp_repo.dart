import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:remind_me/constants/texts/uri.dart';

class OtpRepo extends GetxController {
  OtpRepo get instance => Get.find();
  Future<dynamic> sendOtp(int userId) async {
    var client = http.Client();
    try {
      var response = await client.post(
        Uri.http(baseUrlString, resendEmail),
        body: {"id":userId.toString()},
      );
      if (response.statusCode == 200 && response.body.isNotEmpty) {
        //print(response.body);
        final Map<String, dynamic> responseData =  jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>;
        return responseData["isSent"];
      } else {
        throw Exception('Failed to send email');
      }
    } catch (e) {
     //throw Exception("an error occcured: $e");
     //print(e);
    } finally{
      client.close();
    }
  }
}
