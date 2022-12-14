import 'package:flutter/material.dart';
import './side_fade_switcher.dart';

class CustomTextInput extends StatelessWidget {
  final String hintText;
  final void Function(String value) onChanged;
  final String? errorText;
  final bool obscureText;

  const CustomTextInput(
      {Key? key,
      required this.onChanged,
      required this.hintText,
      this.errorText,
      this.obscureText = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: const Color(0xFFD0D0D0), width: 1.5),
          ),
          child: TextField(
            onChanged: onChanged,
            obscureText: obscureText,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hintText,
              hintStyle: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
                color: Color(0xFFC2C2C2),
              ),
            ),
          ),
        ),
        SideFadeSwitcher(
          child: errorText != null
              ? Padding(
                  padding: const EdgeInsets.fromLTRB(16, 4, 16, 0),
                  child: Text(
                    errorText!,
                    style: TextStyle(color: Theme.of(context).errorColor),
                  ),
                )
              : const SizedBox.shrink(),
        )
      ],
    );
  }
}
