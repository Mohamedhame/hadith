import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hadith/controller/theme_controller.dart';

class CustomTextSize extends StatelessWidget {
  const CustomTextSize({super.key, required this.theme});
  final ThemeController theme;
  @override
  Widget build(BuildContext context) {
    return Row(
      textDirection: TextDirection.rtl,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          "حجم الخط",
          style: GoogleFonts.amiri(color: theme.fontColor, fontSize: 18),
        ),
        SizedBox(width: 150),
        Text(
          theme.fontSize.toString(),
          style: TextStyle(color: theme.fontColor, fontSize: 18),
        ),
      ],
    );
  }
}
