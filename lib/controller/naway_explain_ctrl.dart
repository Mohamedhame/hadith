import 'package:flutter/foundation.dart';
import 'package:hadith/service/fetch_data_from_json.dart';

class NawayExplainCtrl extends ChangeNotifier {
  NawayExplainCtrl({required this.title}) {
    loadData();
  }
  final String title;
  Map dataJson = {};
  bool isLoading = false;
  String chapterTitle = "";
  String body = "";
  String explain = "";
  String rawy = "";

  loadData() async {
    isLoading = true;
    dataJson = await FetchDataFromJson.loadExplainNawawy(title);
    chapterTitle = dataJson['chapterTitle'];
    body = dataJson['body'];
    explain = dataJson['explain'];
    isLoading = false;
    rawy = dataJson['rawy'];
    notifyListeners();
  }
}
