import 'package:flutter/material.dart';

import 'package:flutter_app/utility/color_utils.dart';

Widget labeledTextField(
    {required String fieldLabel,
    required double labelSize,
    required TextEditingController? textController,
    required double size,
    required String hintTexts}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      SizedBox(
        width: size,
        child: TextFormField(
          controller: textController,
          decoration: InputDecoration(
            hintText: hintTexts,
            hintStyle:
                TextStyle(fontSize: labelSize, fontWeight: FontWeight.w200),
            label: Text(
              fieldLabel,
              style:
                  TextStyle(fontSize: labelSize, fontWeight: FontWeight.w300),
            ),
            filled: true,
            //fillColor: MyColor.border,
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: MyColor.redColor,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: MyColor.redColor,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.black,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.black,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
    ],
  );
}
