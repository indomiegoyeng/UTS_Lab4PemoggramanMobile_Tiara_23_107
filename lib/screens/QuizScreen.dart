import 'package:flutter/material.dart';
import '../models/model.dart';
import '../widgets/question_card.dart';
import '../widgets/score_board.dart';
import '../widgets/answer_button.dart';
import '../widgets/background.dart';
import '../screens/ResultScreen.dart';

class QuizScreen extends StatefulWidget {
  final String name;
  final String nim;

  const QuizScreen({
    Key? key,
    required this.name,
    required this.nim,
  }) : super(key: key);

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  final List<Question> _questions = getQuizQuestions();
  int _currentQuestionIndex = 0;
  int _score = 0;
  int? _selectedAnswerIndex;
  bool _hasAnswered = false;

  void _selectAnswer(int index) {
    if (!_hasAnswered) {
      setState(() {
        _selectedAnswerIndex = index;
      });
    }
  }

  void _submitAnswer() {
    if (_selectedAnswerIndex == null || _hasAnswered) return;

    setState(() {
      _hasAnswered = true;
      if (_selectedAnswerIndex == _questions[_currentQuestionIndex].correctAnswerIndex) {
        _score += 20;
      }
    });
  }

  void _nextQuestion() {
    if (_currentQuestionIndex < _questions.length - 1) {
      setState(() {
        _currentQuestionIndex++;
        _selectedAnswerIndex = null;
        _hasAnswered = false;
      });
    } else {
      // Navigate to result screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ResultScreen(
            name: widget.name,
            nim: widget.nim,
            score: _score,
            totalQuestions: _questions.length,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isTablet = screenWidth > 600;
    final currentQuestion = _questions[_currentQuestionIndex];

    return Scaffold(
      body: Background(
        child: SafeArea(
          child: Center(
            child: Container(
              constraints: BoxConstraints(
                maxWidth: isTablet ? 600 : double.infinity,
              ),
              child: Column(
                children: [
                  // Score Board
                  ScoreBoard(
                    score: _score,
                    currentQuestion: _currentQuestionIndex + 1,
                    totalQuestions: _questions.length,
                  ),

                  // Question Content
                  Expanded(
                    child: SingleChildScrollView(
                      padding: EdgeInsets.all(screenWidth * 0.05),
                      child: Column(
                        children: [
                          // Question Card
                          QuestionCard(
                            questionNumber: _currentQuestionIndex + 1,
                            questionText: currentQuestion.questionText,
                          ),
                          SizedBox(height: screenHeight * 0.03),

                          // Answer Options
                          ...List.generate(
                            currentQuestion.options.length,
                                (index) => Padding(
                              padding: EdgeInsets.only(bottom: screenHeight * 0.015),
                              child: _buildAnswerOption(
                                context,
                                currentQuestion.options[index],
                                index,
                                currentQuestion.correctAnswerIndex,
                              ),
                            ),
                          ),

                          SizedBox(height: screenHeight * 0.03),

                          // Answer Button
                          if (!_hasAnswered && _selectedAnswerIndex != null)
                            AnswerButton(
                              onPressed: _submitAnswer,
                              isTablet: isTablet,
                            ),

                          // Next Button
                          if (_hasAnswered)
                            SizedBox(
                              width: double.infinity,
                              height: isTablet ? 60 : screenHeight * 0.065,
                              child: ElevatedButton(
                                onPressed: _nextQuestion,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF3498DB),
                                  foregroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  elevation: 3,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      _currentQuestionIndex < _questions.length - 1
                                          ? 'Lanjut'
                                          : 'Lihat Hasil',
                                      style: TextStyle(
                                        fontSize: isTablet ? 20 : screenWidth * 0.045,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(width: screenWidth * 0.02),
                                    Icon(
                                      Icons.arrow_forward,
                                      size: isTablet ? 24 : screenWidth * 0.05,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                        ],
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

  Widget _buildAnswerOption(
      BuildContext context,
      String optionText,
      int index,
      int correctIndex,
      ) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isTablet = screenWidth > 600;
    final isSelected = _selectedAnswerIndex == index;
    final isCorrect = index == correctIndex;

    Color backgroundColor;
    Color borderColor;
    Color textColor = Colors.black;
    Widget? trailingIcon;

    if (_hasAnswered) {
      if (isCorrect) {
        backgroundColor = const Color(0xFF2ECC71);
        borderColor = const Color(0xFF27AE60);
        textColor = Colors.white;
        trailingIcon = const Icon(
          Icons.check_circle,
          color: Colors.white,
          size: 24,
        );
      } else if (isSelected && !isCorrect) {
        backgroundColor = const Color(0xFFE74C3C);
        borderColor = const Color(0xFFC0392B);
        textColor = Colors.white;
      } else {
        backgroundColor = Colors.white;
        borderColor = Colors.grey.shade300;
      }
    } else {
      if (isSelected) {
        backgroundColor = const Color(0xFF3498DB);
        borderColor = const Color(0xFF2980B9);
        textColor = Colors.white;
      } else {
        backgroundColor = Colors.white;
        borderColor = Colors.grey.shade300;
      }
    }

    return InkWell(
      onTap: () => _selectAnswer(index),
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.04,
          vertical: screenHeight * 0.02,
        ),
        decoration: BoxDecoration(
          color: backgroundColor,
          border: Border.all(color: borderColor, width: 2),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                optionText,
                style: TextStyle(
                  fontSize: isTablet ? 16 : screenWidth * 0.04,
                  color: textColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            if (trailingIcon != null) trailingIcon,
          ],
        ),
      ),
    );
  }
}