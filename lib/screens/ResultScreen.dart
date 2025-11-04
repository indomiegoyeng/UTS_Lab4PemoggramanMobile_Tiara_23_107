import 'package:flutter/material.dart';
import '../widgets/background.dart';
import '../screens/LoginScreen.dart';

class ResultScreen extends StatelessWidget {
  final String name;
  final String nim;
  final int score;
  final int totalQuestions;

  const ResultScreen({
    Key? key,
    required this.name,
    required this.nim,
    required this.score,
    required this.totalQuestions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isTablet = screenWidth > 600;
    final percentage = (score / (totalQuestions * 20) * 100).toInt();

    String resultMessage;
    IconData resultIcon;
    Color resultColor;

    if (percentage >= 80) {
      resultMessage = 'Luar Biasa!';
      resultIcon = Icons.emoji_events;
      resultColor = const Color(0xFFF39C12);
    } else if (percentage >= 60) {
      resultMessage = 'Bagus!';
      resultIcon = Icons.thumb_up;
      resultColor = const Color(0xFF3498DB);
    } else {
      resultMessage = 'Tetap Semangat!';
      resultIcon = Icons.lightbulb;
      resultColor = const Color(0xFFE74C3C);
    }

    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              constraints: BoxConstraints(
                maxWidth: isTablet ? 500 : screenWidth * 0.9,
              ),
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.05,
                vertical: screenHeight * 0.02,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Result Icon
                  Container(
                    padding: EdgeInsets.all(screenWidth * 0.08),
                    decoration: BoxDecoration(
                      color: resultColor.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      resultIcon,
                      size: isTablet ? 100 : screenWidth * 0.25,
                      color: resultColor,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.03),

                  // Result Message
                  Text(
                    resultMessage,
                    style: TextStyle(
                      fontSize: isTablet ? 36 : screenWidth * 0.08,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF2C3E50),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: screenHeight * 0.02),

                  // User Info Card
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(screenWidth * 0.05),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        _buildInfoRow(
                          Icons.person,
                          'Nama',
                          name,
                          screenWidth,
                          isTablet,
                        ),
                        SizedBox(height: screenHeight * 0.015),
                        _buildInfoRow(
                          Icons.badge,
                          'NIM',
                          nim,
                          screenWidth,
                          isTablet,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.03),

                  // Score Card
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(screenWidth * 0.06),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          const Color(0xFF3498DB),
                          const Color(0xFF2980B9),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF3498DB).withOpacity(0.3),
                          blurRadius: 15,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Text(
                          'Skor Akhir',
                          style: TextStyle(
                            fontSize: isTablet ? 20 : screenWidth * 0.045,
                            color: Colors.white.withOpacity(0.9),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.01),
                        Text(
                          '$score',
                          style: TextStyle(
                            fontSize: isTablet ? 72 : screenWidth * 0.18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.01),
                        Text(
                          'dari ${totalQuestions * 20} poin',
                          style: TextStyle(
                            fontSize: isTablet ? 18 : screenWidth * 0.04,
                            color: Colors.white.withOpacity(0.9),
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: screenWidth * 0.04,
                            vertical: screenHeight * 0.01,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            '$percentage%',
                            style: TextStyle(
                              fontSize: isTablet ? 24 : screenWidth * 0.05,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.04),

                  // Retry Button
                  SizedBox(
                    width: double.infinity,
                    height: isTablet ? 60 : screenHeight * 0.065,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                              (route) => false,
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF2ECC71),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 3,
                      ),
                      icon: Icon(
                        Icons.refresh,
                        size: isTablet ? 24 : screenWidth * 0.05,
                      ),
                      label: Text(
                        'Ulangi',
                        style: TextStyle(
                          fontSize: isTablet ? 20 : screenWidth * 0.045,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(
      IconData icon,
      String label,
      String value,
      double screenWidth,
      bool isTablet,
      ) {
    return Row(
      children: [
        Icon(
          icon,
          size: isTablet ? 24 : screenWidth * 0.05,
          color: const Color(0xFF3498DB),
        ),
        SizedBox(width: screenWidth * 0.03),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: isTablet ? 14 : screenWidth * 0.035,
                  color: const Color(0xFF95A5A6),
                ),
              ),
              Text(
                value,
                style: TextStyle(
                  fontSize: isTablet ? 18 : screenWidth * 0.04,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF2C3E50),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}