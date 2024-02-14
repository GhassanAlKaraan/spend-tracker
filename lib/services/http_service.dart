import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:spend_tracker/models/record_model.dart';

class HttpService {
  final String baseUrl = "http://10.0.2.2:5900/api/v1";

  Future<List<RecordModel>> getRecords() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/records'));
      if (response.statusCode == 200) {
        final List<dynamic> body = jsonDecode(response.body)['data'];
        print(body);
        List<RecordModel> records = body
            .map((dynamic item) => RecordModel.fromJson(item))
            .toList();
        return records;
      } else {
        throw Exception("Failed to fetch records response.statusCode=${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Failed to fetch records: $e");
    }
  }

  Future<RecordModel> getRecordById(String id) async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/records/$id'));
      if (response.statusCode == 200) {
        return RecordModel.fromJson(jsonDecode(response.body)['data']);
      } else {
        throw Exception("Failed to fetch record");
      }
    } catch (e) {
      throw Exception("Failed to fetch record: $e");
    }
  }

  Future<RecordModel> createRecord(Map<String, dynamic> recordDetails) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/records'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(recordDetails),
      );
      if (response.statusCode == 201) {
        return RecordModel.fromJson(jsonDecode(response.body)['data']);
      } else {
        throw Exception("Failed to create record:");
      }
    } catch (e) {
      throw Exception("Failed to create record: $e");
    }
  }

  Future<RecordModel> updateRecord(String id, Map<String, dynamic> recordDetails) async {
    try {
      final response = await http.put(
        Uri.parse('$baseUrl/records/$id'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(recordDetails),
      );
      if (response.statusCode == 200) {
        return RecordModel.fromJson(jsonDecode(response.body)['data']);
      } else {
        throw Exception("Failed to update record");
      }
    } catch (e) {
      throw Exception("Failed to update record: $e");
    }
  }

  Future<void> deleteRecord(String id) async {
    try {
      final response = await http.delete(Uri.parse('$baseUrl/records/$id'));
      
      if (response.statusCode != 200) {
        throw Exception("Failed to delete record");
      }else{
        print('Record deleted');
      }
    } catch (e) {
      throw Exception("Failed to delete record: $e");
    }
  }
}
