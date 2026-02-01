// class TrafficSignModel {
//   final int id;
//   final String title;
//   final String image;
//   final String description;
//   final String? note;
//
//   TrafficSignModel({
//     required this.id,
//     required this.title,
//     required this.image,
//     required this.description,
//     this.note,
//   });
//
//   factory TrafficSignModel.fromJson(Map<String, dynamic> json) {
//     return TrafficSignModel(
//       id: json['id'],
//       title: json['title'],
//       image: json['image'],
//       description: json['description'],
//       note: json['note'] ?? '',
//     );
//   }
// }

class TrafficSignModel {
  final String id;
  final String title;
  final String image;
  final String description;
  final String note; // ប្រាកដថាមានបន្ទាត់នេះ

  TrafficSignModel({
    required this.id,
    required this.title,
    required this.image,
    required this.description,
    required this.note,
  });

  factory TrafficSignModel.fromJson(Map<String, dynamic> json) {
    return TrafficSignModel(
      id: json['id'].toString(),
      title: json['title'] ?? '',
      image: json['image'] ?? '',
      description: json['description'] ?? '',
      // ត្រង់នេះសំខាន់បំផុត៖ បើក្នុង JSON គ្មាន note វានឹងឱ្យតម្លៃទទេ '' ជំនួសវិញ
      note: json['note'] ?? '',
    );
  }
}