class VehicleTechModel {
  final int id;
  final String question;
  final String answer;

  VehicleTechModel({
    required this.id,
    required this.question,
    required this.answer,
  });

  factory VehicleTechModel.fromJson(Map<String, dynamic> json) {
    return VehicleTechModel(
      id: json['id'] ?? 0,
      question: json['question'] ?? '',
      answer: json['answer'] ?? '',
    );
  }
}