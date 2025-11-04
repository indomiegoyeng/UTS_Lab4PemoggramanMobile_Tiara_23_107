import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  final VoidCallback onPressed;
  final bool isTablet;

  const AnswerButton({
    Key? key,
    required this.onPressed,
    required this.isTablet,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return SizedBox(
      width: double.infinity,
      height: isTablet ? 60 : screenHeight * 0.065,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 3,
        ),
        child: Text(
          'Answer',
          style: TextStyle(
            fontSize: isTablet ? 20 : screenWidth * 0.045,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5,
          ),
        ),
      ),
    );
  }
}