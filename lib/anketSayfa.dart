import 'dart:math';

import 'package:beansocial/footerr.dart';
import 'package:beansocial/header.dart';
import 'package:flutter/material.dart';

// Soru tipi enum'u
enum QuestionType {
  multipleChoice,
  yesNo,
  scale,
}

// Soru modelimiz
class SurveyQuestion {
  final String question;
  final QuestionType type;
  final List<String>? options; // sadece multipleChoice için
  SurveyQuestion({
    required this.question,
    required this.type,
    this.options,
  });
}

class CoffeeSurveyPage extends StatefulWidget {
  const CoffeeSurveyPage({super.key});

  @override
  _CoffeeSurveyPageState createState() => _CoffeeSurveyPageState();
}

class _CoffeeSurveyPageState extends State<CoffeeSurveyPage> {
  // 30 soruluk havuz
  final List<SurveyQuestion> allQuestions = [
    SurveyQuestion(
      question: "Yumuşak içim kahve sever misiniz?",
      type: QuestionType.yesNo,
    ),
    SurveyQuestion(
      question: "Sütlü kahveleri tercih eder misiniz?",
      type: QuestionType.yesNo,
    ),
    SurveyQuestion(
      question: "Kahvede asidite tercihinizi 1-10 arasında belirtiniz.",
      type: QuestionType.scale,
    ),
    SurveyQuestion(
      question: "Hangi kahve türünü daha çok tercih edersiniz?",
      type: QuestionType.multipleChoice,
      options: ["Espresso", "Latte", "Filtre Kahve", "Türk Kahvesi"],
    ),
    // TODO: 26 tane daha soru ekle...
  ];

  // Rastgele seçilmiş 10 soru
  late List<SurveyQuestion> selectedQuestions;
  // Cevapları tutan map
  final Map<int, dynamic> answers = {};

  @override
  void initState() {
    super.initState();
    selectedQuestions = _generateRandomQuestions();
  }

  // 30 soruyu karıştırıp 10 tanesini al
  List<SurveyQuestion> _generateRandomQuestions() {
    final random = Random();
    final shuffled = [...allQuestions]..shuffle(random);
    return shuffled.take(10).toList();
  }

  void _submitSurvey() {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text("Teşekkürler!"),
        content: const Text("Cevaplarınız kaydedildi ☕"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(dialogContext).pop(); // Dialog'u kapat
              Future.delayed(const Duration(milliseconds: 100), () {
                Navigator.of(context).pushNamedAndRemoveUntil(
                  '/AnaSayfa',
                  (route) => false,
                );
              });
            },
            child: const Text("Tamam"),
          )
        ],
      ),
    );
  }

  // Her soru tipi için uygun widget'ı oluştur
  Widget _buildQuestionCard(int index, SurveyQuestion question) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 4,
      color: Colors.brown[50],
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              question.question,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.brown[800],
              ),
            ),
            const SizedBox(height: 10),
            if (question.type == QuestionType.multipleChoice &&
                question.options != null)
              ...question.options!.map((opt) => RadioListTile<String>(
                    title: Text(opt),
                    value: opt,
                    groupValue: answers[index],
                    activeColor: Colors.brown[400],
                    onChanged: (val) => setState(() => answers[index] = val),
                  )),
            if (question.type == QuestionType.yesNo)
              Row(
                children: ["Evet", "Hayır"].map((opt) {
                  return Expanded(
                    child: RadioListTile<String>(
                      title: Text(opt),
                      value: opt,
                      groupValue: answers[index],
                      activeColor: Colors.brown[400],
                      onChanged: (val) => setState(() => answers[index] = val),
                    ),
                  );
                }).toList(),
              ),
            if (question.type == QuestionType.scale)
              Column(
                children: [
                  Slider(
                    min: 1,
                    max: 10,
                    divisions: 9,
                    value: (answers[index] ?? 5).toDouble(),
                    label: "${answers[index] ?? 5}",
                    onChanged: (val) =>
                        setState(() => answers[index] = val.round()),
                    activeColor: Colors.brown[300],
                  ),
                  Text("Seçilen seviye: ${answers[index] ?? 5}"),
                ],
              ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: Header(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 300, vertical: 20),
              child: Column(
                children: [
                  ...selectedQuestions.asMap().entries.map(
                      (entry) => _buildQuestionCard(entry.key, entry.value)),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _submitSurvey,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.brown[700],
                      padding: const EdgeInsets.all(20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      "Anketi Gönder",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Footerr(children: []),
          ],
        ),
      ),
    );
  }
}
