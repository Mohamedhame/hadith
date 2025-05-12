import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:hadith/functions/clean_text.dart';
import 'package:http/http.dart' as http;
import 'package:hadith/constant/string.dart';

class WebScraping {
  static Future<List> fetchTextOfHaith(String book, int chapter) async {
    final url = Uri.parse(
      'https://hadithapi.com/api/hadiths/?apiKey=$apiKey&book=$book&chapter=$chapter',
    );
    List hadith = [];
    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        for (var element in data['hadiths']['data']) {
          hadith.add({
            "title": element['headingArabic'],
            "hadith": element['hadithArabic'],
          });
        }
      } else {
        print('خطأ في الاستجابة: ${response.statusCode}');
      }
    } catch (e) {
      print('حدث خطأ: $e');
    }
    return hadith;
  }

  //====================================

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
}
