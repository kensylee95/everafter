import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:remind_me/constants/texts/uri.dart';
class SignupRepo extends GetxController {
  static SignupRepo get instance => Get.find();
 

  //create new account request
  Future<dynamic> createAcount(Map<String, dynamic> userData) async {
    //instance of http client
    var client = http.Client();
    try {
      //send request data to backend and await response
      var response = await client.post(
        Uri.http(baseUrlString, signUpPath),
        body: userData,
      );
      //if we recieve success response and response data is not empty
      if (response.statusCode == 200 && response.body.isNotEmpty) {
        //decode response we received from backed and return it
        final Map<String, dynamic> responseData =
            jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>;
        return responseData;
      } else {
        //if we did not receive successful response and response is empty
        throw Exception('Failed to create user');
      }
    } catch (e) {
      //if exception occurs while handling the request
      //print(e);
    } finally {
      //close after handling the request
      client.close();
    }
  }

  //Check if username exists
  Future<dynamic> checkIfEmailExists(String email) async {
    //instance of http client
    var client = http.Client();
    try {
      //send request data to backend and await response from backend
      var response = await client.post(
        Uri.http(baseUrlString, checkUsernamePath),
        body: {"email": email},
      );

      //if we recieve success response and response data is not empty
      if (response.statusCode == 200 && response.body.isNotEmpty) {
        //decode response we received from backed
        final Map<String, dynamic> responseData =
            jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>;
        //return bool exists
        return responseData["exists"];
      } else {
        //if we did not receive successful response and response is empty
        throw Exception('Something went wrong');
      }
    } catch (e) {
      //if exception occurs while handling the request
      throw Exception(e);
    } finally {
      //close after handling the request
      client.close();
    }
  }

    //Check if provided otp matches the one in database for user with userId
  Future<dynamic> verifyOtp(String otp, int userId) async {
    //instance of http client
    var client = http.Client();
    try {
      //send request data to backend and await response from backend
      var response = await client.post(
        Uri.http(baseUrlString, otpRequestPath),
        body: {"otp": otp, "id":userId.toString()},
      );

      //if we recieve success response and response data is not empty
      if (response.statusCode == 200 && response.body.isNotEmpty) {
        //decode response we received from backed
        final Map<String, dynamic> responseData =
            jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>;
        //return is correct in db should return true response
        return responseData["isVerified"];
      } else {
        //if we did not receive successful response and response is empty
        throw Exception('Something went wrong');
      }
    } catch (e) {
      //if exception occurs while handling the request
      throw Exception(e);
    } finally {
      //close after handling the request
      client.close();
    }
  }
}
