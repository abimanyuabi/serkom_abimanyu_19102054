import 'package:flutter/material.dart';
import 'package:flutter_app/utility/adaptive_size.dart';
import 'package:flutter_app/utility/color_utils.dart';
import 'package:flutter_app/utility/enums.dart';

Widget customRadioButton({
  required BuildContext context,
  required ValueNotifier<enumJenisKelamin> customRadioController,
  required enumJenisKelamin controlledValue,
  double? outerCircleDiameter,
  double? innerCircleDiameter,
  double? circleBodyBorder,
}) {
  AdaptSize.size(context: context);

  return Padding(
    padding: EdgeInsets.all(AdaptSize.pixel8),
    child: ValueListenableBuilder<enumJenisKelamin>(
      valueListenable: customRadioController,
      builder: ((context, value, child) {
        return InkWell(
          onTap: (() {
            customRadioController.value = controlledValue;
          }),
          child: SizedBox(
            height: outerCircleDiameter ?? AdaptSize.pixel40,
            width: outerCircleDiameter ?? AdaptSize.pixel40,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: outerCircleDiameter ?? AdaptSize.pixel40,
                    height: outerCircleDiameter ?? AdaptSize.pixel40,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: customRadioController.value == controlledValue
                            ? MyColor.secondary900
                            : MyColor.neutral900),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: outerCircleDiameter ?? AdaptSize.pixel20,
                    height: outerCircleDiameter ?? AdaptSize.pixel20,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color:
                                customRadioController.value == controlledValue
                                    ? MyColor.secondary400
                                    : MyColor.primary700,
                            width: 2),
                        shape: BoxShape.circle,
                        color: customRadioController.value == controlledValue
                            ? MyColor.secondary900
                            : MyColor.neutral900),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: outerCircleDiameter ?? AdaptSize.pixel12,
                    height: outerCircleDiameter ?? AdaptSize.pixel12,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: customRadioController.value == controlledValue
                            ? MyColor.secondary400
                            : MyColor.neutral900),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    ),
  );
}
