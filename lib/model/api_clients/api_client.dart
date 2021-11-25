import 'dart:convert';
import 'dart:io';

import 'package:vet_project/model/entity/region.dart';

class ApiClient {

  final client = HttpClient();

  Future<List<Region>> getApiRegions() async{
    final json = await get('https://admin.vetqyzmet.kz/api/v1/getInfo') as List<dynamic>;

    final regions = json
        .map((dynamic r) => Region.fromJson(r as Map<String, dynamic>))
        .toList();

    return regions;
  }

  Future<dynamic> get(String urlArg) async {
    final url = Uri.parse(urlArg);
    final request = await client.getUrl(url);
    final response = await request.close();

    final jsonStrings = await response.transform(utf8.decoder).toList();
    final jsonString = jsonStrings.join();
    final dynamic json = jsonDecode(jsonString);
    return json;
  }

}