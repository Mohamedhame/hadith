import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hadith/controller/theme_controller.dart';
import 'package:hadith/utilities/router.dart';
import 'package:hadith/utilities/routes.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => ThemeController())],
      child: MaterialApp(
        title: 'Hadith Nabowy',
        debugShowCheckedModeBanner: false,
         localizationsDelegates: [
          GlobalCupertinoLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        locale: Locale('ar'),
        supportedLocales: [Locale('ar'), Locale('en')],
        onGenerateRoute: onGenerateRoute,
        initialRoute: AppRoutes.homePage,
      ),
    );
  }
}
