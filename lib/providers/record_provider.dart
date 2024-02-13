import 'package:flutter/material.dart';
import 'package:spend_tracker/models/record_model.dart';

class RecordProvider extends ChangeNotifier {
  // ignore: unused_field
  List<RecordModel> _recordsList = [];

  List<RecordModel> get recordsList => _recordsList;

  // Populate the list with data
  void populateList() {
    //TODO: implement http getAll method

    // Dummy data
    final List<Map<String, dynamic>> fetchedRecords = [
      {
        'sId': '65cb805809391a9840127418',
        'type': 'Family',
        'reason': 'Support',
        'description': 'Help the family',
        'amount': 50,
        'currency': 'LBP',
        "lastUpdated": "2024-02-13T14:44:40.603Z",
      },
      {
        'sId': '65cb805809391a9840127118',
        'type': 'Transport',
        'reason': 'Van',
        'description': 'Get to home',
        'amount': 100000,
        'currency': 'LBP',
        "lastUpdated": "2024-01-13T12:44:40.603Z",
      },
      {
        'sId': '65cb805809391b9840127118',
        'type': 'Food',
        'reason': 'Meal',
        'description': 'To have lunch at work',
        'amount': 500000,
        'currency': 'LBP',
        "lastUpdated": "2024-01-13T14:00:40.603Z",
      },
    ];

    fetchedRecords.forEach((json) {
      recordsList.add(RecordModel.fromJson(json));
    });

    notifyListeners();
  }

  // Get one record from List
  RecordModel getRecordById(String id) {
    //TODO replace the code with http call method
    try {
      return recordsList.firstWhere((record) => record.sId == id);
    } catch (e) {
      throw Exception('Record with ID $id not found');
    }
  }

  // Add record to List
  void addRecord(RecordModel record) {
    //TODO replace the code with http call method
    try {
      recordsList.add(record);
      notifyListeners();
    } catch (err) {
      throw Exception('Error adding the record to the provider list');
    }
  }

  // Remove record from List
  void removeRecord(String id) {
    //TODO replace the code with http call method
    recordsList.removeWhere((record) => record.sId == id);
    notifyListeners();
  }

  // Update record in List
  void updateRecord(int id, RecordModel newRecord) {
    //TODO replace the code with http call method
    int index = recordsList.indexWhere((record) => record.sId == id);
    if (index != -1) {
      recordsList[index] = newRecord;
      notifyListeners();
    } else {
      throw Exception('Record with ID $id not found');
    }
  }
}
