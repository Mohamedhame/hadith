import 'package:flutter/material.dart';
import 'package:hadith/service/fetch_data_from_json.dart';

class ShowIndexOfAzkarCtrl extends ChangeNotifier {
  ShowIndexOfAzkarCtrl() {
    loadData();
  }
  List titleOfAzkar = [];
  bool isLoading = false;

  loadData() async {
    isLoading = true;
    titleOfAzkar = await FetchDataFromJson.loadJsonAzkar();
    isLoading = false;
    notifyListeners();
  }
}
