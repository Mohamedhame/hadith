import 'package:flutter/material.dart';
import 'package:hadith/service/web_scraping.dart';

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
