import 'package:flutter/material.dart';

class quizscreen extends StatefulWidget {
  final String name;
  final String nim;

  const quizscreen({
    Key? key,
    required this.name,
    required this.nim,
  }) : super(key: key);

  @override
  State<quizscreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<quizscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz'),
        backgroundColor: const Color(0xFFD4B5E8),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nama: ${widget.name}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'NIM: ${widget.nim}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 24),
            const Text(
              'Quiz dimulai...',
              style: TextStyle(fontSize: 20),
            ),
            // Tambahkan konten quiz Anda di sini
          ],
        ),
      ),
    );
  }
}