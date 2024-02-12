import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:spend_tracker/models/record_model.dart';

class HttpService {
  final String baseUrl = "http://10.0.2.2:8000/api/records/"; // refactor this url

  Future<List<RecordModel>> getRecords() async {
    // Define your headers here
    Map<String, String> headers = {
      'Content-Type': 'application/json', // Example header
      // Add more headers if needed
    };

    // Pass headers to the get method
    http.Response res = await http.get(
      Uri.parse(baseUrl),
      headers: headers,
    );

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);

      List<RecordModel> records = body
          .map((dynamic item) => RecordModel.fromJson(item))
          .toList();
      return records;
    } else {
      throw Exception("Failed to fetch records");
    }
  }
}
