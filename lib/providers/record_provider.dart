import 'package:flutter/material.dart';
import 'package:spend_tracker/models/record_model.dart';
import 'package:spend_tracker/services/http_service.dart'; // Import your HTTP service file

class RecordProvider extends ChangeNotifier {
  List<RecordModel> _recordsList = [];

  List<RecordModel> get recordsList => _recordsList;

  final HttpService _httpService = HttpService();

  // Fetch all records from the server
  Future<void> fetchRecords() async {
    try {
      List<RecordModel> records = await _httpService.getRecords();
      _recordsList = records;
      notifyListeners();
    } catch (e) {
      throw Exception('Failed to fetch records: $e');
    }
  }

  // Add record to List
  Future<void> addRecord(Map<String, dynamic> recordDetails) async {
    try {
      RecordModel newRecord = await _httpService.createRecord(recordDetails);
      _recordsList.add(newRecord);
      notifyListeners();
    } catch (e) {
      throw Exception('Error adding the record: $e');
    }
  }

  // Remove record from List
  Future<void> removeRecord(String id) async {
    try {
      await _httpService.deleteRecord(id);
      _recordsList.removeWhere((record) => record.sId == id);
      notifyListeners();
    } catch (e) {
      throw Exception('Error removing the record: $e');
    }
  }

  // Update record in List
  Future<void> updateRecord(String id, Map<String, dynamic> updatedRecordDetails) async {
    try {
      RecordModel newRecord = await _httpService.updateRecord(id, updatedRecordDetails);
      int index = _recordsList.indexWhere((record) => record.sId == id);
      if (index != -1) {
        _recordsList[index] = newRecord;
        notifyListeners();
      } else {
        throw Exception('Record with ID $id not found');
      }
    } catch (e) {
      throw Exception('Error updating the record: $e');
    }
  }
}
