import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final Color colors;

  const MyButton(
      {Key? key,
      required this.title,
      required this.onPressed,
      this.colors = const Color(0xffa5a5a5)})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: InkWell(
          onTap: onPressed,
          child: Container(
            height: 70,
            decoration: BoxDecoration(
              color: colors,
              shape: BoxShape.circle,
            ),
            child: Center(
                child: Text(
              title,
              style: const TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.w400),
            )),
          ),
        ),
      ),
    );
  }
}
