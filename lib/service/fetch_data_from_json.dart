import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:hadith/functions/clean_text.dart';

class FetchDataFromJson {
  // Get index of books
  static Future<List> loadJsonIndex(String book) async {
    List titleOfBooks = [];
    if (book != "nawawy") {
      final String jsonString = await rootBundle.loadString(
        'assets/data/$book/books.json',
      );
      List data = json.decode(jsonString);
      for (var element in data) {
        titleOfBooks.add({
          "id": data.indexOf(element) + 1,
          "title": element['book'][1]['name'],
        });
      }
    }
    return titleOfBooks;
  }

  // Get Nuse (Body) of Hadith
  static Future<List> fetchHadith(String book, int index) async {
    List hadith = [];
    final String jsonString = await rootBundle.loadString(
      'assets/data/$book/hadiths.json',
    );
    final data = json.decode(jsonString);
    List dataAll = data['$index'];
    for (var element in dataAll) {
      hadith.add({
        "chapterTitle": cleanHadithBody(element['hadith'][1]['chapterTitle']),
        "body": cleanHadithBody(element['hadith'][1]['body']),
        "id": book == "nawawy" ? element['id'] : null,
      });
    }
    if (book == "nawawy") {
      hadith.sort((a, b) => a['id'].compareTo(b['id']));
    }

    return hadith;
  }

  // Get Ahadith from hisn elmouslim
  static Future<List> loadJsonAzkar() async {
    final String jsonString = await rootBundle.loadString(
      'assets/data/adhkar.json',
    );
    final data = json.decode(jsonString);
    List dataAll = data;
    return dataAll;
  }

  static Future<Map> loadExplainNawawy(String title) async {
    Map dataJson = {};
    final String jsonString = await rootBundle.loadString(
      'assets/data/nawawy/hadiths.json',
    );
    final data = json.decode(jsonString);
    List dataAll = data['1'];
    for (var element in dataAll) {
      if (element['hadith'][1]['chapterTitle'] == title) {
        dataJson = {
          "chapterTitle": element['hadith'][1]['chapterTitle'],
          "body": element['hadith'][1]['body'],
          "explain": element['hadith'][1]['explain'],
          "rawy": element['hadith'][1]['rawy'],
        };
      }
    }
    return dataJson;
  }
}
