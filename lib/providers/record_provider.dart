import 'package:flutter/material.dart';
import 'package:spend_tracker/models/record_model.dart';

class RecordProvider extends ChangeNotifier {
  // ignore: unused_field
   List<RecordModel> _recordsList = [];

   List<RecordModel> get recordsList => _recordsList;

  // Populate the list with data
   void populateList() {
    final List<Map<String, dynamic>> fetchedRecords = [
      {
        'id': 1,
        'type': 'Family',
        'subType': 'House',
        'description': 'Dinner at house',
        'amount': 100000,
        'currency': 'LBP',
        'dateCreated': '4-2-2024',
      },
      {
        'id': 2,
        'type': 'Food',
        'subType': 'Meal',
        'description': 'Sandwich Lunch',
        'amount': 5.5,
        'currency': 'USD',
        'dateCreated': '1-2-2024',
      },
      {
        'id': 3,
        'type': 'Activity',
        'subType': '',
        'description': '',
        'amount': 20,
        'currency': 'USD',
        'dateCreated': '20-1-2024',
      },
    ];

    fetchedRecords.forEach((json) {
      recordsList.add(RecordModel.fromJson(json));
    });
    notifyListeners();
  }

  // Get one record from List
  RecordModel getRecordById(String id) {
    try {
      return recordsList.firstWhere((record) => record.id == id);
    } catch (e) {
      throw Exception('Record with ID $id not found');
    }
  }

  // Add record to List
  void addRecord(RecordModel record) {
    try {
      recordsList.add(record);
      notifyListeners();
    } catch (err) {
      throw Exception('Error adding the record to the provider list');
    }
  }

  // Remove record from List
  void removeRecord(int id) {
    recordsList.removeWhere((record) => record.id == id);
    notifyListeners();
  }

  // Update record in List
  void updateRecord(int id, RecordModel newRecord) {
    int index = recordsList.indexWhere((record) => record.id == id);
    if (index != -1) {
      recordsList[index] = newRecord;
      notifyListeners();
    } else {
      throw Exception('Record with ID $id not found');
    }
  }
}
