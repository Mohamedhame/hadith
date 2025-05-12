import 'package:flutter/material.dart';
import 'package:hadith/controller/theme_controller.dart';
import 'package:hadith/view/widgets/custom_icon.dart';

class BottomSheetCustomization extends StatelessWidget {
  const BottomSheetCustomization({
    super.key,
    required this.theme,
    required this.value,
    this.onChanged,
    this.pressAdd,
    this.pressRemove,
    this.data,
    this.max = 1.0,
    this.min = 0.0,
    this.onPressedOnItem,
    this.widget,
  });

  final ThemeController theme;
  final double value;
  final List? data;
  final void Function(double)? onChanged;
  final void Function()? pressAdd;
  final void Function()? pressRemove;
  final double max;
  final double min;
  final void Function(int)? onPressedOnItem;
  final Widget? widget;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: CustomIcon(
              theme: theme,
              icon: Icons.close,
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              textDirection: TextDirection.rtl,
              children: [
                CustomIcon(theme: theme, icon: Icons.add, onTap: pressAdd),
                Expanded(
                  child: Directionality(
                    textDirection: TextDirection.ltr,
                    child: Slider(
                      value: value,
                      max: max,
                      min: min,
                      onChanged: onChanged,
                    ),
                  ),
                ),
                CustomIcon(
                  theme: theme,
                  icon: Icons.remove,
                  onTap: pressRemove,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  if (data != null)
                    ...List.generate(data!.length, (index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: theme.fontColor,
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              onTap: () {
                                onPressedOnItem?.call(index);
                              },
                              child: Text(
                                data![index].toString(),
                                style: TextStyle(color: theme.primaryColor),
                              ),
                            ),
                          ),
                        ),
                      );
                    }),

                  if (widget != null) widget!,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
