import 'package:flutter/cupertino.dart';
import 'package:hadith/utilities/routes.dart';
import 'package:hadith/view/pages/home_page.dart';
import 'package:hadith/view/pages/list_of_books.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.listOfBooks:
      return CupertinoPageRoute(
        builder: (_) => ListOfBooks(),
        settings: settings,
      );
    default:
      return CupertinoPageRoute(
        builder: (_) => const HomePage(),
        settings: settings,
      );
  }
}
