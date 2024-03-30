import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:marsous/data/api/api_helper.dart';
import 'package:marsous/data/api/api_settings.dart';
import 'package:marsous/models/banner_model.dart';

class BannerApiController with ApiHelper {
  Future<List<BannerModel>> getBanners() async {
    var url = Uri.parse("${ApiSettings.baseUrl}/Marsous/get-banners");
    var response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      if (jsonData["status"] == 200) {
        return List<BannerModel>.from(
          jsonData["data"].map(
            (x) => BannerModel.fromJson(x),
          ),
        );
      }
    }
    return [];
  }
}
