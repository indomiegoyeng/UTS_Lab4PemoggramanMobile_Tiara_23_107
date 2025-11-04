class Question {
  final String questionText;
  final List<String> options;
  final int correctAnswerIndex;

  Question({
    required this.questionText,
    required this.options,
    required this.correctAnswerIndex,
  });
}

List<Question> getQuizQuestions() {
  return [
    Question(
      questionText: 'Apa kepanjangan dari Flutter?',
      options: [
        'Fast Language UI Tool',
        'Framework untuk membuat UI',
        'Flutter adalah nama, bukan akronim',
        'Flexible User Interface'
      ],
      correctAnswerIndex: 2,
    ),
    Question(
      questionText: 'Widget apa yang digunakan untuk membuat tampilan yang tidak berubah?',
      options: [
        'StatefulWidget',
        'StatelessWidget',
        'DynamicWidget',
        'ChangeWidget'
      ],
      correctAnswerIndex: 1,
    ),
    Question(
      questionText: 'Bahasa pemrograman apa yang digunakan Flutter?',
      options: [
        'Java',
        'Kotlin',
        'Dart',
        'Swift'
      ],
      correctAnswerIndex: 2,
    ),
    Question(
      questionText: 'Method apa yang dipanggil pertama kali saat StatefulWidget dibuat?',
      options: [
        'build()',
        'initState()',
        'dispose()',
        'setState()'
      ],
      correctAnswerIndex: 1,
    ),
    Question(
      questionText: 'Widget apa yang digunakan untuk membuat daftar scrollable di Flutter?',
      options: [
        'Container',
        'Column',
        'ListView',
        'Stack'
      ],
      correctAnswerIndex: 2,
    ),
  ];
}