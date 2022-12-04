import 'package:flutter/material.dart';
const List<BoxShadow> boxShadow = [
  BoxShadow(
    color: Colors.black,
    offset: Offset(0, .2),
    blurRadius: 4.0,
    blurStyle: BlurStyle.outer,
  )
];
class CustomButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  const CustomButton({ Key? key,  required this.title, required this.onTap}): super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(20.0),
        height: 50.0,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.yellow,
          boxShadow: boxShadow,
          borderRadius: BorderRadius.circular(25.0)
        ),
        alignment: Alignment.center,
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w600,
            color: Colors.black
          ),
        ),
      ),
    );
  }

}