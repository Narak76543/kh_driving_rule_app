class TransportModel {
  final int id;
  final String question;
  final String answer;

  TransportModel({required this.id, required this.question, required this.answer});

  factory TransportModel.fromJson(Map<String, dynamic> json) {
    return TransportModel(
      id: json['id'] ?? 0,
      question: json['question'] ?? '',
      answer: json['answer'] ?? '',
    );
  }
}