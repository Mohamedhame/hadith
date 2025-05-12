import 'package:flutter/cupertino.dart';
import 'package:hadith/utilities/routes.dart';
import 'package:hadith/view/pages/home_page.dart';
import 'package:hadith/view/pages/hadith/list_of_books.dart';
import 'package:hadith/view/pages/hadith/show_azkar.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.listOfBooks:
      return CupertinoPageRoute(
        builder: (_) => ListOfBooks(),
        settings: settings,
      );
    case AppRoutes.showAzkar:
      return CupertinoPageRoute(
        builder: (_) => ShowAzkar(),
        settings: settings,
      );
    default:
      return CupertinoPageRoute(
        builder: (_) => const HomePage(),
        settings: settings,
      );
  }
}
