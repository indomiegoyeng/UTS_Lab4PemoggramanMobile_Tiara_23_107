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
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.03,
              vertical: screenWidth * 0.015,
            ),
            decoration: BoxDecoration(
              color: const Color(0xFF3498DB).withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              'Pertanyaan $questionNumber',
              style: TextStyle(
                fontSize: isTablet ? 16 : screenWidth * 0.035,
                color: const Color(0xFF3498DB),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(height: screenWidth * 0.03),
          Text(
            questionText,
            style: TextStyle(
              fontSize: isTablet ? 20 : screenWidth * 0.045,
              color: const Color(0xFF2C3E50),
              fontWeight: FontWeight.w600,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }
}