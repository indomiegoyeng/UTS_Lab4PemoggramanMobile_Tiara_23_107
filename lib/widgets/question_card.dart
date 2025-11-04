import 'package:flutter/material.dart';

class QuestionCard extends StatelessWidget {
  final int questionNumber;
  final String questionText;

  const QuestionCard({
    Key? key,
    required this.questionNumber,
    required this.questionText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth > 600;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(screenWidth * 0.05),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.black,
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Question label
          Text(
            'Pertanyaan $questionNumber',
            style: TextStyle(
              fontSize: isTablet ? 14 : screenWidth * 0.035,
              color: const Color(0xFF3498DB),
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: screenWidth * 0.04),

          // Question text with border
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(screenWidth * 0.04),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              questionText,
              style: TextStyle(
                fontSize: isTablet ? 16 : screenWidth * 0.04,
                color: Colors.black,
                fontWeight: FontWeight.w600,
                height: 1.5,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}