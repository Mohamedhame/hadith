import 'package:flutter/material.dart';
import 'package:hadith/controller/counter_ctrl.dart';
import 'package:hadith/view/widgets/counter/custom_suffix_icon_counter.dart';
import 'package:hadith/view/widgets/custom_text_form_filed.dart';

class CusomFieldInputInCounter extends StatelessWidget {
  const CusomFieldInputInCounter({super.key, required this.model});

  final CounterCtrl model;

  @override
  Widget build(BuildContext context) {
    return Row(
      textDirection: TextDirection.rtl,
      children: [
        Expanded(
          child: CustomTextFormField(
            readOnly: true,
            controller: model.zekr,
            suffixIcon: CustomSuffixIconCuonter(),
          ),
        ),
        SizedBox(
          width: 80,
          child: CustomTextFormField(
            controller: model.count,
            isNumber: true,
            onChanged: (value) {
              model.resetCounter();
            },
          ),
        ),
      ],
    );
  }
}
