import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kainok_app/core/utils/color_constant.dart';

class CustomRadioWidget<T> extends StatelessWidget {
  final T value;
  final T? groupValue;
  final ValueChanged<T> onChanged;
  final double width;
  final double height;

  CustomRadioWidget({
    required this.value,
    required this.groupValue,
    required this.onChanged,
    this.width = 22,
    this.height = 21,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 1.0, right: 9),
      child: GestureDetector(
        onTap: () {
          onChanged(value);
        },
        child: Container(
          height: height,
          width: width,
          decoration: ShapeDecoration(
            shape: CircleBorder(
              side: BorderSide(
                color: value == groupValue
                    ? ColorConstant.black900
                    : ColorConstant.black90026, // Specify the border color here
                width: 1.0, // Specify the border width here
              ),
            ),
            color: value == groupValue ? ColorConstant.black900 : null,
          ),
          child: Center(
            child: Container(
              height: height - 12,
              width: width - 5,
              decoration: ShapeDecoration(
                shape: CircleBorder(),
                color: value == groupValue ? ColorConstant.whiteA700 : null,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
