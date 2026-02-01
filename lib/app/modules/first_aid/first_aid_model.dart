class FirstAidModel {
  final int id;
  final String question;
  final String answer;

  FirstAidModel({required this.id, required this.question, required this.answer});

  factory FirstAidModel.fromJson(Map<String, dynamic> json) {
    return FirstAidModel(
      id: json['id'] ?? 0,
      question: json['question'] ?? '',
      answer: json['answer'] ?? '',
    );
  }
}