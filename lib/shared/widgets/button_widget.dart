import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String label;
  final Color backgroudColor;
  final Color fontColor;
  final VoidCallback onPressed;

  const ButtonWidget({
    Key? key,
    required this.label,
    required this.backgroudColor,
    required this.fontColor,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 52, vertical: 10),
      child: Container(
        height: 55,
        width: 270,
        child: TextButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(this.backgroudColor),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(38),
              ),
            ),
          ),
          onPressed: this.onPressed,
          child: Text(
            this.label,
            style: TextStyle(
              color: this.fontColor,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
