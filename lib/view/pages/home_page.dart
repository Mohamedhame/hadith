import 'package:flutter/material.dart';
import 'package:hadith/controller/theme_controller.dart';
import 'package:hadith/utilities/routes.dart';
import 'package:hadith/view/widgets/custom_button.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeController>(context);
    return Scaffold(
      backgroundColor: theme.primaryColor,
      body: Center(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: InkWell(
                    onTap: () {
                      theme.toggleTheme();
                    },
                    child: Icon(
                      theme.isLight ? Icons.light_mode : Icons.dark_mode,
                      color: theme.fontColor,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 50),
              Expanded(
                child: Column(
                  children: [
                    const SizedBox(height: 70),

                    const SizedBox(height: 70),
                    CustomButton(
                      textButton: "الحديث النبوي الشريف",
                      onTap: () {
                        Navigator.of(context).pushNamed(AppRoutes.listOfBooks);
                      },
                    ),
                    CustomButton(
                      textButton: "حصن المسلم",
                      onTap: () async {
                        Navigator.of(context).pushNamed(AppRoutes.showAzkar);
                      },
                    ),
                    CustomButton(
                      textButton: "السبحة",
                      onTap: () {
                        Navigator.of(context).pushNamed(AppRoutes.counter);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
