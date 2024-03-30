import 'dart:io';

import '../../models/api_response.dart';
import '../../preferences/shared_pref_controller.dart';



mixin ApiHelper {
  ApiResponse get failedResponse =>
      ApiResponse(message: 'something went wrong, try again!', status: 500);

  Map<String, String> get headers {
    return {
      'Accept-Language' : SharedPrefController().lang1,
      HttpHeaders.authorizationHeader: SharedPrefController().token,
      HttpHeaders.contentTypeHeader: 'application/json',
      // HttpHeaders.acceptHeader: 'application/json; charset=UTF-8',
    };
  }


  Map<String, String> get headersPrimary {
    return {
      'Accept-Language' : SharedPrefController().lang1,
      HttpHeaders.authorizationHeader: SharedPrefController().primaryToken,
      HttpHeaders.contentTypeHeader: 'application/json',

    };
  }
  Map<String, String> get headersTeacher {
    return {
      'Accept-Language' : SharedPrefController().lang1,
      'CenterId' : "\"${SharedPrefController().centerId}\"",
      HttpHeaders.authorizationHeader: SharedPrefController().primaryToken,
      HttpHeaders.contentTypeHeader: 'application/json',
      // HttpHeaders.acceptHeader: 'application/json; charset=UTF-8',
    };
  }
}
