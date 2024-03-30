import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:marsous/data/api/api_helper.dart';
import 'package:marsous/data/api/api_settings.dart';

import '../../../models/marsous_info_model.dart';

class MarsousInfoApiController with ApiHelper {
  Future<MarsousInfoModel?> getMarousInfo() async {
    var url = Uri.parse("${ApiSettings.baseUrl}/Marsous/get-marsous-info");
    var response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      if (jsonData["status"] == 200) {
        return MarsousInfoModel.fromJson(jsonData["data"]);
      }
    }
    return null;
  }
}
