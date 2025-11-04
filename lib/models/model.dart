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
      questionText: 'Dalam arsitektur Android, komponen yang bertanggung jawab untuk mengelola logika bisnis dan interaksi pengguna disebut:',
      options: [
        'Service',
        'Activity',
        'Broadcast Receiver',
        'Content Provider'
      ],
      correctAnswerIndex: 1, // Activity
    ),
    Question(
      questionText: 'Framework berikut yang digunakan untuk membuat aplikasi cross-platform (Android dan iOS sekaligus) adalah:',
      options: [
        'Android Studio',
        'Xcode',
        'Flutter',
        'Kotlin'
      ],
      correctAnswerIndex: 2, // Flutter
    ),
    Question(
      questionText: 'Komponen Android yang digunakan untuk menjalankan proses di latar belakang tanpa antarmuka pengguna disebut:',
      options: [
        'Fragment',
        'Activity',
        'Service',
        'Intent'
      ],
      correctAnswerIndex: 2, // Service
    ),
    Question(
      questionText: 'Dalam Flutter, widget yang digunakan untuk menampilkan teks di layar adalah:',
      options: [
        'Image',
        'Text',
        'Label',
        'StringView'
      ],
      correctAnswerIndex: 1, // Text
    ),
    Question(
      questionText: 'Dalam konteks mobile development, Firebase digunakan untuk:',
      options: [
        'Mendesain tampilan antarmuka aplikasi',
        'Mengelola database, autentikasi, dan analitik aplikasi',
        'Mengedit file layout',
        'Membuat animasi UI'
      ],
      correctAnswerIndex: 1, // Mengelola database, autentikasi, dan analitik aplikasi
    ),
  ];
}