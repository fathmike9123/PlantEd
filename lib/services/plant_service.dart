import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:planted/models/requests/plant_image_request.dart';
import 'package:planted/models/responses/plant_image_response.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:path/path.dart';

class _PlantUrls {
  static final String baseUrl = 'https://my-api.plantnet.org/';
  static final String identify = baseUrl + 'v2/identify/all';
}

class PlantService {
  String _getApiKey() {
    return dotenv.env['PLANT_API_KEY']!;
  }

  Future<PlantImageResponse> getPlantResults(PlantImageRequest request) async {
    Uri url = Uri.parse(_PlantUrls.identify + '?api-key=${_getApiKey()}');

    var stream = http.ByteStream(request.plantImage.openRead());
    stream.cast();

    var length = await request.plantImage.length();

    var multipartFile = new http.MultipartFile(
      'images',
      stream,
      length,
      filename: basename(request.plantImage.path),
      contentType: MediaType('image', 'jpeg'),
    );

    var postRequest = http.MultipartRequest('POST', url);
    postRequest.fields['organs'] = 'leaf';
    postRequest.files.add(multipartFile);

    http.StreamedResponse response = await postRequest.send();

    var stringResponse = await response.stream.bytesToString();
    Map<String, dynamic> decodedResponse = jsonDecode(stringResponse);
    return PlantImageResponse.fromJson(decodedResponse);
  }
}
